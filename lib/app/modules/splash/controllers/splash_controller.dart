import 'package:workiom/app/modules/splash/models/login_info_model.dart';
import 'package:workiom/export.dart';

import '../repo/splash_repo.dart';
import '../repo/splash_repo_impl.dart';

class SplashController extends GetxController {
  final SplashRepo _splashRepo = SplashRepoImpl();

  final Rx<RequestState> requestState = RequestState.begin.obs;

  @override
  void onInit() {
    _initializeApp();

    super.onInit();
  }

  Future<void> _initializeApp() async {
    requestState(RequestState.loading);

    await Future.delayed(const Duration(seconds: 1));
    await getLoginInfo();
    _navigateToApp();
  }

  void _navigateToApp() {
    Get.offAllNamed(_getInitialRoute);
  }

  static String get _getInitialRoute {
    return UserService.instance.isAuthenticated ? Routes.AUTH : Routes.HOME;
  }

  Future<void> getLoginInfo() async {
    final result = await _splashRepo.getCurrentLoginInformation();

    if (result is DataSuccess<GeneralResponse<LoginInfoModel>>) {
      String? user = result.data?.result?.user;
      String? tenant = result.data?.result?.tenant;
      String? token = user != null || tenant != null ? 'token' : null;

      UserService.instance.setUserData(token: token, user: user, tenant: tenant);
    }
  }
}