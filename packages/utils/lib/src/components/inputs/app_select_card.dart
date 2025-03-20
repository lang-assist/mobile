import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';

import '../../../utils.dart';

/// Select Card varyantları
enum AppSelectCardVariant {
  /// Gradient arkaplan ile vurgulu stil
  highlighted,

  /// Düz arkaplan rengi ile dolu stil
  filled,

  /// Kenarlıklı stil
  outlined,
}

class AppSelectCard<T> extends StatefulWidget {
  const AppSelectCard({
    super.key,
    this.signal,
    this.selected,
    this.value,
    this.onTap,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.variant = AppSelectCardVariant.filled,
    this.child,
    this.image,
    this.expandHorizontal = false,
    this.expandVertical = false,
    this.size = AppSizeVariant.medium,
    this.showSelectedIcon = false,
  }) : assert(
         title != null || child != null || image != null,
         "Either title, child or image must be provided",
       );

  final Signal<T>? signal;

  final bool? selected;

  final T? value;

  final VoidCallback? onTap;

  final bool showSelectedIcon;

  /// Başlık
  final String? title;
  final Widget? child;
  final Widget? image;

  /// Alt başlık (opsiyonel)
  final String? subtitle;

  /// Sol taraftaki widget (opsiyonel)
  final Widget? leading;

  /// Sağ taraftaki widget (opsiyonel)
  final Widget? trailing;

  /// Kartın görünüm stili (varsayılan: filled)
  final AppSelectCardVariant variant;

  final bool expandHorizontal, expandVertical;

  final AppSizeVariant size;

  @override
  State<AppSelectCard<T>> createState() => _AppSelectCardState<T>();
}

class _AppSelectCardState<T> extends State<AppSelectCard<T>> with Slot {
  bool _isHovered = false;
  bool _isTapping = false;

