import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:workiom/app/modules/auth/views/login_view.dart';
import 'package:workiom/export.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          AppTitle(title: TStrings.startScreenTitle, description: TStrings.screenTitleDesc),
          Spacer(),
          CustomButton(
            onTap: () {},
            color: TColors.greyColor.withValues(alpha: .25),
            title: TStrings.continueWithGoogle.tr,
            svg: Assets.icons.google,
            textColor: TColors.textSecondary,
          ),
          30.verticalSpace,
          Center(child: Text(TStrings.or.tr)),
          30.verticalSpace,
          CustomButton(
            onTap: () {
              Get.to(() => LoginView(), transition: .leftToRight);
            },
            title: TStrings.continueWithEmail.tr,
            withEnter: true,
          ),
          25.verticalSpace,
          Center(
            child: RichText(
              textAlign: .center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,

                children: [
                  TextSpan(text: TStrings.bySigningUp.tr),
                  TextSpan(
                    text: TStrings.termsOfService.tr,
                    style: TextStyle(decoration: .underline),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(text: TStrings.and.tr),
                  TextSpan(
                    text: TStrings.privacyPolicy.tr,
                    style: TextStyle(decoration: .underline),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ).paddingSymmetric(horizontal: 25.w),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Get.bottomSheet(
              SizedBox(
                width: Get.width,
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    ListTile(
                      onTap: () {
                        cache.write(CacheHelper.language, "en");
                        Get.updateLocale(Locale("en"));
                        Get.back();
                      },
                      leading: Icon(
                        Get.locale?.languageCode == "en"
                            ? CupertinoIcons.check_mark_circled
                            : Icons.circle_outlined,
                      ),
                      title: Text(TStrings.english.tr.capitalize ?? ""),
                    ),
                    ListTile(
                      onTap: () {
                        cache.write(CacheHelper.language, "ar");
                        Get.updateLocale(Locale("ar"));
                        Get.back();
                      },
                      leading: Icon(
                        Get.locale?.languageCode == "ar"
                            ? CupertinoIcons.check_mark_circled
                            : Icons.circle_outlined,
                      ),
                      title: Text(TStrings.arabic.tr.capitalize ?? ""),
                    ),
                    50.verticalSpace,
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(18.r)),
              ),
              backgroundColor: Theme.of(context).cardColor,
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: .center,
              children: [
                CustomSvg(Assets.icons.globe, width: 15.sp, height: 15.sp),
                Text(
                  (Get.locale?.languageCode == "en" ? TStrings.english : TStrings.arabic)
                          .tr
                          .capitalize ??
                      "",
                ),
                Icon(Icons.arrow_drop_down_rounded),
              ],
            ),
          ),
          15.verticalSpace,
        ],
      ),
    );
  }
}