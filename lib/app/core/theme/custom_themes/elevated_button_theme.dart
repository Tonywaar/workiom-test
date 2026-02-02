import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.whiteColor,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.greyColor,
      disabledBackgroundColor: TColors.greyColor,
      side: const BorderSide(color: TColors.primary),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500, fontFamily: 'Rubik'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: TColors.primary),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500, fontFamily: 'Rubik'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}