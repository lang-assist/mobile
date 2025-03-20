import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils.dart';

class MenuItem {
  const MenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  final String title;
  final IconData icon;
  final void Function() onTap;
  final bool Function() isSelected;
}

class AppScaffold extends StatefulWidget {
  AppScaffold({
    required this.title,
    required this.body,
    this.actions,
    this.onBackPressed,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.drawerHeaderBuilder,
    this.menuItems = const [],
    this.showDrawer = true,
    this.onDrawerTap,
    this.statusBarColor,
    this.statusBarIconBrightness,
  }) : super(key: Key("page_scaffold_$title"));

  /// Sayfanın başlığı
  final String title;

  /// Sayfa içeriği
  final Widget body;

  /// AppBar'daki aksiyonlar
  final List<Widget>? actions;

  /// Geri butonu tıklandığında çalışacak fonksiyon
  final VoidCallback? onBackPressed;

  /// Floating action button
  final Widget? floatingActionButton;

  /// Floating action button konumu
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Bottom navigation bar
  final Widget? bottomNavigationBar;

  final WidgetBuilder? drawerHeaderBuilder;

  final List<MenuItem> menuItems;

  final bool showDrawer;

  final VoidCallback? onDrawerTap;

  /// Status bar rengi
  final Color? statusBarColor;

  /// Status bar ikon parlaklığı
  final Brightness? statusBarIconBrightness;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold>
    with SingleTickerProviderStateMixin {
  late final AnimationController _drawerController;

  late final Animation<double> _drawerSlide = CurvedAnimation(
    parent: _drawerController,
    curve: Curves.easeInOut,
  );

  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _drawerController.forward();
      } else {
        _drawerController.reverse();
      }
    });
  }

  @override
  void initState() {
    _drawerController = AnimationController(
      duration: animationDuration,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  bool get isWideScreen =>
      ResponsiveConfig.of(context).breakpoint == Breakpoint.desktop;

  Widget buildMenuItem(MenuItem item) {
    final isSelected = item.isSelected();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
        onTap: () {
          if (!isWideScreen) {
            _toggleDrawer();
          }
          item.onTap();
        },
        child: Container(
          height: switch (ResponsiveConfig.of(context).breakpoint) {
            Breakpoint.desktop => 48,
            Breakpoint.tablet => 40,
            Breakpoint.mobile => 32,
          },
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xs,
            vertical: AppSpacing.xxs,
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary.op(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSpacing.sm),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.md),
              if (isWideScreen || _isDrawerOpen)
                Expanded(
                  child: Text(
                    item.title,
                    style: typo.labelLarge.copyWith(
                      color:
                          isSelected
                              ? AppColors.primary
                              : AppColors.textPrimary,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border(
          bottom: BorderSide(color: Colors.white.op(0.1), width: 1),
        ),
      ),
      child:
          widget.drawerHeaderBuilder?.call(context) ?? const SizedBox.shrink(),
    );
  }

  // Widget buildSideMenu() {
  //   return Container(
  //     width: 280,
  //     height: double.infinity,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: AppColors.shadow.op(0.1),
  //           blurRadius: 20,
  //           offset: const Offset(2, 0),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         buildDrawerHeader(),
  //         Expanded(
  //           child: SingleChildScrollView(
  //             padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
  //             child: Column(
  //               children: [
  //                 for (final item in widget.menuItems) buildMenuItem(item),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  double get iconSize => switch (ResponsiveConfig.of(context).breakpoint) {
    Breakpoint.desktop => 24,
    Breakpoint.tablet => 20,
    Breakpoint.mobile => 16,
  };

  Widget buildAppBar() {
    return Container(
      height: ResponsiveConfig.of(context).appBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.op(0.1),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (widget.onBackPressed != null)
            AppButton(
              variant: AppButtonVariant.text,
              title: Icon(
                Icons.arrow_back,
                size: iconSize,
                color: AppColors.primary,
              ),
              onPressed: (_) => widget.onBackPressed!(),
            ),

          if (!isWideScreen)
            if (widget.showDrawer)
              AppButton(
                variant: AppButtonVariant.text,
                title: Icon(
                  Icons.menu,
                  size: iconSize,
                  color: AppColors.primary,
                ),
                onPressed: (_) {
                  if (widget.onDrawerTap != null) {
                    widget.onDrawerTap!();
                  }

                  _toggleDrawer();
                },
              ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: AutoSizeText(
              widget.title,
              style: typo.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                fontSize: 24,
              ),
              minFontSize: 12,
              maxFontSize: 24,
              maxLines: 1,
            ),
          ),

          const SizedBox(width: 16),
          if (widget.actions != null)
            Row(
              spacing: AppSpacing.md,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [...widget.actions!],
            ),
        ],
      ),
    );
  }

  late final seed = Random().nextInt(1000000);

  @override
  Widget build(BuildContext context) {
    // Status bar rengini ayarla
    final statusBarColor = widget.statusBarColor ?? AppColors.surface;
    final statusBarIconBrightness =
        widget.statusBarIconBrightness ??
        (AppColors.brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );

    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          alignment: Alignment.topLeft,
          children: [
            SizedBox.fromSize(
              size: mediaQuery.size,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: mediaQuery.size.height,
                    child: BrocaBackground(
                      seed: seed,
                      child: SizedBox.expand(),
                    ),
                  ),

                  // Ana içerik
                  AnimatedPositioned(
                    duration: animationDurationFast,
                    top: ResponsiveConfig.of(context).appBarHeight,
                    left: 0,
                    right: 0,
                    height:
                        mediaQuery.size.height -
                        ResponsiveConfig.of(context).appBarHeight -
                        mediaQuery.padding.top -
                        mediaQuery.viewInsets.vertical,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          children: [
                            Expanded(child: widget.body),
                            if (widget.bottomNavigationBar != null)
                              widget.bottomNavigationBar!,
                          ],
                        );
                      },
                    ),
                  ),

                  // Menü paneli (dar ekran)
                  if (!isWideScreen && widget.showDrawer)
                    AnimatedBuilder(
                      animation: _drawerSlide,
                      builder: (context, child) {
                        return Stack(
                          children: [
                            // Karartma
                            if (_isDrawerOpen)
                              Positioned.fill(
                                child: GestureDetector(
                                  onTap: _toggleDrawer,
                                  child: Container(
                                    color: Colors.black.op(
                                      0.3 * _drawerSlide.value,
                                    ),
                                  ),
                                ),
                              ),

                            // Menü
                            // Positioned(
                            //   left: -280 * (1 - _drawerSlide.value),
                            //   top: ResponsiveConfig.of(context).appBarHeight,
                            //   bottom: 0,
                            //   width: 280,
                            //   child: buildSideMenu(),
                            // ),
                          ],
                        );
                      },
                    ),
                  Positioned(top: 0, right: 0, left: 0, child: buildAppBar()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
    );
  }
}
