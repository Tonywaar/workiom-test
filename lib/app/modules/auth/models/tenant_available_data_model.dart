class TenantAvailableData {
  num? state;
  num? tenantId;
  dynamic serverRootAddress;
  dynamic apiUrl;
  dynamic dnsUrl;
  bool? isActive;
  bool? isInMaintenanceMode;
  dynamic maintenanceEndDateUtc;

  TenantAvailableData({
    this.state,
    this.tenantId,
    this.serverRootAddress,
    this.apiUrl,
    this.dnsUrl,
    this.isActive,
    this.isInMaintenanceMode,
    this.maintenanceEndDateUtc,
  });

  TenantAvailableData.fromJson(Map<String, dynamic> json) {
    state = json['state'] as num?;
    tenantId = json['tenantId'] as num?;
    serverRootAddress = json['serverRootAddress'];
    apiUrl = json['apiUrl'];
    dnsUrl = json['dnsUrl'];
    isActive = json['isActive'];
    isInMaintenanceMode = json['isInMaintenanceMode'];
    maintenanceEndDateUtc = json['maintenanceEndDateUtc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['state'] = state;
    data['tenantId'] = tenantId;
    data['serverRootAddress'] = serverRootAddress;
    data['apiUrl'] = apiUrl;
    data['dnsUrl'] = dnsUrl;
    data['isActive'] = isActive;
    data['isInMaintenanceMode'] = isInMaintenanceMode;
    data['maintenanceEndDateUtc'] = maintenanceEndDateUtc;
    return data;
  }
}
