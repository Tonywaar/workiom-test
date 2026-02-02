import 'package:workiom/export.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  bool get isAuthenticated => cache.read(CacheHelper.token) == null;

  String? get token => cache.read(CacheHelper.token);

  void setUserData({required String token}) {
    cache.write(CacheHelper.token, token);
  }

  void clearUserData() {
    cache.remove(CacheHelper.token);
  }
}