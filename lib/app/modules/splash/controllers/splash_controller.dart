import 'package:workiom/export.dart';

import '../models/login_information_data_model.dart';
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

    await getLoginInfo();
    await Future.delayed(const Duration(seconds: 1));

    _navigateToApp();
  }

  void _navigateToApp() {
    Get.offAllNamed(_getInitialRoute);
  }

  static String get _getInitialRoute {
    return UserService.instance.isAuthenticated ? Routes.HOME : Routes.AUTH;
  }

  Future<void> getLoginInfo() async {
    final result = await _splashRepo.getCurrentLoginInformation();

    if (result is DataSuccess<GeneralResponse<LoginInformationData>>) {
      User? user = result.data?.result?.user;
      Tenant? tenant = result.data?.result?.tenant;

      UserService.instance.setUserData(user: user, tenant: tenant);
    }
  }
}