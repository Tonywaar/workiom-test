import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TOutLinedButtonTheme {
  TOutLinedButtonTheme._();

  static final lightOutLinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: TColors.primary),
      textStyle: const TextStyle(fontSize: 16.0, color: TColors.primary, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
    ),
  );
}