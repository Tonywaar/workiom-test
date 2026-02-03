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
  bool? requireDigit;
  RxBool  requireDigitPassed = false.obs;
  bool? requireLowercase;
  RxBool  requireLowercasePassed = false.obs;
  bool? requireNonAlphanumeric;
  RxBool  requireNonAlphanumericPassed = false.obs;
  bool? requireUppercase;
  RxBool  requireUppercasePassed = false.obs;
  int? requiredLength;
  RxBool requiredLengthPassed = false.obs;

  Setting({
    this.requireDigit,
    this.requireLowercase,
    this.requireNonAlphanumeric,
    this.requireUppercase,
    this.requiredLength,
  });

  Setting.fromJson(Map<String, dynamic> json) {
    requireDigit = json['requireDigit'];
    requireLowercase = json['requireLowercase'];
    requireNonAlphanumeric = json['requireNonAlphanumeric'];
    requireUppercase = json['requireUppercase'];
    requiredLength = json['requiredLength'];
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