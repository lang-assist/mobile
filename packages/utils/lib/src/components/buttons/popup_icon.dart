import 'package:flutter/material.dart';

import '../../../utils.dart';

enum PopupPosition {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
  leftCenter,
  rightCenter,
}

class PopupIconButtonController {}

class PopupIconButton extends StatefulWidget {
  const PopupIconButton({
    super.key,
    required this.icon,
    required this.items,
    this.position = PopupPosition.bottomLeft,
    this.itemSpacing = 8.0,
    this.iconSize = 24.0,
    this.color,
    this.menuWidth = 200.0,
    this.menuItemHeight = 50.0,
    this.onOpen,
    this.onClose,
    this.menuDecoration,
  });

  final Widget? icon;
  final List<Widget> items;
  final PopupPosition position;
  final double itemSpacing;
  final double iconSize;
  final Color? color;
  final double menuWidth;

  final double menuItemHeight;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;
  final BoxDecoration? menuDecoration;

  @override
  State<PopupIconButton> createState() => PopupIconButtonState();
}

class PopupIconButtonState extends State<PopupIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _scaleAnimation;

  late final Animation<double> _fadeAnimation;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isOpen = false;

  void _showOverlay() {
    if (_isOpen) return;

    _isOpen = true;
    widget.onOpen?.call();
    _controller.forward();

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder:
          (context) => Material(
            color: Colors.transparent,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: hideOverlay,
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                    CompositedTransformFollower(
                      link: _layerLink,
                      targetAnchor: _getTargetAnchor(),
                      followerAnchor: _getFollowerAnchor(),
                      offset: _getOffset(),
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          alignment: _getAlignment(),
                          child: Container(
                            width: widget.menuWidth,
                            decoration:
                                widget.menuDecoration ??
                                BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.onSurface.op(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children:
                                  widget.items.map((item) {
                                    final index = widget.items.indexOf(item);
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            index == 0
                                                ? 8
                                                : widget.itemSpacing / 2,
                                        bottom:
                                            index == widget.items.length - 1
                                                ? 8
                                                : widget.itemSpacing / 2,
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: item,
                                    );
                                  }).toList(),
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

    overlay.insert(_overlayEntry!);
  }

  Future<void> hideOverlay() async {
    if (!_isOpen) return;

    _isOpen = false;
    widget.onClose?.call();
    await _controller.reverse();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Alignment _getAlignment() {
    switch (widget.position) {
      case PopupPosition.topLeft:
        return Alignment.bottomRight;
      case PopupPosition.topCenter:
        return Alignment.bottomCenter;
      case PopupPosition.topRight:
        return Alignment.bottomLeft;
      case PopupPosition.bottomLeft:
        return Alignment.topRight;
      case PopupPosition.bottomCenter:
        return Alignment.topCenter;
      case PopupPosition.bottomRight:
        return Alignment.topLeft;
      case PopupPosition.leftCenter:
        return Alignment.centerRight;
      case PopupPosition.rightCenter:
        return Alignment.centerLeft;
    }
  }

  Alignment _getTargetAnchor() {
    switch (widget.position) {
      case PopupPosition.topLeft:
        return Alignment.topLeft;
      case PopupPosition.topCenter:
        return Alignment.topCenter;
      case PopupPosition.topRight:
        return Alignment.topRight;
      case PopupPosition.bottomLeft:
        return Alignment.bottomLeft;
      case PopupPosition.bottomCenter:
        return Alignment.centerLeft;
      case PopupPosition.bottomRight:
        return Alignment.bottomRight;
      case PopupPosition.leftCenter:
        return Alignment.centerLeft;
      case PopupPosition.rightCenter:
        return Alignment.centerRight;
    }
  }

  Alignment _getFollowerAnchor() {
    switch (widget.position) {
      case PopupPosition.topLeft:
        return Alignment.topRight;
      case PopupPosition.topCenter:
        return Alignment.topLeft;
      case PopupPosition.topRight:
        return Alignment.topLeft;
      case PopupPosition.bottomLeft:
        return Alignment.topRight;
      case PopupPosition.bottomCenter:
        return Alignment.topRight;
      case PopupPosition.bottomRight:
        return Alignment.topLeft;
      case PopupPosition.leftCenter:
        return Alignment.centerRight;
      case PopupPosition.rightCenter:
        return Alignment.centerLeft;
    }
  }

  Offset _getOffset() {
    switch (widget.position) {
      case PopupPosition.topLeft:
        return Offset(-widget.itemSpacing, 0);
      case PopupPosition.topCenter:
        return const Offset(0, 0);
      case PopupPosition.topRight:
        return Offset(widget.itemSpacing, 0);
      case PopupPosition.bottomLeft:
        return Offset(-widget.itemSpacing, widget.itemSpacing);
      case PopupPosition.bottomCenter:
        return Offset(-widget.itemSpacing, 0);
      case PopupPosition.bottomRight:
        return Offset(widget.itemSpacing, widget.itemSpacing);
      case PopupPosition.leftCenter:
        return Offset(-widget.itemSpacing, 0);
      case PopupPosition.rightCenter:
        return Offset(widget.itemSpacing, 0);
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isOpen ? hideOverlay : _showOverlay,
          borderRadius: BorderRadius.circular(widget.iconSize),
          child: Container(
            width: widget.iconSize + 16,
            height: widget.iconSize + 16,
            alignment: Alignment.center,
            child:
                widget.icon ??
                Icon(
                  widget.icon is Icon
                      ? (widget.icon as Icon).icon!
                      : Icons.more_vert,
                  size: widget.iconSize,
                  color: widget.color ?? AppColors.primary,
                ),
          ),
        ),
      ),
    );
  }
}
