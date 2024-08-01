import 'dart:developer';
import 'package:cose_front/providers/user/theme_provider.dart';
import 'package:cose_front/route/route.dart';
import 'package:cose_front/utils/app_strings.dart';
import 'package:cose_front/utils/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'utils/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// 네이버맵 및 카카오 초기화
  await dotenv.load(fileName: '.env');
  await NaverMapSdk.instance.initialize(
    clientId: dotenv.env['NAVER_MAP_CLIENT_ID'],
    onAuthFailed: (e) => log("네이버 맵 인증 오류 : $e", name: "onAuthFailed"),
  );
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY']);

  /// 내장 DB 초기화
  var dbHelper = LocalDatabaseHelper.instance;
  await dbHelper.recreateDatabase();

  /// 디바이스 저장소 초기화
  // const storage = FlutterSecureStorage();
  // if (kDebugMode) {
  //   storage.deleteAll();
  // }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeMode = ref.watch(themeNotifierProvider);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          routerConfig: router,
        );
      },
    );
  }
}

