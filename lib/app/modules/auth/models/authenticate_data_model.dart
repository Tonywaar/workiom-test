class AuthenticateData {
  String? accessToken;
  String? encryptedAccessToken;
  num? expireInSeconds;
  bool? shouldResetPassword;
  dynamic passwordResetCode;
  bool? passwordExpired;
  num? userId;
  bool? requiresTwoFactorVerification;
  dynamic twoFactorAuthProviders;
  dynamic twoFactorRememberClientToken;
  dynamic returnUrl;
  String? refreshToken;
  num? refreshTokenExpireInSeconds;
  dynamic captchaResult;

  AuthenticateData({
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.shouldResetPassword,
    this.passwordResetCode,
    this.passwordExpired,
    this.userId,
    this.requiresTwoFactorVerification,
    this.twoFactorAuthProviders,
    this.twoFactorRememberClientToken,
    this.returnUrl,
    this.refreshToken,
    this.refreshTokenExpireInSeconds,
    this.captchaResult,
  });

  AuthenticateData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    encryptedAccessToken = json['encryptedAccessToken'];
    expireInSeconds = json['expireInSeconds'] as num?;
    shouldResetPassword = json['shouldResetPassword'];
    passwordResetCode = json['passwordResetCode'];
    passwordExpired = json['passwordExpired'];
    userId = json['userId'] as num?;
    requiresTwoFactorVerification = json['requiresTwoFactorVerification'];
    twoFactorAuthProviders = json['twoFactorAuthProviders'];
    twoFactorRememberClientToken = json['twoFactorRememberClientToken'];
    returnUrl = json['returnUrl'];
    refreshToken = json['refreshToken'];
    refreshTokenExpireInSeconds = json['refreshTokenExpireInSeconds'] as num?;
    captchaResult = json['captchaResult'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['encryptedAccessToken'] = encryptedAccessToken;
    data['expireInSeconds'] = expireInSeconds;
    data['shouldResetPassword'] = shouldResetPassword;
    data['passwordResetCode'] = passwordResetCode;
    data['passwordExpired'] = passwordExpired;
    data['userId'] = userId;
    data['requiresTwoFactorVerification'] = requiresTwoFactorVerification;
    data['twoFactorAuthProviders'] = twoFactorAuthProviders;
    data['twoFactorRememberClientToken'] = twoFactorRememberClientToken;
    data['returnUrl'] = returnUrl;
    data['refreshToken'] = refreshToken;
    data['refreshTokenExpireInSeconds'] = refreshTokenExpireInSeconds;
    data['captchaResult'] = captchaResult;
    return data;
  }
}
