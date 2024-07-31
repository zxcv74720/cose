enum LoginPlatform {
  google,
  kakao,
  naver,
  local,
  none;

  LoginPlatform toLoginPlatform(String value) {
    switch (value) {
      case 'LoginPlatform.google':
        return LoginPlatform.google;
      case 'LoginPlatform.kakao':
        return LoginPlatform.kakao;
      case 'LoginPlatform.naver':
        return LoginPlatform.naver;
      case 'LoginPlatform.local':
        return LoginPlatform.local;
      default:
        return LoginPlatform.none;
    }
  }
}
