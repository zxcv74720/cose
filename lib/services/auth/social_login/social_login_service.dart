abstract class SocialLoginService {
  Future<Map<String, String>> login();
  Future<void> logout();
}