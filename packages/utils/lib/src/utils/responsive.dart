import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;

import 'package:flutter/scheduler.dart';

import '../constants/base.dart';

ResponsiveConfig get responsive =>
    ResponsiveConfig.of(ThemeProvider.instance.context);

/// Responsive yapılandırma sınıfı
class ResponsiveConfig {
  factory ResponsiveConfig._(
    Size screenSize,
    Orientation orientation,
    double sideBarWidth,
  ) {
    final breakpoint = _getBreakpoint(screenSize);

    final containerPadding = EdgeInsets.all(switch (breakpoint) {
      Breakpoint.mobile => 8,
      Breakpoint.tablet => 12,
      Breakpoint.desktop => 16,
    });

    // Content width hesaplama
    final availableWidth = screenSize.width - sideBarWidth;
    final tabletWidth = breakpoints[Breakpoint.tablet]!;
    final horizontalPadding = containerPadding.horizontal;
    final minContentWidth = tabletWidth - horizontalPadding;

    double contentWidth;
    if (availableWidth <= minContentWidth) {
      // Minimum padding'i çıkar
      contentWidth = availableWidth - horizontalPadding;
    } else {
      // Tablet genişliğinden sonraki ekstra alan
      final extraWidth = availableWidth - minContentWidth;
      // Ekstra alanın %30'unu içeriğe ekle ve minimum padding'i çıkar
      contentWidth = (minContentWidth + (extraWidth * 0.3)) - horizontalPadding;
    }

    return ResponsiveConfig._withValues(
      screenSize: screenSize,
      orientation: orientation,
      breakpoint: breakpoint,
      containerPadding: containerPadding,
      gridGutter: switch (breakpoint) {
        Breakpoint.mobile => 8,
        Breakpoint.tablet => 16,
        Breakpoint.desktop => 24,
      },
      gridColumns: switch (breakpoint) {
        Breakpoint.mobile => 1,
        Breakpoint.tablet => 2,
        Breakpoint.desktop => 4,
      },
      contentWidth: contentWidth,
      pagePadding: EdgeInsets.symmetric(
        horizontal: (screenSize.width - sideBarWidth - contentWidth) / 2,
        vertical: switch (breakpoint) {
          Breakpoint.mobile => 8,
          Breakpoint.tablet => 16,
          Breakpoint.desktop => 24,
        },
      ),
      sideBarWidth: sideBarWidth,
      appBarHeight: switch (breakpoint) {
        Breakpoint.mobile => 48,
        Breakpoint.tablet => 56,
        Breakpoint.desktop => 64,
      },
    );
  }

  ResponsiveConfig._withValues({
    required this.screenSize,
    required this.orientation,
    required this.breakpoint,
    required EdgeInsets containerPadding,
    required double gridGutter,
    required int gridColumns,
    required double contentWidth,
    required EdgeInsets pagePadding,
    required double sideBarWidth,
    required double appBarHeight,
  }) : _containerPadding = containerPadding,
       _gridGutter = gridGutter,
       _gridColumns = gridColumns,
       _contentWidth = contentWidth,
       _pagePadding = pagePadding,
       _sideBarWidth = sideBarWidth,
       _appBarHeight = appBarHeight;

  /// Ekran boyutu
  final Size screenSize;

  /// Ekran yönü
  final Orientation orientation;

  /// Breakpoint
  final Breakpoint breakpoint;

  static Breakpoint _getBreakpoint(Size screenSize) {
    if (screenSize.width < breakpoints[Breakpoint.tablet]!) {
      return Breakpoint.mobile;
    } else if (screenSize.width < breakpoints[Breakpoint.desktop]!) {
      return Breakpoint.tablet;
    } else {
      return Breakpoint.desktop;
    }
  }

  /// Private değişkenler
  EdgeInsets _containerPadding;
  double _gridGutter;
  int _gridColumns;
  double _contentWidth;
  EdgeInsets _pagePadding;
  double _sideBarWidth;
  double _appBarHeight;

