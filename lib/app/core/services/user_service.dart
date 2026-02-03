import 'dart:convert';

import 'package:workiom/export.dart';

import '../../modules/splash/models/login_information_data_model.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  bool get isAuthenticated => token != null && (user != null || tenant != null);

  String? get token => cache.read(CacheHelper.token);

  Tenant? get tenant {
    String? tenantData = cache.read(CacheHelper.tenant);
    if (tenantData == null) return null;
    return Tenant.fromJson(jsonDecode(tenantData));
  }

  User? get user {
    String? userData = cache.read(CacheHelper.user);
    if (userData == null) return null;
    return User.fromJson(jsonDecode(userData));
  }

  void setUserData({User? user, Tenant? tenant}) {
    if (null != user) cache.write(CacheHelper.user, jsonEncode(user.toJson()));
    if (null != tenant) cache.write(CacheHelper.tenant, jsonEncode(tenant.toJson()));
  }

  void clearUserData() {
    cache.remove(CacheHelper.token);
    cache.remove(CacheHelper.user);
    cache.remove(CacheHelper.tenant);
  }
}