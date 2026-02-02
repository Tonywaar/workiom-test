import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: TColors.whiteColor,
      backgroundColor: Colors.transparent,
      textStyle: TextStyle(color: TColors.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik'),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      splashFactory: NoSplash.splashFactory,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
  );
}