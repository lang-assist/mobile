part of 'base.dart';

class AppTheme {
  static ThemeData _theme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.nunito().fontFamily,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        onPrimary: AppColors._onPrimary[brightness]!,
        onError: AppColors._onError[brightness]!,
        onSecondary: AppColors._onSecondary[brightness]!,
        primary: AppColors._primary[brightness]!,
        secondary: AppColors._secondary[brightness]!,
        surface: AppColors._surface[brightness]!,
        error: AppColors._error[brightness]!,
        tertiary: AppColors._accent[brightness]!,
        onSurface: AppColors._onSurface[brightness]!,
      ),
      scaffoldBackgroundColor: AppColors._surface[brightness]!,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors._surface[brightness]!,
        elevation: 5,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors._textPrimary[brightness]!,
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
        shadowColor: AppColors._surface[brightness]!.op(0.5),
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        bodyMedium: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        bodySmall: GoogleFonts.nunito(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        labelLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        labelMedium: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        labelSmall: GoogleFonts.nunito(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        titleLarge: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        titleMedium: GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        titleSmall: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        displayLarge: GoogleFonts.nunito(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        displayMedium: GoogleFonts.nunito(
          fontSize: 40,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        displaySmall: GoogleFonts.nunito(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        headlineLarge: GoogleFonts.nunito(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        headlineMedium: GoogleFonts.nunito(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
        headlineSmall: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors._textPrimary[brightness]!,
        ),
      ),
    );
  }

  static ThemeData get light {
    return _theme(Brightness.light);
  }

  static ThemeData get dark {
    return _theme(Brightness.dark);
  }
}
