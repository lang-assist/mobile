import 'package:flutter/material.dart';

import '../../utils.dart';

class AppTabView extends StatefulWidget {
  const AppTabView({
    super.key,
    required this.tabs,
    required this.children,
    this.initialIndex = 0,
    this.onTabChanged,
  });

  /// Tab'ların başlıkları
  final List<String> tabs;

  /// Tab'ların içerikleri
  final List<Widget> children;

  /// Başlangıç tab indeksi
  final int initialIndex;

  /// Tab değiştiğinde çağrılacak fonksiyon
  final ValueChanged<int>? onTabChanged;

  @override
  State<AppTabView> createState() => _AppTabViewState();
}

class _AppTabViewState extends State<AppTabView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
      animationDuration: animationDuration,
    );

    _controller.addListener(() {
      if (_controller.indexIsChanging) return;
      widget.onTabChanged?.call(_controller.index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = ResponsiveProvider.of(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        // Tab Bar Container
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: theme.colorScheme.surface),
          padding: config.containerPadding.copyWith(top: 0, bottom: 0),
          child: TabBar(
            controller: _controller,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            // Tab indicator stili
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: theme.colorScheme.primary, width: 2),
              ),
            ),
            // Tab label stili
            labelStyle: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: theme.textTheme.titleSmall,
            // Tab padding
            padding: EdgeInsets.zero,

            labelPadding: EdgeInsets.symmetric(
              horizontal:
                  ResponsiveConfig.of(context).containerPadding.horizontal,
              vertical: 0,
            ),
            // Tab hover/press efektleri
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return theme.colorScheme.primary.op(0.1);
              }
              if (states.contains(WidgetState.hovered)) {
                return theme.colorScheme.primary.op(0.05);
              }
              return null;
            }),
            tabs:
                widget.tabs.map((tab) {
                  return Tab(
                    height: ResponsiveConfig.of(context).appBarHeight,
                    child: Text(tab, style: const TextStyle(height: 1)),
                  );
                }).toList(),
          ),
        ),

        // Tab Content
        Expanded(
          child: TabBarView(controller: _controller, children: widget.children),
        ),
      ],
    );
  }
}
