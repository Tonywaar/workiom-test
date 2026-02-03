import 'package:flutter/material.dart';
import 'package:workiom/export.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: const Color(0xFF707070),
    suffixIconColor: const Color(0xFF707070),
    fillColor: const Color(0xFFF5F5F5),
    filled: true,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: const Color(0xFF707070)),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: const Color(0xFF707070),
      fontWeight: FontWeight.w400,
    ),
    errorStyle: const TextStyle().copyWith(fontWeight: FontWeight.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.textPrimary.withValues(alpha: .8),
    ),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 0, color: TColors.greyColor),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 0, color: TColors.greyColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 0, color: TColors.primary),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: TColors.redColor),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 2, color: TColors.redColor),
    ),
  );
}