import 'package:workiom/export.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            CustomSvg(Assets.icons.icon, width: .5.sw),
            25.verticalSpace,
            Obx(() {
              return Visibility(
                visible: controller.isLoading.value,
                child: LinearProgressIndicator(
                  backgroundColor: TColors.greyColor,
                  color: TColors.primary,
                ).paddingSymmetric(horizontal: .40.sw),
              );
            }),
          ],
        ),
      ),
    );
  }
}