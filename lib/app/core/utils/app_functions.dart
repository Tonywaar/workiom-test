import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'colors.dart';

class AppFunctions {
  static void print(object) {
    if (!kReleaseMode) {
      debugPrint(object.toString());
    }
  }

  static customToast({required String message, bool isError = true}) {
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
      return 'This field is required'.tr;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required'.tr;
    } else if (!GetUtils.isEmail(val)) {
      return 'Invalid email address'.tr;
    } else {
      return null;
    }
  }

  static bool isLTR(String text) {
    final englishRegex = RegExp(r'[a-zA-Z]');
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    final englishCount = text.splitMapJoin(englishRegex, onMatch: (m) => m.group(0) ?? '', onNonMatch: (n) => '');
    final arabicCount = text.splitMapJoin(arabicRegex, onMatch: (m) => m.group(0) ?? '', onNonMatch: (n) => '');
    return englishCount.length >= arabicCount.length;
  }

  static void setStatusBarStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: TColors.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: TColors.primary,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}