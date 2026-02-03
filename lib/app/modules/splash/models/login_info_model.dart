class LoginInfoModel {
  dynamic user;
  dynamic tenant;
  Application? application;

  LoginInfoModel({this.user, this.tenant, this.application});

  LoginInfoModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    tenant = json['tenant'];
    application = json['application'] != null ? Application?.fromJson(json['application']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user;
    data['tenant'] = tenant;
    if (application != null) {
      data['application'] = application?.toJson();
    }
    return data;
  }
}

class Application {
  String? version;
  String? releaseDate;
  String? currency;
  String? currencySign;
  bool? userDelegationIsEnabled;
  Features? features;
  String? compatibleMobileClientVersion;
  String? compatibleWebClientVersion;

  Application({
    this.version,
    this.releaseDate,
    this.currency,
    this.currencySign,
    this.userDelegationIsEnabled,
    this.features,
    this.compatibleMobileClientVersion,
    this.compatibleWebClientVersion,
  });

  Application.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    releaseDate = json['releaseDate'];
    currency = json['currency'];
    currencySign = json['currencySign'];
    userDelegationIsEnabled = json['userDelegationIsEnabled'];
    features = json['features'] != null ? Features?.fromJson(json['features']) : null;
    compatibleMobileClientVersion = json['compatibleMobileClientVersion'];
    compatibleWebClientVersion = json['compatibleWebClientVersion'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['version'] = version;
    data['releaseDate'] = releaseDate;
    data['currency'] = currency;
    data['currencySign'] = currencySign;
    data['userDelegationIsEnabled'] = userDelegationIsEnabled;
    if (features != null) {
      data['features'] = features?.toJson();
    }
    data['compatibleMobileClientVersion'] = compatibleMobileClientVersion;
    data['compatibleWebClientVersion'] = compatibleWebClientVersion;
    return data;
  }
}

class Features {
  Features();

  Features.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}