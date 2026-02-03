class RegisterTenantData {
  num? tenantId;
  String? tenancyName;
  String? name;
  String? userName;
  String? emailAddress;
  bool? isTenantActive;
  bool? isActive;
  bool? isEmailConfirmationRequired;
  dynamic captchaResult;

  RegisterTenantData({
    this.tenantId,
    this.tenancyName,
    this.name,
    this.userName,
    this.emailAddress,
    this.isTenantActive,
    this.isActive,
    this.isEmailConfirmationRequired,
    this.captchaResult,
  });

  RegisterTenantData.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'] as num?;
    tenancyName = json['tenancyName'];
    name = json['name'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    isTenantActive = json['isTenantActive'];
    isActive = json['isActive'];
    isEmailConfirmationRequired = json['isEmailConfirmationRequired'];
    captchaResult = json['captchaResult'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tenantId'] = tenantId;
    data['tenancyName'] = tenancyName;
    data['name'] = name;
    data['userName'] = userName;
    data['emailAddress'] = emailAddress;
    data['isTenantActive'] = isTenantActive;
    data['isActive'] = isActive;
    data['isEmailConfirmationRequired'] = isEmailConfirmationRequired;
    data['captchaResult'] = captchaResult;
    return data;
  }
}
