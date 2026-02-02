import 'package:workiom/export.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    _initializeApp();

    super.onInit();
  }

  Future<void> _initializeApp() async {
    isLoading(true);
    await initDependencies();

    await Future.delayed(const Duration(seconds: 5));
    _navigateToApp();
  }

  void _navigateToApp() {
    Get.offAllNamed(_getInitialRoute);
  }

  static String get _getInitialRoute {
    return cache.read(CacheHelper.token) == null ? Routes.AUTH : Routes.HOME;
  }
}