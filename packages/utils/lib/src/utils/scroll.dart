import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants/base.dart';

class SmootScroll extends StatefulWidget {
  final ScrollController? scrollController;

  final Widget Function(ScrollController) builder;

  const SmootScroll({super.key, this.scrollController, required this.builder});

  @override
  State<SmootScroll> createState() => _SmootScrollState();
}

class _SmootScrollState extends State<SmootScroll> {
  late final scrollController = widget.scrollController ?? ScrollController();
  double? _finalOffset;
  double get finalOffset => _finalOffset!;
  set finalOffset(double value) {
    if (scrollController.hasClients) {
      _finalOffset = clampDouble(
        value,
        scrollController.position.minScrollExtent - 50,
        scrollController.position.maxScrollExtent + 50,
      );
    } else {
      _finalOffset = value;
    }
  }

  bool get hasFinalOffset => _finalOffset != null;

  _scrollListener() {
    final pos = scrollController.positions.firstOrNull;
    if (pos != null && pos.userScrollDirection != ScrollDirection.idle) {
      finalOffset = pos.pixels;
    }
    if (scrollController.hasClients && !hasFinalOffset) {
      finalOffset = scrollController.position.pixels;
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _handlePointerSignal,
      child: _IgnorePointerSignal(child: widget.builder(scrollController)),
    );
  }

  void _handlePointerSignal(PointerSignalEvent e) {
    _scrollListener();
    if (e is PointerScrollEvent && e.scrollDelta.dy.abs() > 0) {
      final delta = e.scrollDelta.dy;
      if (hasFinalOffset) {
        finalOffset += delta;
        scrollController.animateTo(
          finalOffset,
          duration: Duration(
            milliseconds: animationDuration.inMilliseconds * 2,
          ),
          curve: Curves.linear,
        );
      }
    } else {
      finalOffset = scrollController.position.pixels;
    }
  }
}

// workaround https://github.com/flutter/flutter/issues/35723
class _IgnorePointerSignal extends SingleChildRenderObjectWidget {
  const _IgnorePointerSignal({required super.child});

  @override
  RenderObject createRenderObject(_) => _IgnorePointerSignalRenderObject();
}

class _IgnorePointerSignalRenderObject extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    final res = super.hitTest(result, position: position);
    for (var item in result.path) {
      final target = item.target;
      if (target is RenderPointerListener) {
        target.onPointerSignal = null;
      }
    }
    return res;
  }
}
