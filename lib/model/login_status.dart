import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/LoginPlatform.dart';

part 'login_status.freezed.dart';
part 'login_status.g.dart';

@freezed
class LoginStatus with _$LoginStatus {
  const factory LoginStatus({
    required bool loginStatus,
    required LoginPlatform loginPlatform,
  }) = _LoginStatus;

  factory LoginStatus.fromJson(Map<String, dynamic> json) => _$LoginStatusFromJson(json);
}
