part of 'base.dart';

final typo = AppTypography();

class AppTypography {
  AppTypography([this._color]);

  TextTheme get _textTheme =>
      Theme.of(ThemeProvider.instance.context).textTheme;

  final Color? _color;

  AppTypography get secondary => AppTypography(AppColors.textSecondary);
  AppTypography get hint => AppTypography(AppColors.textHint);

  TextStyle get headlineLarge =>
      _textTheme.headlineLarge!.copyWith(color: _color);
  TextStyle get headlineMedium =>
      _textTheme.headlineMedium!.copyWith(color: _color);
  TextStyle get headlineSmall =>
      _textTheme.headlineSmall!.copyWith(color: _color);
  TextStyle get titleLarge => _textTheme.titleLarge!.copyWith(color: _color);
  TextStyle get titleMedium => _textTheme.titleMedium!.copyWith(color: _color);
  TextStyle get titleSmall => _textTheme.titleSmall!.copyWith(color: _color);

  TextStyle get bodyLarge => _textTheme.bodyLarge!.copyWith(color: _color);
  TextStyle get bodyMedium => _textTheme.bodyMedium!.copyWith(color: _color);
  TextStyle get bodySmall => _textTheme.bodySmall!.copyWith(color: _color);

  TextStyle get labelLarge => _textTheme.labelLarge!.copyWith(color: _color);
  TextStyle get labelMedium => _textTheme.labelMedium!.copyWith(color: _color);
  TextStyle get labelSmall => _textTheme.labelSmall!.copyWith(color: _color);

  TextStyle get displayLarge =>
      _textTheme.displayLarge!.copyWith(color: _color);
  TextStyle get displayMedium =>
      _textTheme.displayMedium!.copyWith(color: _color);
  TextStyle get displaySmall =>
      _textTheme.displaySmall!.copyWith(color: _color);
}
