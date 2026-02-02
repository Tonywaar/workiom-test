import 'package:workiom/export.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Rubik',
      color: TColors.textPrimary,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Rubik',
      color: TColors.textSecondary,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Rubik',
      color: TColors.textSecondary,
    ),
    titleLarge: const TextStyle().copyWith(fontSize: 19.sp, fontWeight: FontWeight.w500, fontFamily: 'Rubik', color: TColors.textPrimary),
    titleMedium: const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, fontFamily: 'Rubik', color: TColors.textPrimary),
    titleSmall: const TextStyle().copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik', color: TColors.textSecondary),
    bodyLarge: const TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500, fontFamily: 'Rubik', color: TColors.textPrimary),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik', color: TColors.textPrimary),
    bodySmall: const TextStyle().copyWith(fontSize: 19.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik', color: TColors.textPrimary),
  );
}