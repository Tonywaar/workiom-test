import 'package:workiom/export.dart';

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
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: 'Rubik',
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}