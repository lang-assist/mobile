import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils.dart';

class _GridConfig {
  final int columns;
  final double columnWidth;
  final double gutter;
  final double margin;

  const _GridConfig({
    required this.columns,
    required this.columnWidth,
    required this.gutter,
    required this.margin,
  });

  double get totalWidth => columnWidth * columns + gutter * (columns - 1);
}

class AuthScaffold extends StatefulWidget {
  const AuthScaffold({
    super.key,
    required this.title,
    required this.children,
    this.onBackPressed,
    this.showBackButton = true,
    this.subtitle,
    this.maxContentWidth,
    this.semanticChildrenCount,
  });

  /// Sayfanın başlığı
  final String title;

  /// Sayfa alt başlığı (opsiyonel)
  final String? subtitle;

  /// Sayfa içeriği
  final List<Widget> children;

  /// Geri butonu tıklandığında çalışacak fonksiyon
  final VoidCallback? onBackPressed;

  /// Geri butonunun gösterilip gösterilmeyeceği
  final bool showBackButton;

  /// İçeriğin maksimum genişliği (opsiyonel)
  /// Eğer belirtilmezse grid sistemine göre hesaplanır
  final double? maxContentWidth;

  /// Form elemanlarının sayısı (erişilebilirlik için)
  final int? semanticChildrenCount;

  @override
  State<AuthScaffold> createState() => _AuthScaffoldState();
}

class _AuthScaffoldState extends State<AuthScaffold> {
  /// Grid sistemini viewport genişliğine göre ayarlar
  _GridConfig _getGridConfig(double width) {
    if (width >= 1200) {
      return const _GridConfig(
        columns: 12,
        columnWidth: 80,
        gutter: 24,
        margin: 48,
      );
    } else if (width >= 768) {
      return const _GridConfig(
        columns: 8,
        columnWidth: 80,
        gutter: 16,
        margin: 32,
      );
    } else {
      return const _GridConfig(
        columns: 4,
        columnWidth: 72,
        gutter: 16,
        margin: 16,
      );
    }
  }

  late final seed = Random().nextInt(1000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: BrocaBackground(
        seed: seed,
        key: Key("broca_auth_background_$seed"),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // print("build layout builder $seed");
            final gridConfig = _getGridConfig(constraints.maxWidth);
            final availableWidth = constraints.maxWidth;

            // Container genişliğini grid sistemine göre ayarla
            final containerWidth =
                widget.maxContentWidth ??
                gridConfig.totalWidth.clamp(
                  0.0,
                  availableWidth - (gridConfig.margin * 2),
                );

            return CustomScrollView(
              slivers: [
                // Geri butonu ve başlık
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      width: containerWidth,
                      margin: EdgeInsets.symmetric(
                        horizontal: gridConfig.margin,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xl, // 32px spacing
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.showBackButton &&
                              Navigator.of(context).canPop()) ...[
                            Semantics(
                              button: true,
                              label: 'Geri dön',
                              child: AppButton(
                                variant: AppButtonVariant.text,
                                title: AppIcons.back(
                                  size: 24,
                                  color: AppColors.textPrimary,
                                ),
                                onPressed: (_) {
                                  if (widget.onBackPressed != null) {
                                    widget.onBackPressed!();
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: AppSpacing.lg,
                            ), // 24px spacing
                          ],
                          Semantics(
                            header: true,
                            child: Text(
                              widget.title,
                              style: typo.displayLarge.copyWith(
                                fontSize: 32,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          if (widget.subtitle != null) ...[
                            const SizedBox(
                              height: AppSpacing.md,
                            ), // 16px spacing
                            Semantics(
                              header: true,
                              child: Text(
                                widget.subtitle!,
                                style: typo.titleLarge.copyWith(
                                  fontSize: 20,
                                  height: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),

                // İçerik
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      width: containerWidth,
                      margin: EdgeInsets.symmetric(
                        horizontal: gridConfig.margin,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xl, // 32px spacing
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DefaultTextStyle(
                        style: typo.labelLarge.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                        child: MergeSemantics(
                          child: Semantics(
                            explicitChildNodes: true,
                            container: true,
                            child: FocusTraversalGroup(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...widget.children
                                      .expand(
                                        (child) => [
                                          child,
                                          const SizedBox(
                                            height: AppSpacing.lg,
                                          ), // 24px spacing
                                        ],
                                      )
                                      .toList()
                                    ..removeLast(), // Son spacing'i kaldır
                                  // Klavye açıldığında bottom padding
                                  SizedBox(
                                    height:
                                        MediaQuery.of(
                                          context,
                                        ).viewInsets.bottom,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
