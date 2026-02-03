import 'package:workiom/export.dart';

class SplashController extends GetxController {
  final Rx<RequestState> requestState = RequestState.begin.obs;

  @override
  void onInit() {
    _initializeApp();

    super.onInit();
  }

  Future<void> _initializeApp() async {
    requestState(RequestState.loading);

    bool result = await UserService.instance.getLoginInfo();
    await Future.delayed(const Duration(seconds: 1));
    if (result)
      _navigateToApp();
    else {
      requestState(RequestState.error);
    }
  }

  void _navigateToApp() {
    Get.offAllNamed(_getInitialRoute);
  }

  static String get _getInitialRoute {
    return UserService.instance.isAuthenticated ? Routes.HOME : Routes.AUTH;
  }
}