import 'package:flutter/cupertino.dart';
import 'package:workiom/app/modules/auth/widgets/password_condition_item.dart';
import 'package:workiom/export.dart';

import '../controllers/auth_controller.dart';

class LoginBody extends StatelessWidget {
  final AuthController controller;

  const LoginBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextField(
          label: TStrings.yourWorkEmail.tr,
          hint: "example@email.com",
          isLTR: true,
          suffixIcon: IconButton(
            onPressed: () => controller.emailController.clear(),
            icon: Icon(CupertinoIcons.clear_circled),
          ),
          prefix: CustomSvg(Assets.icons.message),

          controller: controller.emailController,
          validator: AppFunctions.emailValidator,
          keyboardType: TextInputType.emailAddress,
        ),
        25.verticalSpace,
        LabeledTextField(
          label: TStrings.yourPassword.tr,
          hint: "**************",
          isLTR: true,
          isPassword: true,
          prefix: CustomSvg(Assets.icons.lock),
          controller: controller.passwordController,
          validator: controller.validatePassword,
          onChanged: controller.validateToRules,
        ),
        25.verticalSpace,

        Obx(() {
          if (controller.getRulesRequestState.value.isLoading) {
            return LinearProgressIndicator(
              backgroundColor: TColors.greyColor,
              color: TColors.primary,
            ).paddingSymmetric(horizontal: 25);
          }
          if (controller.getRulesRequestState.value.isError) {
            return CustomButton(
              color: TColors.redColor.withValues(alpha: .25),
              svg: Assets.icons.wrong,
              title: TStrings.somethingWentWrong.tr,
              textColor: TColors.redColor,
              onTap: () => controller.getPasswordSettings(),
            );
          }
          return Column(
            spacing: 5,
            children: [
              Container(
                width: Get.width,
                height: 10,
                decoration: BoxDecoration(
                  color: TColors.greyColor.withValues(alpha: .25),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                alignment: AlignmentDirectional.centerStart,
                child: AnimatedContainer(
                  width:
                      Get.width * (controller.countOfPassedRules.value / controller.numberOfRules),
                  height: Get.height,
                  duration: Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    color: controller.countOfPassedRules.value == controller.numberOfRules
                        ? TColors.greenColor
                        : TColors.yellowColor,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                ),
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: .start,
                crossAxisAlignment: .center,
                children: [
                  CustomSvg(
                    controller.countOfPassedRules.value == controller.numberOfRules
                        ? Assets.icons.right
                        : Assets.icons.warning,
                  ),
                  5.horizontalSpace,
                  Expanded(
                    child: Text(
                      controller.countOfPassedRules.value == controller.numberOfRules
                          ? TStrings.strongPassword.tr
                          : TStrings.notStrongEnough.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: .w500),
                    ),
                  ),
                ],
              ),

              PasswordConditionItem(
                context: context,
                title: "${controller.passwordSettings.requiredLength} ${TStrings.sevenChar.tr}",
                passed: controller.passwordSettings.requiredLengthPassed,
              ),
              if (controller.passwordSettings.requireUppercase)
                PasswordConditionItem(
                  context: context,
                  title: TStrings.oneUpper.tr,
                  passed: controller.passwordSettings.requireUppercasePassed,
                ),
              if (controller.passwordSettings.requireLowercase)
                PasswordConditionItem(
                  context: context,
                  title: TStrings.oneLower.tr,
                  passed: controller.passwordSettings.requireLowercasePassed,
                ),
              if (controller.passwordSettings.requireDigit)
                PasswordConditionItem(
                  context: context,
                  title: TStrings.oneNumber.tr,
                  passed: controller.passwordSettings.requireDigitPassed,
                ),
              if (controller.passwordSettings.requireNonAlphanumeric)
                PasswordConditionItem(
                  context: context,
                  title: TStrings.oneNonAlphanumeric.tr,
                  passed: controller.passwordSettings.requireNonAlphanumericPassed,
                ),
            ],
          );
        }),
      ],
    );
  }
}