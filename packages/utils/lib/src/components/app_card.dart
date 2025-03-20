import 'package:flutter/material.dart';

import '../../utils.dart';

/// A card component that follows the Lang Assist design system.
///
/// Properties:
/// - [title]: Title of the card (required if no image)
/// - [subtitle]: Optional subtitle
/// - [image]: Image widget (required if no title)
/// - [onTap]: Optional tap callback for interactive cards
/// - [padding]: Custom padding (defaults to 16px)
/// - [isInteractive]: Whether the card should have hover/press animations
/// - [expandHorizontal]: Whether the card should expand horizontally
/// - [color]: Background color of the card
/// - [size]: Size variant of the card
/// - [border]: Custom border settings
class AppCard extends StatefulWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? image;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final bool isInteractive;
  final bool expandHorizontal;
  final Color? color;
  final AppSizeVariant size;
  final Border? border;
  final bool scaleOnHover;

  const AppCard({
    super.key,
    this.title,
    this.subtitle,
    this.image,
    this.onTap,
    this.padding,
    this.isInteractive = false,
    this.expandHorizontal = false,
    this.color,
    this.size = AppSizeVariant.medium,
    this.border,
    this.scaleOnHover = true,
  }) : assert(
         title != null || image != null,
         'Either title or image must be provided',
       );

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double get padding => switch (widget.size) {
    AppSizeVariant.small => 12,
    AppSizeVariant.medium => 16,
    AppSizeVariant.large => 20,
  };

  double get borderRadius => switch (widget.size) {
    AppSizeVariant.small => 8,
    AppSizeVariant.medium => 12,
    AppSizeVariant.large => 16,
  };

  double get titleFontSize => switch (widget.size) {
    AppSizeVariant.small => 14,
    AppSizeVariant.medium => 16,
    AppSizeVariant.large => 18,
  };

  double get subtitleFontSize => titleFontSize - 2;

  double get titleSpacing => titleFontSize / 2;

  double get subtitleSpacing => subtitleFontSize / 2;

  Widget _buildTextOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black.op(0.7)],
          stops: const [0.4, 1.0],
        ),
      ),
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            DefaultTextStyle.merge(
              style: TextStyle(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
              ),
              child: widget.title!,
            ),
          if (widget.subtitle != null) ...[
            SizedBox(height: subtitleSpacing),
            DefaultTextStyle.merge(
              style: TextStyle(
                color: Colors.white.op(0.8),
                fontSize: subtitleFontSize,
              ),
              child: widget.subtitle!,
            ),
          ],
        ],
      ),
    );
  }

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget card = AnimatedContainer(
      duration: animationDuration,
      padding:
          widget.image != null
              ? widget.padding
              : (widget.padding ?? EdgeInsets.all(padding)),
      decoration: BoxDecoration(
        color: widget.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        border: widget.border ?? Border.all(color: Colors.black.op(0.05)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            color: Colors.black.op(0.1),
          ),
        ],
      ),
      child:
          widget.image != null
              ? ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Stack(
                  children: [
                    Positioned.fill(child: widget.image!),
                    Positioned.fill(child: _buildTextOverlay()),
                  ],
                ),
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.title != null) ...[
                    SizedBox(
                      width: widget.expandHorizontal ? double.infinity : null,
                      child: DefaultTextStyle.merge(
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: titleFontSize,
                        ),
                        child: widget.title!,
                      ),
                    ),
                    if (widget.subtitle != null) ...[
                      SizedBox(height: subtitleSpacing),
                      DefaultTextStyle.merge(
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color?.op(0.7),
                          fontSize: subtitleFontSize,
                        ),
                        child: widget.subtitle!,
                      ),
                    ],
                  ],
                ],
              ),
    );

    if (widget.scaleOnHover) {
      card = AnimatedScale(
        duration: animationDuration,
        scale: _isHovered ? 1.02 : 1.0,
        child: card,
      );

      card = MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovered = false;
          });
        },
        child: card,
      );
    }

    if (widget.onTap != null) {
      card = GestureDetector(onTap: widget.onTap, child: card);
    }

    return card;
  }
}
