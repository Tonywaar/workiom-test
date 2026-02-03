import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PasswordComplexityData {
  Setting? setting;

  PasswordComplexityData({this.setting});

  PasswordComplexityData.fromJson(Map<String, dynamic> json) {
    setting = json['setting'] != null ? Setting?.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (setting != null) {
      data['setting'] = setting?.toJson();
    }
    return data;
  }
}

class Setting {
  bool requireDigit = false;
  RxBool requireDigitPassed = false.obs;
  bool requireLowercase = false;
  RxBool requireLowercasePassed = false.obs;
  bool requireNonAlphanumeric = false;
  RxBool requireNonAlphanumericPassed = false.obs;
  bool requireUppercase = false;
  RxBool requireUppercasePassed = false.obs;
  int requiredLength = 0;
  RxBool requiredLengthPassed = false.obs;

  Setting({
    this.requireDigit = false,
    this.requireLowercase = false,
    this.requireNonAlphanumeric = false,
    this.requireUppercase = false,
    this.requiredLength = 0,
  });

  Setting.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'] ?? false;
    requireLowercase = json['requireLowercase'] ?? false;
    requireNonAlphanumeric = json['requireNonAlphanumeric'] ?? false;
    requireUppercase = json['requireUppercase'] ?? false;
    requiredLength = json['requiredLength'] ?? 0;
  }

  void resetPassedVars() {
    requireDigitPassed = false.obs;
    requireLowercasePassed = false.obs;
    requireNonAlphanumericPassed = false.obs;
    requireUppercasePassed = false.obs;
    requiredLengthPassed = false.obs;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['requireDigit'] = requireDigit;
    data['requireLowercase'] = requireLowercase;
    data['requireNonAlphanumeric'] = requireNonAlphanumeric;
    data['requireUppercase'] = requireUppercase;
    data['requiredLength'] = requiredLength;
    return data;
  }
}