  /// Getter'lar
  EdgeInsets get containerPadding => _containerPadding;
  double get gridGutter => _gridGutter;
  int get gridColumns => _gridColumns;
  double get contentWidth => _contentWidth;
  EdgeInsets get pagePadding => _pagePadding;
  double get sideBarWidth => _sideBarWidth;
  double get width => screenSize.width;
  double get height => screenSize.height;
  double get appBarHeight => _appBarHeight;

  /// İki config arasında interpolasyon
  static ResponsiveConfig lerp(
    ResponsiveConfig a,
    ResponsiveConfig b,
    double t,
  ) {
    // shouldInitialize false ile oluştur
    final config = ResponsiveConfig._withValues(
      screenSize: Size.lerp(a.screenSize, b.screenSize, t)!,
      orientation: t < 0.5 ? a.orientation : b.orientation,
      breakpoint: t < 0.5 ? a.breakpoint : b.breakpoint,
      containerPadding:
          EdgeInsets.lerp(a._containerPadding, b._containerPadding, t)!,
      gridGutter: lerpDouble(a._gridGutter, b._gridGutter, t)!,
      gridColumns: t < 0.5 ? a._gridColumns : b._gridColumns,
      contentWidth: lerpDouble(a._contentWidth, b._contentWidth, t)!,
      pagePadding: EdgeInsets.lerp(a._pagePadding, b._pagePadding, t)!,
      sideBarWidth: lerpDouble(a._sideBarWidth, b._sideBarWidth, t)!,
      appBarHeight: lerpDouble(a._appBarHeight, b._appBarHeight, t)!,
    );

    return config;
  }

  /// Factory constructor for creating from MediaQuery
  factory ResponsiveConfig.fromMediaQuery(MediaQueryData mediaQuery) {
    final size = mediaQuery.size;
    final orientation = mediaQuery.orientation;

    return ResponsiveConfig._(size, orientation, 0);
  }

  /// Config'i güncelleme
  ResponsiveConfig copyWith({
    Size? screenSize,
    Orientation? orientation,
    double? sideBarWidth,
  }) {
    return ResponsiveConfig._(
      screenSize ?? this.screenSize,
      orientation ?? this.orientation,
      sideBarWidth ?? this.sideBarWidth,
    );
  }

  static ResponsiveConfig of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_ResponsiveInherited>();
    assert(provider != null, 'No ResponsiveProvider found in context');
    return provider!.config;
  }

  static const breakpoints = {
    Breakpoint.mobile: 0.0,
    Breakpoint.tablet: 768.0,
    Breakpoint.desktop: 1200.0,
  };
}

/// Responsive provider widget'ı
class ResponsiveProvider extends StatefulWidget {
  const ResponsiveProvider({super.key, required this.child, this.config});

  final Widget child;
  final ResponsiveConfig? config;

  /// Responsive config'e erişim
  static ResponsiveConfig of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<_ResponsiveInherited>();
    assert(provider != null, 'No ResponsiveProvider found in context');
    return provider!.config;
  }

  /// Sidebar genişliğini güncelle
  static void setSidebarWidth(BuildContext context, double width) {
    final provider = context.findAncestorStateOfType<ResponsiveProviderState>();
    assert(provider != null, 'No ResponsiveProvider found in context');
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      provider!.setSidebarWidth(width);
    });
  }

  @override
  State<ResponsiveProvider> createState() => ResponsiveProviderState();
}

