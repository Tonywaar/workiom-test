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
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  int? requiredLength;

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