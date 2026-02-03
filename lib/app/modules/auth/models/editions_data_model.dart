class EditionsData {
  List<AllFeatures>? allFeatures;
  List<EditionsWithFeatures>? editionsWithFeatures;
  dynamic tenantEditionId;

  EditionsData({this.allFeatures, this.editionsWithFeatures, this.tenantEditionId});

  EditionsData.fromJson(Map<String, dynamic> json) {
    if (json['allFeatures'] != null) {
      allFeatures = <AllFeatures>[];
      json['allFeatures'].forEach((v) {
        allFeatures?.add(AllFeatures.fromJson(v));
      });
    }
    if (json['editionsWithFeatures'] != null) {
      editionsWithFeatures = <EditionsWithFeatures>[];
      json['editionsWithFeatures'].forEach((v) {
        editionsWithFeatures?.add(EditionsWithFeatures.fromJson(v));
      });
    }
    tenantEditionId = json['tenantEditionId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (allFeatures != null) {
      data['allFeatures'] = allFeatures?.map((v) => v.toJson()).toList();
    }
    if (editionsWithFeatures != null) {
      data['editionsWithFeatures'] = editionsWithFeatures?.map((v) => v.toJson()).toList();
    }
    data['tenantEditionId'] = tenantEditionId;
    return data;
  }
}

class AllFeatures {
  String? name;
  dynamic parentName;
  String? displayName;
  String? description;
  String? defaultValue;
  Metadata? metadata;
  InputType? inputType;

  AllFeatures({
    this.name,
    this.parentName,
    this.displayName,
    this.description,
    this.defaultValue,
    this.metadata,
    this.inputType,
  });

  AllFeatures.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    parentName = json['parentName'];
    displayName = json['displayName'];
    description = json['description'];
    defaultValue = json['defaultValue'];
    metadata = json['metadata'] != null ? Metadata?.fromJson(json['metadata']) : null;
    inputType = json['inputType'] != null ? InputType?.fromJson(json['inputType']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['parentName'] = parentName;
    data['displayName'] = displayName;
    data['description'] = description;
    data['defaultValue'] = defaultValue;
    if (metadata != null) {
      data['metadata'] = metadata?.toJson();
    }
    if (inputType != null) {
      data['inputType'] = inputType?.toJson();
    }
    return data;
  }
}

class Metadata {
  num? dataType;
  bool? isVisibleOnPricingTable;
  bool? isVisibleOnTenantSubscription;

  Metadata({this.dataType, this.isVisibleOnPricingTable, this.isVisibleOnTenantSubscription});

  Metadata.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'] as num?;
    isVisibleOnPricingTable = json['isVisibleOnPricingTable'];
    isVisibleOnTenantSubscription = json['isVisibleOnTenantSubscription'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dataType'] = dataType;
    data['isVisibleOnPricingTable'] = isVisibleOnPricingTable;
    data['isVisibleOnTenantSubscription'] = isVisibleOnTenantSubscription;
    return data;
  }
}

class InputType {
  String? name;
  Attributes? attributes;
  Validator? validator;
  dynamic itemSource;

  InputType({this.name, this.attributes, this.validator, this.itemSource});

  InputType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    attributes = json['attributes'] != null ? Attributes?.fromJson(json['attributes']) : null;
    validator = json['validator'] != null ? Validator?.fromJson(json['validator']) : null;
    itemSource = json['itemSource'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    if (attributes != null) {
      data['attributes'] = attributes?.toJson();
    }
    if (validator != null) {
      data['validator'] = validator?.toJson();
    }
    data['itemSource'] = itemSource;
    return data;
  }
}

class Validator {
  num? minValue;
  num? maxValue;
  String? name;
  Attributes? attributes;

  Validator({this.minValue, this.maxValue, this.name, this.attributes});

  Validator.fromJson(Map<String, dynamic> json) {
    minValue = json['minValue'] as num?;
    maxValue = json['maxValue'] as num?;
    name = json['name'];
    attributes = json['attributes'] != null ? Attributes?.fromJson(json['attributes']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['minValue'] = minValue;
    data['maxValue'] = maxValue;
    data['name'] = name;
    if (attributes != null) {
      data['attributes'] = attributes?.toJson();
    }
    return data;
  }
}

class Attributes {
  num? minValue;
  num? maxValue;

  Attributes({this.minValue, this.maxValue});

  Attributes.fromJson(Map<String, dynamic> json) {
    minValue = json['MinValue'] as num?;
    maxValue = json['MaxValue'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['MinValue'] = minValue;
    data['MaxValue'] = maxValue;
    return data;
  }
}

class EditionsWithFeatures {
  Edition? edition;
  List<FeatureValues>? featureValues;

  EditionsWithFeatures({this.edition, this.featureValues});

