import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gql_data/gql_data.dart';
import 'package:utils/utils.dart';
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
      isSelected: isSelected('/journeys'),
      onTap: () {
        journeyController.clearJourney();
        context.go('/journeys');
      },
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
          style: typo.titleMedium.copyWith(
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

  late final canPop = context.canPop();

  final popupState = GlobalKey<PopupIconButtonState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      body: widget.body,
      showDrawer: false,
      // menuItems: menuItems,
      onBackPressed:
          widget.showBackButton && canPop
              ? () {
                context.pop();
              }
              : null,
      actions: [
        ...?widget.actions,
        if (AuthController().isAuthenticated)
          PopupIconButton(
            key: popupState,
            icon: ImggenUserAvatar(avatar: user.avatar, size: 24),
            menuDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            items: [
              AppButton(
                variant: AppButtonVariant.primary,
                prefixIcon: Icon(Icons.book_outlined),
                onPressed: (_) async {
                  await popupState.currentState?.hideOverlay();
                  journeyController.clearJourney();
                  if (context.mounted) {
                    context.journeys();
                  }
                },
                title: Text("Journeys"),
              ),
              AppButton(
                variant: AppButtonVariant.primary,
                prefixIcon: Icon(Icons.book_outlined),
                onPressed: (_) async {
                  await popupState.currentState?.hideOverlay();
                  if (context.mounted) {
                    context.journeyDocs();
                  }
                },
                title: Text("Journey Docs"),
              ),
              AppButton(
                variant: AppButtonVariant.primary,
                prefixIcon: Icon(Icons.book_outlined),
                onPressed: (_) {},
                title: Text("Dictionary"),
              ),
              AppButton(
                variant: AppButtonVariant.outlined,
                prefixIcon: Icon(Icons.settings_outlined),
                onPressed: (_) async {
                  await context.push('/subscription');
                },
                title: Text("Settings"),
              ),
              AppButton(
                variant: AppButtonVariant.danger,
                prefixIcon: Icon(Icons.exit_to_app_outlined),
                onPressed: (_) {
                  AuthController().logout();
                },
                title: Text("Çıkış Yap"),
              ),
            ],
          ),
      ],
    );
  }
}
