import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workiom/app/core/widgets/app_title.dart';
import 'package:workiom/app/core/widgets/labeled_text_field.dart';

import 'package:workiom/export.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          AppTitle(title: TStrings.loginTitle, description: TStrings.screenTitleDesc),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  75.verticalSpace,

                  LabeledTextField(
                    label: TStrings.yourWorkEmail.tr,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(CupertinoIcons.clear_circled),
                    ),
                    prefix: CustomSvg(Assets.icons.message),
                    controller: controller.emailController,
                  ),
                  25.verticalSpace,
                  LabeledTextField(
                    label: TStrings.yourPassword.tr,

                    isPassword: true,
                    prefix: CustomSvg(Assets.icons.lock),
                    controller: controller.passwordController,
                  ),
                  25.verticalSpace,
                  Container(
                    width: Get.width,
                    height: 10,
                    decoration: BoxDecoration(
                      color: TColors.greyColor.withValues(alpha: .25),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    alignment: AlignmentDirectional.centerStart,
                    child: FractionallySizedBox(
                      widthFactor: .5,
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        decoration: BoxDecoration(
                          color: TColors.yellowColor,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                      ),
                    ),
                  ),
                  25.verticalSpace,
                  Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      CustomSvg(Assets.icons.warning),
                      5.horizontalSpace,
                      Expanded(
                        child: Text(
                          TStrings.notStrongEnough.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(fontWeight: .w500),
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      CustomSvg(Assets.icons.wrong),
                      5.horizontalSpace,
                      Expanded(
                        child: Text(
                          "${TStrings.passwordMustHave.tr} ${TStrings.sevenChar.tr}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      CustomSvg(Assets.icons.right),
                      5.horizontalSpace,
                      Expanded(
                        child: Text(
                          "${TStrings.passwordMustHave.tr} ${TStrings.oneUpper.tr}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  25.verticalSpace,
                  CustomButton(
                    color: TColors.greyColor,
                    withEnter: true,
                    title: TStrings.confirmPassword.tr,
                    onTap: () {},
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