  EditionsWithFeatures.fromJson(Map<String, dynamic> json) {
    edition = json['edition'] != null ? Edition?.fromJson(json['edition']) : null;
    if (json['featureValues'] != null) {
      featureValues = <FeatureValues>[];
      json['featureValues'].forEach((v) {
        featureValues?.add(FeatureValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (edition != null) {
      data['edition'] = edition?.toJson();
    }
    if (featureValues != null) {
      data['featureValues'] = featureValues?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edition {
  String? name;
  String? displayName;
  String? publicDescription;
  dynamic internalDescription;
  bool? isPublished;
  bool? isRegistrable;
  num? type;
  num? minimumUsersCount;
  num? monthlyPrice;
  num? annualPrice;
  num? waitingDayAfterExpire;
  num? trialDayCount;
  num? countAllowExtendTrial;
  bool? hasTrial;
  bool? disableWorkspaceAfterExpire;
  bool? isMostPopular;
  dynamic doNotSendVerifyEmail;
  ExpiringEdition? expiringEdition;
  dynamic seatsText;
  dynamic buttonText;
  dynamic buttonLink;
  dynamic starterLineText;
  dynamic editionColor;
  int? id;

  Edition({
    this.name,
    this.displayName,
    this.publicDescription,
    this.internalDescription,
    this.isPublished,
    this.isRegistrable,
    this.type,
    this.minimumUsersCount,
    this.monthlyPrice,
    this.annualPrice,
    this.waitingDayAfterExpire,
    this.trialDayCount,
    this.countAllowExtendTrial,
    this.hasTrial,
    this.disableWorkspaceAfterExpire,
    this.isMostPopular,
    this.doNotSendVerifyEmail,
    this.expiringEdition,
    this.seatsText,
    this.buttonText,
    this.buttonLink,
    this.starterLineText,
    this.editionColor,
    this.id,
  });

  Edition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    publicDescription = json['publicDescription'];
    internalDescription = json['internalDescription'];
    isPublished = json['isPublished'];
    isRegistrable = json['isRegistrable'];
    type = json['type'] as num?;
    minimumUsersCount = json['minimumUsersCount'] as num?;
    monthlyPrice = json['monthlyPrice'] as num?;
    annualPrice = json['annualPrice'] as num?;
    waitingDayAfterExpire = json['waitingDayAfterExpire'] as num?;
    trialDayCount = json['trialDayCount'] as num?;
    countAllowExtendTrial = json['countAllowExtendTrial'] as num?;
    hasTrial = json['hasTrial'];
    disableWorkspaceAfterExpire = json['disableWorkspaceAfterExpire'];
    isMostPopular = json['isMostPopular'];
    doNotSendVerifyEmail = json['doNotSendVerifyEmail'];
    expiringEdition = json['expiringEdition'] != null
        ? ExpiringEdition?.fromJson(json['expiringEdition'])
        : null;
    seatsText = json['seatsText'];
    buttonText = json['buttonText'];
    buttonLink = json['buttonLink'];
    starterLineText = json['starterLineText'];
    editionColor = json['editionColor'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['displayName'] = displayName;
    data['publicDescription'] = publicDescription;
    data['internalDescription'] = internalDescription;
    data['isPublished'] = isPublished;
    data['isRegistrable'] = isRegistrable;
    data['type'] = type;
    data['minimumUsersCount'] = minimumUsersCount;
    data['monthlyPrice'] = monthlyPrice;
    data['annualPrice'] = annualPrice;
    data['waitingDayAfterExpire'] = waitingDayAfterExpire;
    data['trialDayCount'] = trialDayCount;
    data['countAllowExtendTrial'] = countAllowExtendTrial;
    data['hasTrial'] = hasTrial;
    data['disableWorkspaceAfterExpire'] = disableWorkspaceAfterExpire;
    data['isMostPopular'] = isMostPopular;
    data['doNotSendVerifyEmail'] = doNotSendVerifyEmail;
    if (expiringEdition != null) {
      data['expiringEdition'] = expiringEdition?.toJson();
    }
    data['seatsText'] = seatsText;
    data['buttonText'] = buttonText;
    data['buttonLink'] = buttonLink;
    data['starterLineText'] = starterLineText;
    data['editionColor'] = editionColor;
    data['id'] = id;
    return data;
  }
}

class ExpiringEdition {
  String? name;
  String? displayName;
  num? id;

  ExpiringEdition({this.name, this.displayName, this.id});

  ExpiringEdition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    displayName = json['displayName'];
    id = json['id'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['displayName'] = displayName;
    data['id'] = id;
    return data;
  }
}

class FeatureValues {
  String? name;
  String? value;

  FeatureValues({this.name, this.value});

  FeatureValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}