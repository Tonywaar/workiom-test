import 'package:workiom/export.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Rubik',
    hoverColor: TColors.greyColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: TColors.bgColor,
    cardColor: Colors.white,
    primaryColor: TColors.primary,
    dividerColor: TColors.greyColor,
    textTheme: TTextTheme.lightTextTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    canvasColor: TColors.primary,
  );
}