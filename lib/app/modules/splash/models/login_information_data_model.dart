class LoginInformationData {
  User? user;
  Tenant? tenant;
  Application? application;

  LoginInformationData({this.user, this.tenant, this.application});

  LoginInformationData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    tenant = json['tenant'] != null ? Tenant?.fromJson(json['tenant']) : null;
    application = json['application'] != null ? Application?.fromJson(json['application']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.toJson();
    }
    if (tenant != null) {
      data['tenant'] = tenant?.toJson();
    }
    if (application != null) {
      data['application'] = application?.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? surname;
  String? userName;
  String? emailAddress;
  dynamic profilePictureUrl;
  bool? allowSetPassword;
  num? userType;
  String? userToken;
  String? lastSeen;
  dynamic title;
  List<String>? roles;
  num? id;

  User({
    this.name,
    this.surname,
    this.userName,
    this.emailAddress,
    this.profilePictureUrl,
    this.allowSetPassword,
    this.userType,
    this.userToken,
    this.lastSeen,
    this.title,
    this.roles,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    profilePictureUrl = json['profilePictureUrl'];
    allowSetPassword = json['allowSetPassword'];
    userType = json['userType'] as num?;
    userToken = json['userToken'];
    lastSeen = json['lastSeen'];
    title = json['title'];
    roles = json['roles']?.cast<String>();
    id = json['id'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['userName'] = userName;
    data['emailAddress'] = emailAddress;
    data['profilePictureUrl'] = profilePictureUrl;
    data['allowSetPassword'] = allowSetPassword;
    data['userType'] = userType;
    data['userToken'] = userToken;
    data['lastSeen'] = lastSeen;
    data['title'] = title;
    data['roles'] = roles;
    data['id'] = id;
    return data;
  }
}

class Tenant {
  String? tenancyName;
  String? name;
  num? ownerId;
  dynamic logoUrl;
  dynamic watermarkUrl;
  String? creationTime;
  Edition? edition;
  bool? isInReadOnlyMode;
  bool? isSubscribed;
  dynamic paymentPeriodType;
  dynamic subscriptionEndDateUtc;
  dynamic subscriptionCancelDateUtc;
  bool? isSubscriptionCanceled;
  dynamic subscriptionCustomName;
  dynamic trialPeriodStartDateUtc;
  dynamic trialPeriodEndDateUtc;
  bool? allowExtendTrial;
  bool? isInTrialPeriod;
  bool? isUsingTrial;
  dynamic trialPeriodDaysDuration;
  bool? hasCoupon;
  bool? isInLastPaidEdition;
  num? waitingDayAfterExpire;
  bool? disableTenantAfterExpire;
  dynamic moveToEditionAfterExpire;
  bool? setInReadOnlyModeAfterExpire;
  dynamic templateCategoryId;
  dynamic siloId;
  dynamic apiUrl;
  dynamic dnsUrl;
  dynamic customerId;
  num? id;

  Tenant({
    this.tenancyName,
    this.name,
    this.ownerId,
    this.logoUrl,
    this.watermarkUrl,
    this.creationTime,
    this.edition,
    this.isInReadOnlyMode,
    this.isSubscribed,
    this.paymentPeriodType,
    this.subscriptionEndDateUtc,
    this.subscriptionCancelDateUtc,
    this.isSubscriptionCanceled,
    this.subscriptionCustomName,
    this.trialPeriodStartDateUtc,
    this.trialPeriodEndDateUtc,
    this.allowExtendTrial,
    this.isInTrialPeriod,
    this.isUsingTrial,
    this.trialPeriodDaysDuration,
    this.hasCoupon,
    this.isInLastPaidEdition,
    this.waitingDayAfterExpire,
    this.disableTenantAfterExpire,
    this.moveToEditionAfterExpire,
    this.setInReadOnlyModeAfterExpire,
    this.templateCategoryId,
    this.siloId,
    this.apiUrl,
    this.dnsUrl,
    this.customerId,
    this.id,
  });

  Tenant.fromJson(Map<String, dynamic> json) {
    tenancyName = json['tenancyName'];
    name = json['name'];
    ownerId = json['ownerId'] as num?;
    logoUrl = json['logoUrl'];
    watermarkUrl = json['watermarkUrl'];
    creationTime = json['creationTime'];
    edition = json['edition'] != null ? Edition?.fromJson(json['edition']) : null;
    isInReadOnlyMode = json['isInReadOnlyMode'];
    isSubscribed = json['isSubscribed'];
    paymentPeriodType = json['paymentPeriodType'];
    subscriptionEndDateUtc = json['subscriptionEndDateUtc'];
    subscriptionCancelDateUtc = json['subscriptionCancelDateUtc'];
    isSubscriptionCanceled = json['isSubscriptionCanceled'];
    subscriptionCustomName = json['subscriptionCustomName'];
    trialPeriodStartDateUtc = json['trialPeriodStartDateUtc'];
    trialPeriodEndDateUtc = json['trialPeriodEndDateUtc'];
    allowExtendTrial = json['allowExtendTrial'];
    isInTrialPeriod = json['isInTrialPeriod'];
    isUsingTrial = json['isUsingTrial'];
    trialPeriodDaysDuration = json['trialPeriodDaysDuration'];
    hasCoupon = json['hasCoupon'];
    isInLastPaidEdition = json['isInLastPaidEdition'];
    waitingDayAfterExpire = json['waitingDayAfterExpire'] as num?;
    disableTenantAfterExpire = json['disableTenantAfterExpire'];
    moveToEditionAfterExpire = json['moveToEditionAfterExpire'];
    setInReadOnlyModeAfterExpire = json['setInReadOnlyModeAfterExpire'];
    templateCategoryId = json['templateCategoryId'];
    siloId = json['siloId'];
    apiUrl = json['apiUrl'];
    dnsUrl = json['dnsUrl'];
    customerId = json['customerId'];
    id = json['id'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tenancyName'] = tenancyName;
    data['name'] = name;
    data['ownerId'] = ownerId;
    data['logoUrl'] = logoUrl;
    data['watermarkUrl'] = watermarkUrl;
    data['creationTime'] = creationTime;
    if (edition != null) {
      data['edition'] = edition?.toJson();
    }
    data['isInReadOnlyMode'] = isInReadOnlyMode;
    data['isSubscribed'] = isSubscribed;
    data['paymentPeriodType'] = paymentPeriodType;
    data['subscriptionEndDateUtc'] = subscriptionEndDateUtc;
    data['subscriptionCancelDateUtc'] = subscriptionCancelDateUtc;
    data['isSubscriptionCanceled'] = isSubscriptionCanceled;
    data['subscriptionCustomName'] = subscriptionCustomName;
    data['trialPeriodStartDateUtc'] = trialPeriodStartDateUtc;
    data['trialPeriodEndDateUtc'] = trialPeriodEndDateUtc;
    data['allowExtendTrial'] = allowExtendTrial;
    data['isInTrialPeriod'] = isInTrialPeriod;
    data['isUsingTrial'] = isUsingTrial;
    data['trialPeriodDaysDuration'] = trialPeriodDaysDuration;
    data['hasCoupon'] = hasCoupon;
    data['isInLastPaidEdition'] = isInLastPaidEdition;
    data['waitingDayAfterExpire'] = waitingDayAfterExpire;
    data['disableTenantAfterExpire'] = disableTenantAfterExpire;
    data['moveToEditionAfterExpire'] = moveToEditionAfterExpire;
    data['setInReadOnlyModeAfterExpire'] = setInReadOnlyModeAfterExpire;
    data['templateCategoryId'] = templateCategoryId;
    data['siloId'] = siloId;
    data['apiUrl'] = apiUrl;
    data['dnsUrl'] = dnsUrl;
    data['customerId'] = customerId;
    data['id'] = id;
    return data;
  }
}

class Edition {
  String? name;
  String? displayName;
  num? type;
  num? id;

  Edition({this.name, this.displayName, this.type, this.id});

  Edition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    type = json['type'] as num?;
    id = json['id'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['displayName'] = displayName;
    data['type'] = type;
    data['id'] = id;
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