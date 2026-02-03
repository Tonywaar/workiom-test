import 'package:get/get.dart';

import 'package:workiom/export.dart';

class HomeController extends GetxController {
  void logout() {
    AppFunctions.showLogoutDialog(
      onConfirm: () {
        UserService.instance.clearUserData();
        Get.offAllNamed(Routes.SPLASH);
      },
    );
  }
}