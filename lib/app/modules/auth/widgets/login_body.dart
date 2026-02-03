import 'package:flutter/cupertino.dart';
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
          suffixIcon: GestureDetector(onTap: () {}, child: Icon(CupertinoIcons.clear_circled)),
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: .w500),
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
      ],
    );
  }
}