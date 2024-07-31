import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/storage_service.dart';

String getBaseURL() {
  if (Platform.isAndroid) {
    return "http://10.0.2.2:8080";
  } else {
    return "http://localhost:8080";
  }
}

class TokenDioClient {
  final Dio _dio;
  static const storage = FlutterSecureStorage();

  TokenDioClient() : _dio = Dio(BaseOptions(baseUrl: getBaseURL())) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          print('Request URL: ${options.uri}');
          print('Request Headers: ${options.headers}');
          print('Request Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response Status Code: ${response.statusCode}');
          print('Response Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          print('Error: ${e.type}, ${e.message}');
          print('Error Response: ${e.response?.data}');
          if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
            if (await _refreshToken()) {
              print("Token refreshed successfully");
              return handler.resolve(await _retry(e.requestOptions));
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<String?> getAccessToken() async {
    String? tokenJson = await storage.read(key: 'token');
    if (tokenJson != null) {
      Map<String, dynamic> tokenMap = jsonDecode(tokenJson);
      Token token = Token.fromJson(tokenMap);
      return token.accessToken;
    }
    return null;
  }

  Future<String?> _getRefreshToken() async {
    String? tokenJson = await storage.read(key: 'token');
    if (tokenJson != null) {
      Map<String, dynamic> tokenMap = jsonDecode(tokenJson);
      Token token = Token.fromJson(tokenMap);
      return token.refreshToken;
    }
    return null;
  }

  Future<String?> _getEmail() async {
    String? email = await storage.read(key: 'email');
    print('Retrieved email: $email');
    return email;
  }

  Future<void> _saveToken(Token token) async {
    String tokenJson = jsonEncode(token.toJson());
    await storage.write(key: 'token', value: tokenJson);
  }

  Future<bool> _refreshToken() async {
    try {
      String? accessToken = await getAccessToken();
      String? refreshToken = await _getRefreshToken();
      String? email = await _getEmail();

      print('Attempting to refresh token');
      print('Current Access Token: $accessToken');
      print('Current Refresh Token: $refreshToken');
      print('Email: $email');

      if (accessToken == null || refreshToken == null || email == null) {
        print('Missing token or email information');
        return false;
      }

      final response = await _dio.post(
        '/auth/reissue',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: {
          'email': email,
          'refreshToken': refreshToken,
        },
      );

      print('Refresh Token Response: ${response.data}');

      if (response.statusCode == 200 && response.data['status'] == 'Success') {
        var data = response.data['data'];
        String newAccessToken = data['accessToken'];
        String newRefreshToken = data['refreshToken'];

        await _saveToken(Token(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        ));

        print('Token refreshed successfully');
        print('New Access Token: $newAccessToken');
        return true;
      } else {
        print('Failed to refresh token. Status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Token refresh failed: $e');
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Dio get dio => _dio;
}

class DioClient {
  final Dio _dio;

  DioClient() : _dio = Dio(BaseOptions(baseUrl: getBaseURL())) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request URL: ${options.uri}');
          print('Request Method: ${options.method}');
          print('Request Headers: ${options.headers}');
          print('Request Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response Status Code: ${response.statusCode}');
          print('Response Headers: ${response.headers}');
          if (response.data != null) {
            print('Response Data: ${_formatJson(response.data)}');
          }
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print('Error: ${e.type}, ${e.message}');
          print('Error Response Status Code: ${e.response?.statusCode}');
          print('Error Response Headers: ${e.response?.headers}');
          if (e.response?.data != null) {
            print('Error Response Data: ${_formatJson(e.response?.data)}');
          }
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;

  String _formatJson(dynamic json) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }
}