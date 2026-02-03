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
    return cache.read(CacheHelper.token) == null ? Routes.AUTH : Routes.HOME;
  }

  Future<void> getLoginInfo() async {
    final result = await _splashRepo.getCurrentLoginInformation();

    print(result.data?.unAuthorizedRequest);
    print(result.data?.result?.user);
  }
}