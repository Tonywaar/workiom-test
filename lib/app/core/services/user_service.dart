import 'package:workiom/export.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  bool get isAuthenticated => token == null || user == null || tenant == null;

  String? get token => cache.read(CacheHelper.token);

  String? get tenant => cache.read(CacheHelper.tenant);

  String? get user => cache.read(CacheHelper.user);

  void setUserData({String? token, String? user, String? tenant}) {
    cache.write(CacheHelper.token, token);
    cache.write(CacheHelper.user, user);
    cache.write(CacheHelper.tenant, tenant);
  }

  void clearUserData() {
    cache.remove(CacheHelper.token);
    cache.remove(CacheHelper.user);
    cache.remove(CacheHelper.tenant);
  }
}