  @override
  void onValue(value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.signal != null) {
      widget.signal!.addSlot(this);
    }
  }

  @override
  void didUpdateWidget(AppSelectCard<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.signal != oldWidget.signal) {
      widget.signal?.addSlot(this);
      oldWidget.signal?.removeSlot(this);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.signal != null) {
      widget.signal!.addSlot(this);
    }
    setState(() {});
  }

  @override
  void dispose() {
    if (widget.signal != null) {
      widget.signal!.removeSlot(this);
    }
    super.dispose();
  }

  bool get _isSelected {
    if (widget.signal != null) {
      return widget.signal!.value == widget.value;
    }
    return widget.selected ?? false;
  }

  double get iconSize => switch (widget.size) {
    AppSizeVariant.small => 16.0,
    AppSizeVariant.medium => 20.0,
    AppSizeVariant.large => 24.0,
  };

  double get padding => switch (widget.size) {
    AppSizeVariant.small => 12.0,
    AppSizeVariant.medium => 16.0,
    AppSizeVariant.large => 20.0,
  };

  double get borderRadius => switch (widget.size) {
    AppSizeVariant.small => 8.0,
    AppSizeVariant.medium => 12.0,
    AppSizeVariant.large => 16.0,
  };

  BoxDecoration _getHighlightedDecoration(bool isSelected) => BoxDecoration(
    gradient: isSelected ? AppColors.primaryGradient : null,
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(
      color: isSelected ? Colors.transparent : AppColors.grey,
      width: 1,
    ),
    boxShadow: [
      if (isSelected)
        BoxShadow(
          color: AppColors.primary.op(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
          spreadRadius: 2,
        )
      else if (_isHovered)
        BoxShadow(
          color: AppColors.grey.op(0.2),
          blurRadius: 8,
          offset: const Offset(0, 2),
          spreadRadius: 1,
        ),
    ],
  );

  BoxDecoration _getOutlinedDecoration(bool isSelected) => BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(
      color: isSelected ? AppColors.primary : AppColors.grey,
      width: 1.5,
    ),
    boxShadow: [
      if (isSelected)
        BoxShadow(
          color: AppColors.primary.op(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        )
      else if (_isHovered)
        BoxShadow(
          color: AppColors.grey.op(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
    ],
  );

  BoxDecoration _getFilledDecoration(bool isSelected) => BoxDecoration(
    color: isSelected ? AppColors.primary : Colors.transparent,
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(
      color: isSelected ? AppColors.primary : AppColors.grey,
      width: 1,
    ),
    boxShadow: [
      if (isSelected)
        BoxShadow(
          color: AppColors.primary.op(0.2),
          blurRadius: 8,
          offset: const Offset(0, 2),
        )
      else if (_isHovered)
        BoxShadow(
          color: AppColors.grey.op(0.15),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
    ],
  );

  BoxDecoration _getDecoration(bool isSelected) {
    switch (widget.variant) {
      case AppSelectCardVariant.highlighted:
        return _getHighlightedDecoration(isSelected);
      case AppSelectCardVariant.outlined:
        return _getOutlinedDecoration(isSelected);
      case AppSelectCardVariant.filled:
        return _getFilledDecoration(isSelected);
    }
  }

  Color _getTextColor(bool isSelected) {
    if (isSelected) {
      switch (widget.variant) {
        case AppSelectCardVariant.highlighted:
        case AppSelectCardVariant.filled:
          return Colors.white;
        case AppSelectCardVariant.outlined:
          return AppColors.primary;
      }
    }
    return AppColors.textPrimary;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = _getTextColor(_isSelected);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width:
              widget.expandHorizontal && constraints.hasBoundedWidth
                  ? constraints.maxWidth
                  : null,
          height:
              widget.expandVertical && constraints.hasBoundedHeight
                  ? constraints.maxHeight
                  : null,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: GestureDetector(
              onTapDown: (_) => setState(() => _isTapping = true),
              onTapUp: (_) => setState(() => _isTapping = false),
              onTapCancel: () => setState(() => _isTapping = false),
              onTap: () {
                widget.onTap?.call();
                if (widget.signal != null && widget.value != null) {
                  // ignore: null_check_on_nullable_type_parameter
                  widget.signal!.value = widget.value!;
                }
              },
              child: Container(
                color: Colors.transparent,
                width:
                    widget.expandHorizontal && constraints.hasBoundedWidth
                        ? constraints.maxWidth
                        : null,
                height:
                    widget.expandVertical && constraints.hasBoundedHeight
                        ? constraints.maxHeight
                        : null,
                child: Stack(
                  children: [
                    AnimatedScale(
                      duration: animationDuration,
                      scale: _isSelected ? 1.01 : 1.0,
                      child: AnimatedScale(
                        duration: animationDuration,
                        scale: _isTapping ? 0.98 : 1.0,
                        child: AnimatedScale(
                          duration: animationDuration,
                          scale: _isHovered ? 1.02 : 1.0,
                          child: AnimatedContainer(
                            duration: animationDuration,
                            curve: Curves.easeInOut,
                            decoration: _getDecoration(_isSelected),
                            padding:
                                widget.image != null
                                    ? EdgeInsets.all(padding)
                                    : EdgeInsets.all(4),
                            width:
                                widget.expandHorizontal &&
                                        constraints.hasBoundedWidth
                                    ? constraints.maxWidth
                                    : null,
                            height:
                                widget.expandVertical &&
                                        constraints.hasBoundedHeight
                                    ? constraints.maxHeight
                                    : null,
                            child: Row(
                              children: [
                                if (widget.leading != null) ...[
                                  Expanded(flex: 1, child: widget.leading!),
                                  SizedBox(width: padding),
                                ],
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DefaultTextStyle(
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium!.copyWith(
                                          color: textColor,
                                          fontSize: padding,
                                          fontWeight:
                                              _isSelected
                                                  ? FontWeight.w600
                                                  : FontWeight.normal,
                                        ),
                                        child:
                                            widget.child ?? Text(widget.title!),
                                      ),

                                      if (widget.subtitle != null) ...[
                                        SizedBox(height: padding / 2),
                                        Text(
                                          widget.subtitle!,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium?.copyWith(
                                            color: textColor.op(0.8),
                                            fontSize: padding / 2,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                if (widget.trailing != null) ...[
                                  SizedBox(width: padding),
                                  widget.trailing!,
                                ] else if (widget.showSelectedIcon &&
                                    _isSelected) ...[
                                  SizedBox(width: padding),
                                  AnimatedScale(
                                    duration: const Duration(milliseconds: 200),
                                    scale: _isSelected ? 1.0 : 0.0,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: textColor,
                                      size: iconSize,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
