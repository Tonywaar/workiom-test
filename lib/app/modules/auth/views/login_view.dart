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
              customBackFunction: () {
                if (controller.currentScreen.value == 0) Get.back();
                controller.currentScreen.value = 0;
              },
            );
          }),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  75.verticalSpace,
                  Obx(() {
                    return AnimatedCrossFade(
                      firstChild: Form(
                        key: controller.loginFormKey,
                        child: LoginBody(controller: controller),
                      ),
                      secondChild: Form(
                        key: controller.workspaceFormKey,
                        child: WorkspaceBody(controller: controller),
                      ),
                      crossFadeState: controller.currentScreen.value == 0
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 400),
                    );
                  }),

                  25.verticalSpace,
                  Obx(() {
                    bool isValid = controller.currentScreen.value == 0
                        ? controller.countOfPassedRules.value == controller.numberOfRules
                        : true;

                    return CustomButton(
                      color: isValid ? TColors.primary : TColors.greyColor,
                      withEnter: true,
                      isLoading: controller.requestState.value.isLoading,
                      title: controller.buttonTitles[controller.currentScreen.value].tr,
                      onTap: controller.validateAndProceed,
                    );
                  }),

                  15.verticalSpace,
                  Visibility(
                    visible: kDebugMode,
                    child: Obx(() {
                      bool isVisible =
                          controller.currentScreen.value == 1 &&
                          controller.workspaceNameError.value == TStrings.workspaceTaken.tr;
                      return Visibility(
                        visible: isVisible,
                        child: CustomButton(
                          color: TColors.greenColor,
                          withEnter: true,
                          isLoading: controller.requestState.value.isLoading,
                          title: TStrings.login.tr,
                          onTap: () => controller.authenticate(withLoading: true),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}