part of 'base.dart';

class AppSpacing {
  // Temel boşluk değerleri
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;

  // Özel boşluk değerleri
  static const double buttonHeight = 48.0;
  static const double inputHeight = 48.0;
  static const double cardPadding = md;
  static const double sectionSpacing = xl;
  static const double pageMargin = lg;

  // Border radius değerleri
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;

  // Elevation değerleri
  static const double elevationXs = 2.0;
  static const double elevationSm = 4.0;
  static const double elevationMd = 8.0;
  static const double elevationLg = 16.0;
  static const double elevationXl = 24.0;

  // Radius değerleri
  static const double radiusNone = 0;
  static const double radiusSmall = 8;
  static const double radiusMedium = 12;
  static const double radiusLarge = 18;
  static const double radiusExtraLarge = 24;

  static const BorderRadius borderRadiusNone = BorderRadius.zero;
  static BorderRadius borderRadiusSmall = BorderRadius.circular(radiusSmall);
  static BorderRadius borderRadiusMedium = BorderRadius.circular(radiusMedium);
  static BorderRadius borderRadiusLarge = BorderRadius.circular(radiusLarge);
  static BorderRadius borderRadiusExtraLarge = BorderRadius.circular(
    radiusExtraLarge,
  );
}