class ResponsiveProviderState extends State<ResponsiveProvider>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  ResponsiveConfig? _config;
  ResponsiveConfig? _fromConfig;
  late final AnimationController _controller;
  late Breakpoint _currentBreakpoint;
  double _currentSidebarWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _controller.addStatusListener(_onAnimationStatus);
  }

  @override
  void didUpdateWidget(ResponsiveProvider oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.config != null && widget.config != oldWidget.config) {
      _updateConfig(widget.config!);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // İlk config'i set et
    if (_config == null) {
      // _updateConfig(
      //   widget.config ??
      //       ResponsiveConfig.fromMediaQuery(MediaQuery.of(context)),
      // );
      return;
    }

    // MediaQuery değişikliklerini yakala
    if (widget.config == null) {
      final newConfig = ResponsiveConfig.fromMediaQuery(
        MediaQuery.of(context),
      ).copyWith(sideBarWidth: _currentSidebarWidth);
      _updateConfig(newConfig);
    }
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _fromConfig = _config;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_onAnimationStatus);
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _updateConfig(ResponsiveConfig newConfig) {
    final oldConfig = _config;
    _config = newConfig;

    // Breakpoint veya sidebar width değiştiyse animasyon yap
    if (_currentBreakpoint != newConfig.breakpoint ||
        _currentSidebarWidth != newConfig.sideBarWidth) {
      _currentBreakpoint = newConfig.breakpoint;
      _currentSidebarWidth = newConfig.sideBarWidth;

      _fromConfig = oldConfig;

      if (_controller.isAnimating) {
        _controller.stop();
      }

      _controller.forward(from: 0).then((value) {
        setState(() {
          _fromConfig = null;
        });
      });
    }
  }

  @override
  void didChangeMetrics() {
    if (widget.config == null) {
      final newConfig = ResponsiveConfig.fromMediaQuery(
        MediaQuery.of(context),
      ).copyWith(sideBarWidth: _currentSidebarWidth);
      _updateConfig(newConfig);
    }
  }

  /// Sidebar genişliğini güncelle
  void setSidebarWidth(double width) {
    if (_config == null) return;
    final newConfig = _config!.copyWith(sideBarWidth: width);
    _updateConfig(newConfig);
  }

  @override
  Widget build(BuildContext context) {
    if (_config == null) {
      _config = ResponsiveConfig.fromMediaQuery(
        MediaQuery.of(context),
      ).copyWith(sideBarWidth: _currentSidebarWidth);
      _currentBreakpoint = _config!.breakpoint;
      _currentSidebarWidth = _config!.sideBarWidth;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final config =
            _fromConfig == null
                ? _config!
                : ResponsiveConfig.lerp(
                  _fromConfig!,
                  _config!,
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeInOut,
                  ).value,
                );

        return _ResponsiveInherited(config: config, child: child!);
      },
      child: widget.child,
    );
  }
}

/// Responsive inherited widget
class _ResponsiveInherited extends InheritedWidget {
  const _ResponsiveInherited({required super.child, required this.config});

  final ResponsiveConfig config;

  @override
  bool updateShouldNotify(_ResponsiveInherited oldWidget) {
    return config.screenSize != oldWidget.config.screenSize ||
        config.orientation != oldWidget.config.orientation ||
        config.breakpoint != oldWidget.config.breakpoint ||
        config.sideBarWidth != oldWidget.config.sideBarWidth ||
        config.containerPadding != oldWidget.config.containerPadding ||
        config.gridGutter != oldWidget.config.gridGutter ||
        config.gridColumns != oldWidget.config.gridColumns ||
        config.contentWidth != oldWidget.config.contentWidth ||
        config.pagePadding != oldWidget.config.pagePadding;
  }
}

/// Responsive page mixin'i
mixin ResponsivePageMixin<T extends StatefulWidget> on State<T> {
  /// Build metodu yerine bu implement edilecek
  Widget buildResponsive(BuildContext context, ResponsiveConfig config);

  @override
  Widget build(BuildContext context) {
    final config = ResponsiveProvider.of(context);
    return buildResponsive(context, config);
  }
}

/// Cihaz tipleri
enum DeviceType { mobile, tablet, desktop }

/// Breakpoint'ler
enum Breakpoint { mobile, tablet, desktop }
