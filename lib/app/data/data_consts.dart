import '../core/utils/cache_helper.dart';

class DataConsts {
  static const String serverUrl = "https://api.workiom.club";
  static const String imagesUrl = serverUrl;
  static const String baseUrl = "$serverUrl/api";
  static const String serviceUrl = "$baseUrl/services/app";

  static const String getCurrentLoginInformation = '$serviceUrl/Session/GetCurrentLoginInformations';
  static const String getPasswordComplexitySetting = '$serviceUrl/Profile/GetPasswordComplexitySetting';

  static const String getEditionsForSelect = '$serviceUrl/TenantRegistration/GetEditionsForSelect';
  static const String postTenantAvailable = '$serviceUrl/TenantRegistration/RegisterTenant';

  static const String postAuthenticate = '$baseUrl/TokenAuth/Authenticate';
}

Map<String, dynamic> headers({bool isForm = false}) => {
  if (!isForm) "Content-Type": "application/json; charset=UTF-8",
  "Accept": "application/json",
  if (cache.read(CacheHelper.token) != null) 'Authorization': 'Bearer ${cache.read(CacheHelper.token)}',
};