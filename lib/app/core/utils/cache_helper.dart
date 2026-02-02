import 'package:get_storage/get_storage.dart';

GetStorage cache = GetStorage();

class CacheHelper {
  static const String token = 'token';
  static const String language = 'language';

  static String get userToken => cache.read(token) ?? "";
}