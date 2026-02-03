import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:workiom/export.dart';

class AppFunctions {
  static void print(object) {
    if (!kReleaseMode) {
      debugPrint(object.toString());
    }
  }

  static void customToast({required String message, bool isError = true}) {
    Fluttertoast.showToast(
      msg: message.tr,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? TColors.redColor : TColors.primary,
      textColor: TColors.whiteColor,
      fontSize: 16.0,
    );
  }

  static String? requiredValidator(String? val) {
    if (val == null || val.isEmpty) {
      return TStrings.textRequired.tr;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return TStrings.textRequired.tr;
    } else if (!GetUtils.isEmail(val)) {
      return TStrings.emailNotValid.tr;
    } else {
      return null;
    }
  }

  static String? nameValidator(String? val) {
    if (val == null || val.isEmpty) {
      return TStrings.textRequired.tr;
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(val)) {
      return TStrings.nameNotValid.tr;
    } else {
      return null;
    }
  }

  static String? workspaceValidator(String? val) {
    if (val == null || val.isEmpty) {
      return TStrings.textRequired.tr;
    } else if (val.length < 4) {
      return TStrings.workspaceNameNotValid.tr;
    } else if (!RegExp(r'^[a-zA-Z][a-zA-Z0-9-]*$').hasMatch(val)) {
      return TStrings.workspaceNameNotValid.tr;
    } else {
      return null;
    }
  }

  static bool isLTR(String text) {
    final englishRegex = RegExp(r'[a-zA-Z]');
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    final englishCount = text.splitMapJoin(
      englishRegex,
      onMatch: (m) => m.group(0) ?? '',
      onNonMatch: (n) => '',
    );
    final arabicCount = text.splitMapJoin(
      arabicRegex,
      onMatch: (m) => m.group(0) ?? '',
      onNonMatch: (n) => '',
    );
    return englishCount.length >= arabicCount.length;
  }

  static void setStatusBarStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: TColors.whiteColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: TColors.whiteColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static Future<String> getIanaTimeZone() async {
    final timezoneInfo = await FlutterTimezone.getLocalTimezone();
    return timezoneInfo.identifier;
  }

  static void showErrorDialog({required String title, required String description}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding: EdgeInsets.all(25.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSvg(Assets.icons.wrong, width: 60.w, height: 60.w),
              20.verticalSpace,
              Text(
                title.tr,
                style: Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              10.verticalSpace,
              Text(description, style: Get.textTheme.bodyMedium, textAlign: TextAlign.center),
              25.verticalSpace,
              CustomButton(title: TStrings.ok.tr, onTap: () => Get.back()),
            ],
          ),
        ),
      ),
    );
  }
}