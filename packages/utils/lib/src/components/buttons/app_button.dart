import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';

import '../../../utils.dart';

enum AppButtonVariant {
  primary,
  secondary,
  outlined,
  text,
  danger,
  highlighted,
  icon,
}

enum AppSizeVariant { small, medium, large }

class ShakeCurve extends Curve {
  const ShakeCurve({this.count = 3});
  final int count;
  @override
  double transformInternal(double t) => sin(count * pi * t);
}

class AppButton extends StatefulWidget {
  AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    Signal<bool>? isActive,
    Signal<bool>? isGroupActive,
    this.onInactivePressed,
    this.onLongPress,
    this.isFullWidth = false,
    this.variant = AppButtonVariant.primary,
    this.size = AppSizeVariant.medium,
    Signal<bool>? isLoading,
    this.subtitle,
    this.customBackgroundDecoration,
    this.customTextStyle,
    this.customIconSize,
    this.customIconTheme,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onCancelling,
    this.progressLocation = VerticalDirection.down,
  }) : isActive = isActive ?? Signal(true),
       isGroupActive = isGroupActive ?? Signal(true),
       isLoading = isLoading ?? Signal(false);

  /// Butonun başlığı
  final Widget title;

  /// Sol taraftaki ikon (opsiyonel)
  final Widget? prefixIcon;

  /// Sağ taraftaki ikon (opsiyonel)
  final Widget? suffixIcon;

  final VerticalDirection progressLocation;

  /// Tıklama olayı
  final FutureOr<void> Function(Function(String? progress) progressMessage)
  onPressed;

  /// Pasif durumdayken tıklama olayı (opsiyonel)
  final VoidCallback? onInactivePressed;

  /// Uzun basma olayı (opsiyonel)
  final VoidCallback? onLongPress;

  final void Function(TapDownDetails)? onTapDown;

  final void Function(TapUpDetails)? onTapUp;

  final VoidCallback? onTapCancel;

  final void Function(bool cancelling)? onCancelling;

  /// Butonun aktif olup olmadığı (varsayılan: true)
  final Signal<bool> isActive;

  /// Butonun grup içinde aktif olup olmadığı (varsayılan: true)
  final Signal<bool> isGroupActive;

  /// Yükleniyor durumu (varsayılan: false)
  final Signal<bool> isLoading;

  /// Tam genişlik kullanımı (varsayılan: false)
  final bool isFullWidth;

  /// Butonun görünüm stili (varsayılan: primary)
  final AppButtonVariant variant;

  /// Butonun boyutu (varsayılan: medium)
  final AppSizeVariant size;

  /// Alt başlık (opsiyonel)
  final Widget? subtitle;

  /// Özel arkaplan dekorasyonu (opsiyonel)
  /// Eğer belirtilirse, variant'ın dekorasyonu yerine bu kullanılır
  final BoxDecoration? customBackgroundDecoration;

  /// Özel metin stili (opsiyonel)
  /// Eğer belirtilirse, varsayılan metin stili yerine bu kullanılır
  final TextStyle? customTextStyle;

  /// Özel ikon boyutu (opsiyonel)
  /// Eğer belirtilirse, size'a göre belirlenen ikon boyutu yerine bu kullanılır
  final double? customIconSize;

  /// Özel ikon teması (opsiyonel)
  /// Eğer belirtilirse, varsayılan ikon teması yerine bu kullanılır
  final IconThemeData? customIconTheme;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with TickerProviderStateMixin, Slot<void> {
  late bool _isLoading = widget.isLoading.value;

  bool get isActive {
    return widget.isActive.value && widget.isGroupActive.value && !_isLoading;
  }

  Signal<String?> progressMessage = Signal<String?>(null);

  Future<void> onTap() async {
    if (isActive) {
      setState(() {
        _isLoading = true;
        widget.isLoading.value = true;
        widget.isGroupActive.value = false;
      });
      try {
        await widget.onPressed((p) {
          progressMessage.value = p;
        });
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
            widget.isLoading.value = false;
            widget.isGroupActive.value = true;
          });
        }
      }
    } else {
      _shakeController.forward().then((_) => _shakeController.reverse());
      if (_isLoading) return;
      widget.onInactivePressed?.call();
    }
  }

  // Animasyon kontrolleri
  late final AnimationController _shakeController = AnimationController(
    duration: const Duration(milliseconds: 150),
    reverseDuration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<double> _shakeAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _shakeController,
      curve: const ShakeCurve(count: 2),
      reverseCurve: const ShakeCurve(count: 1),
    ),
  );

  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(milliseconds: 80),
    reverseDuration: const Duration(milliseconds: 80),
    vsync: this,
  );

  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 1,
    end: 1.05,
  ).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut));

  @override
  void dispose() {
    _shakeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  // Boyut hesaplamaları
  double get height => switch (widget.size) {
    AppSizeVariant.small => 32.0,
    AppSizeVariant.medium => 40.0,
    AppSizeVariant.large => 48.0,
  };

  double get iconSize => switch (widget.size) {
    AppSizeVariant.small => 16.0,
    AppSizeVariant.medium => 20.0,
    AppSizeVariant.large => 24.0,
  };

  double get indicatorSize => switch (widget.size) {
    AppSizeVariant.small => 24.0,
    AppSizeVariant.medium => 32.0,
    AppSizeVariant.large => 40.0,
  };

  bool get isMiniPadding => widget.variant == AppButtonVariant.text;

  EdgeInsetsGeometry get padding => switch (widget.size) {
    AppSizeVariant.small => EdgeInsets.symmetric(
      horizontal: isMiniPadding ? AppSpacing.xs : AppSpacing.sm,
      vertical: AppSpacing.xs,
    ),
    AppSizeVariant.medium => EdgeInsets.symmetric(
      horizontal: isMiniPadding ? AppSpacing.sm : AppSpacing.md,
      vertical: AppSpacing.sm,
    ),
    AppSizeVariant.large => EdgeInsets.symmetric(
      horizontal: isMiniPadding ? AppSpacing.sm : AppSpacing.md,
      vertical: AppSpacing.sm,
    ),
  };

  // Stil hesaplamaları
  Color getBackgroundColor(ThemeData theme) => switch (widget.variant) {
    AppButtonVariant.primary => AppColors.primary.op(isActive ? 1 : 0.7),
    AppButtonVariant.secondary => AppColors.secondary.op(0.15),
    AppButtonVariant.danger => AppColors.error.op(isActive ? 1 : 0.7),
    AppButtonVariant.text => Colors.transparent,
    AppButtonVariant.outlined => Colors.transparent,
    AppButtonVariant.highlighted => Colors.transparent,
    AppButtonVariant.icon => Colors.transparent,
  };

  Color getForegroundColor(ThemeData theme) => switch (widget.variant) {
    AppButtonVariant.primary => AppColors.onPrimary,
    AppButtonVariant.secondary => AppColors.secondary,
    AppButtonVariant.danger => AppColors.onError,
    AppButtonVariant.text => AppColors.primary,
    AppButtonVariant.outlined => AppColors.primary,
    AppButtonVariant.highlighted => AppColors.onPrimary,
    AppButtonVariant.icon => AppColors.primary,
  };

  Color getIndicatorColor(ThemeData theme) => switch (widget.variant) {
    AppButtonVariant.primary => AppColors.onPrimary,
    AppButtonVariant.secondary => AppColors.secondary,
    AppButtonVariant.danger => AppColors.onError,
    AppButtonVariant.text => AppColors.primary,
    AppButtonVariant.outlined => AppColors.primary,
    AppButtonVariant.highlighted => AppColors.onPrimary,
    AppButtonVariant.icon => AppColors.primary,
  };

  BoxDecoration getDecoration(ThemeData theme) => switch (widget.variant) {
    AppButtonVariant.primary => BoxDecoration(
      color: getBackgroundColor(theme),
      borderRadius: BorderRadius.circular(8),
    ),
    AppButtonVariant.secondary => BoxDecoration(
      color: getBackgroundColor(theme),
      borderRadius: BorderRadius.circular(8),
    ),
    AppButtonVariant.danger => BoxDecoration(
      color: getBackgroundColor(theme),
      borderRadius: BorderRadius.circular(8),
    ),
    AppButtonVariant.text => const BoxDecoration(),
    AppButtonVariant.icon => const BoxDecoration(),
    AppButtonVariant.outlined => BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: theme.colorScheme.primary),
      borderRadius: BorderRadius.circular(8),
    ),
    AppButtonVariant.highlighted => BoxDecoration(
      gradient: AppColors.primaryGradient,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.grey.op(0.3),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: AppColors.primary.op(0.25),
          blurRadius: 16,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
    ),
  };

  bool get useCrossFade =>
      widget.variant == AppButtonVariant.icon || widget.prefixIcon != null;

  @override
  void onValue(void value) {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.isActive.addSlot(this);
    widget.isGroupActive.addSlot(this);
    widget.isLoading.addSlot(this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var decoration = widget.customBackgroundDecoration ?? getDecoration(theme);

    final iconColor = getForegroundColor(theme);
    final textStyle =
        widget.customTextStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          color: iconColor,
          fontWeight: FontWeight.w600,
        );

    final iconTheme =
        widget.customIconTheme ??
        IconThemeData(
          color: iconColor,
          size: widget.customIconSize ?? iconSize,
        );

    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value * 8, 0),
          child: child,
        );
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTapDown: (details) {
            if (isActive) {
              _scaleController.forward();
            }
            widget.onTapDown?.call(details);
          },
          onTapUp: (details) {
            if (isActive) {
              _scaleController.reverse();
            }
            widget.onTapUp?.call(details);
          },

          onLongPressEnd: (details) {
            if (isActive) {
              _scaleController.reverse();
            }
            widget.onTapCancel?.call();
          },

          onLongPressMoveUpdate: (details) {
            double distance = details.localOffsetFromOrigin.distance;
            widget.onCancelling?.call(distance > 100);
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              InkWell(
                onTap: onTap,
                onLongPress: widget.onLongPress,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  width: widget.isFullWidth ? double.infinity : null,
                  padding: padding,
                  decoration: decoration,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.prefixIcon != null) ...[
                        Builder(
                          builder: (ctx) {
                            final child = SizedBox(
                              width: iconSize + 4,
                              height: iconSize + 4,
                              child: AnimatedOpacity(
                                duration: animationDuration,
                                opacity: isActive ? 1 : 0.7,
                                child: IconTheme(
                                  data: iconTheme,
                                  child: widget.prefixIcon!,
                                ),
                              ),
                            );

                            return AnimatedCrossFade(
                              duration: animationDuration,
                              crossFadeState:
                                  _isLoading
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                              firstChild: child,
                              secondChild: SizedBox.square(
                                dimension: iconSize + 4,
                                child: AIIndicator(
                                  size: iconSize,
                                  color: iconColor,
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: AppSpacing.sm),
                      ],

                      if (!useCrossFade) ...[
                        AnimatedContainer(
                          duration: Duration(
                            milliseconds:
                                animationDuration.inMilliseconds ~/ 1.5,
                          ),
                          width: _isLoading ? indicatorSize + 8 : 0,
                          height: _isLoading ? iconSize : 0,
                          alignment: Alignment.centerLeft,
                          child:
                              _isLoading
                                  ? Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: indicatorSize,
                                        child: AIIndicator(
                                          size: iconSize,
                                          color: iconColor,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ],
                                  )
                                  : null,
                        ),
                      ],

                      if (widget.variant != AppButtonVariant.icon)
                        AnimatedOpacity(
                          duration: animationDuration,
                          opacity: isActive ? 1 : 0.7,
                          child: IconTheme(
                            data: iconTheme,
                            child: DefaultTextStyle(
                              style: textStyle!,
                              child: widget.title,
                            ),
                          ),
                        )
                      else
                        AnimatedCrossFade(
                          duration: animationDuration,
                          crossFadeState:
                              _isLoading
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                          firstChild: SizedBox.square(
                            dimension: iconSize + 4,
                            child: IconTheme(
                              data: iconTheme,
                              child: DefaultTextStyle(
                                style: textStyle!,
                                child: widget.title,
                              ),
                            ),
                          ),
                          secondChild: SizedBox.square(
                            dimension: iconSize + 4,
                            child: AIIndicator(
                              size: iconSize,
                              color: iconColor,
                              strokeWidth: 2,
                            ),
                          ),
                        ),

                      if (widget.suffixIcon != null) ...[
                        const SizedBox(width: 8),
                        AnimatedOpacity(
                          duration: animationDuration,
                          opacity: isActive ? 1 : 0.7,
                          child: IconTheme(
                            data: iconTheme,
                            child: widget.suffixIcon!,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              progressMessage.builder((p) {
                if (p == null) return const SizedBox.shrink();
                return Positioned(
                  left: 0,
                  right: 0,
                  top:
                      widget.progressLocation == VerticalDirection.up
                          ? -40
                          : null,
                  bottom:
                      widget.progressLocation == VerticalDirection.down
                          ? -40
                          : null,
                  child: Text(p),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
