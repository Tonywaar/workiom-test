import 'package:flutter/cupertino.dart';
import 'package:workiom/app/modules/auth/widgets/workspace_body.dart';
import 'package:workiom/export.dart';

import '../controllers/auth_controller.dart';
import '../widgets/login_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Obx(() {
            return AppTitle(
              title: controller.screenTitles[controller.currentScreen.value],
              description: TStrings.screenTitleDesc,
            );
          }),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  75.verticalSpace,
                  Form(
                    key: controller.formKey,
                    child: Obx(() {
                      return AnimatedCrossFade(
                        firstChild: LoginBody(controller: controller),
                        secondChild: WorkspaceBody(controller: controller),
                        crossFadeState: controller.currentScreen.value == 0
                            ? .showFirst
                            : .showSecond,
                        duration: Duration(milliseconds: 400),
                      );
                    }),
                  ),

                  25.verticalSpace,
                  Obx(() {
                    return CustomButton(
                      color: controller.currentScreen.value == 0
                          ? controller.countOfPassedRules.value == controller.numberOfRules
                                ? TColors.primary
                                : TColors.greyColor
                          : TColors.greyColor,
                      withEnter: true,
                      title: controller.buttonTitles[controller.currentScreen.value].tr,
                      onTap: controller.validateAndProceed,
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}