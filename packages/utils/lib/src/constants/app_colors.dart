part of 'base.dart';

class AppColors {
  static Brightness get brightness => _theme.currentBrightness;

  // Ana renkler
  static final Map<Brightness, Color> _primary = {
    Brightness.light: Color(0xFF638738),
    Brightness.dark: Color(0xFF638738),
  }; // Yeşil

  static final Map<Brightness, Color> _onPrimary = {
    Brightness.light: Color(0xFFF8F7F5),
    Brightness.dark: Color(0xFFF8F7F5),
  }; // Beyaz

  static final Map<Brightness, Color> _secondary = {
    Brightness.light: Color(0xFF94683D),
    Brightness.dark: Color(0xFF94683D),
  }; // Kahverengi

  static final Map<Brightness, Color> _onSecondary = {
    Brightness.light: Color(0xFFFFF8F0),
    Brightness.dark: Color(0xFFFFF8F0),
  }; // Açık bej

  static final Map<Brightness, Color> _accent = {
    Brightness.light: Color(0xFFD4A373),
    Brightness.dark: Color(0xFFD4A373),
  }; // Altın sarısı

  static final Map<Brightness, Color> _onAccent = {
    Brightness.light: Color(0xFF2C1810),
    Brightness.dark: Color(0xFFF5E6D3),
  }; // Light: Koyu kahve, Dark: Açık krem

  // Nötr renkler
  static final Map<Brightness, Color> _surface = {
    Brightness.light: Color(0xFFFAF6F0),
    Brightness.dark: Color(0xFF1A1410),
  }; // Light: Krem, Dark: Koyu kahve

  static final Map<Brightness, Color> _onSurface = {
    Brightness.light: Color(0xFF2C1810),
    Brightness.dark: Color(0xFFF5E6D3),
  }; // Light: Koyu kahve, Dark: Açık krem

  static final Map<Brightness, Color> _textPrimary = {
    Brightness.light: Color(0xFF2C1810),
    Brightness.dark: Color(0xFFF5E6D3),
  }; // Light: Koyu kahve, Dark: Açık krem

  static final Map<Brightness, Color> _textSecondary = {
    Brightness.light: Color(0xFF6B4423),
    Brightness.dark: Color(0xFFE6C9A8),
  }; // Light: Orta kahve, Dark: Bej

  static final Map<Brightness, Color> _textHint = {
    Brightness.light: Color(0xFF6B4423).op(0.5),
    Brightness.dark: Color(0xFFE6C9A8).op(0.5),
  }; // Yarı saydam text

  static final Map<Brightness, Color> _grey = {
    Brightness.light: Color(0xFFCBB9A8),
    Brightness.dark: Color(0xFF8B7355),
  }; // Nötr gri-kahve tonları

  // Durum renkleri
  static final Map<Brightness, Color> _success = {
    Brightness.light: Color(0xFF638738),
    Brightness.dark: Color(0xFF7DA652),
  }; // Primary yeşil tonu

  static final Map<Brightness, Color> _onSuccess = {
    Brightness.light: Color(0xFFF8F7F5),
    Brightness.dark: Color(0xFFF8F7F5),
  }; // Beyaz

  static final Map<Brightness, Color> _warning = {
    Brightness.light: Color(0xFFE9B949),
    Brightness.dark: Color(0xFFE9B949),
  }; // Altın sarısı

  static final Map<Brightness, Color> _onWarning = {
    Brightness.light: Color(0xFF2C1810),
    Brightness.dark: Color(0xFFF5E6D3),
  }; // Light: Koyu kahve, Dark: Açık krem

  static final Map<Brightness, Color> _error = {
    Brightness.light: Color(0xFFD62828),
    Brightness.dark: Color(0xFFFF6B6B),
  }; // Kırmızı

  static final Map<Brightness, Color> _onError = {
    Brightness.light: Color(0xFFFFF8F0),
    Brightness.dark: Color(0xFFFFF8F0),
  }; // Beyaz

  static final Map<Brightness, Color> _info = {
    Brightness.light: Color(0xFF457B9D),
    Brightness.dark: Color(0xFF88C2E6),
  }; // Mavi

  static final Map<Brightness, Color> _onInfo = {
    Brightness.light: Color(0xFFF8F7F5),
    Brightness.dark: Color(0xFFF8F7F5),
  }; // Beyaz

  // Gölgelendirme
  static final Map<Brightness, Color> _shadow = {
    Brightness.light: Color(0x1A2C1810),
    Brightness.dark: Color(0x1A000000),
  }; // Yarı saydam gölge

  static final Map<Brightness, Color> _inputBackground = {
    Brightness.light: _primary[Brightness.light]!.op(0.1),
    Brightness.dark: _primary[Brightness.dark]!.op(0.15),
  }; // Light: Krem, Dark: Koyu kahve

  // Gradients
  static final Map<Brightness, Gradient> _primaryGradient = {
    Brightness.light: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF2B5C1C), // Derin yeşil
        Color(0xFF638738), // Ana yeşil
        Color(0xFF7FB344), // Parlak yeşil
      ],
      stops: [0.0, 0.5, 1.0],
      transform: GradientRotation(-0.3),
    ),
    Brightness.dark: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF2B5C1C), // Derin yeşil
        Color(0xFF638738), // Ana yeşil
        Color(0xFF7FB344), // Parlak yeşil
      ],
      stops: [0.0, 0.5, 1.0],
      transform: GradientRotation(-0.3),
    ),
  };

  static final Map<Brightness, Gradient> _highlightGradient = {
    Brightness.light: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF638738), Color(0xFF94683D), Color(0xFFD4A373)],
      stops: [0.0, 0.5, 1.0],
      transform: GradientRotation(-0.4),
    ),
    Brightness.dark: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF638738), Color(0xFF94683D), Color(0xFFD4A373)],
      stops: [0.0, 0.5, 1.0],
      transform: GradientRotation(-0.4),
    ),
  };

  static final Map<Brightness, Color> _highlightShadow = {
    Brightness.light: Color(0xFF638738),
    Brightness.dark: Color(0xFF638738),
  };

  static Color get primary => _primary[brightness]!;
  static Color get onPrimary => _onPrimary[brightness]!;
  static Color get secondary => _secondary[brightness]!;
  static Color get onSecondary => _onSecondary[brightness]!;
  static Color get accent => _accent[brightness]!;
  static Color get onAccent => _onAccent[brightness]!;

  static Gradient get primaryGradient => _primaryGradient[brightness]!;
  static Gradient get highlightGradient => _highlightGradient[brightness]!;
  static Color get highlightShadow => _highlightShadow[brightness]!;

  static Color get surface => _surface[brightness]!;
  static Color get onSurface => _onSurface[brightness]!;
  static Color get textPrimary => _textPrimary[brightness]!;
  static Color get textSecondary => _textSecondary[brightness]!;
  static Color get textHint => _textHint[brightness]!;
  static Color get grey => _grey[brightness]!;

  static Color get success => _success[brightness]!;
  static Color get onSuccess => _onSuccess[brightness]!;
  static Color get warning => _warning[brightness]!;
  static Color get onWarning => _onWarning[brightness]!;
  static Color get error => _error[brightness]!;
  static Color get onError => _onError[brightness]!;
  static Color get info => _info[brightness]!;
  static Color get onInfo => _onInfo[brightness]!;

  static Color get shadow => _shadow[brightness]!;
  static Color get inputBackground => _inputBackground[brightness]!;
}
