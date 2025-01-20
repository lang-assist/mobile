import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_data/user_data.dart';
import '../utils/auth.dart';

class UserScaffold extends StatefulWidget {
  UserScaffold({
    required this.title,
    required this.body,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  }) : super(key: Key("page_scaffold_$title"));

  /// Sayfanın başlığı
  final String title;

  /// Sayfa içeriği
  final Widget body;

  /// AppBar'daki aksiyonlar
  final List<Widget>? actions;

  /// Geri butonunun gösterilip gösterilmeyeceği
  final bool showBackButton;

  /// Geri butonu tıklandığında çalışacak fonksiyon
  final VoidCallback? onBackPressed;

  /// Floating action button
  final Widget? floatingActionButton;

  /// Floating action button konumu
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Bottom navigation bar
  final Widget? bottomNavigationBar;

  @override
  State<UserScaffold> createState() => _UserScaffoldState();
}

class _UserScaffoldState extends State<UserScaffold>
    with SingleTickerProviderStateMixin {
  bool Function() isSelected(String route) {
    return () =>
        currentRoute == route ||
        (route != '/' && currentRoute.startsWith(route));
  }

  late final List<MenuItem> menuItems = [
    MenuItem(
      title: 'Ana Sayfa',
      icon: Icons.home_outlined,
      isSelected: isSelected('/'),
      onTap: () => context.go('/'),
    ),
    MenuItem(
      title: 'Üyeler',
      icon: Icons.people_outline,
      isSelected: isSelected('/members'),
      onTap: () => context.go('/members'),
    ),
    MenuItem(
      title: 'Hizmetler',
      icon: Icons.people_outline,
      isSelected: isSelected('/services'),
      onTap: () => context.go('/services'),
    ),
    MenuItem(
      title: 'Randevular',
      icon: Icons.calendar_today_outlined,
      isSelected: isSelected('/appointments'),
      onTap: () => context.go('/appointments'),
    ),
    MenuItem(
      title: 'Ayarlar',
      icon: Icons.settings_outlined,
      isSelected: isSelected('/settings'),
      onTap: () => context.go('/settings'),
    ),
  ];

  Widget buildDrawerHeader(BuildContext context) {
    return Column(
      children: [
        ImggenUserAvatar(avatar: user.avatar, size: 48, isHero: false),
        const SizedBox(height: AppSpacing.md),
        Text(
          user.name,
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: AppSpacing.xs),
      ],
    );
  }

  String get currentRoute =>
      GoRouter.of(
        context,
      ).routerDelegate.currentConfiguration.matches.first.matchedLocation;

  Fragment$PublicUser get user => AuthController().user;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      body: widget.body,
      showDrawer: false,
      onBackPressed:
          widget.showBackButton && context.canPop()
              ? () {
                context.pop();
              }
              : null,
      actions: [
        ...?widget.actions,
        if (AuthController().isAuthenticated)
          ImggenUserAvatar(avatar: user.avatar, size: 24),
      ],
    );
  }
}
