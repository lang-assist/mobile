import 'package:api/api.dart';
import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/pages/documentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:gql_data/gql_data.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';

class TermsText extends StatefulWidget {
  const TermsText(
    this.terms, {
    super.key,
    this.style,
    this.onTermTap,
    this.highlightColor = Colors.yellow,
    this.popupBuilder,
    this.divideWithColors = false,
  });

  TermsText.fromString(
    String text, {
    super.key,
    this.style,
    this.onTermTap,
    this.highlightColor = Colors.yellow,
    this.popupBuilder,
    this.divideWithColors = false,
  }) : terms = LinguisticUnitSet.unresolved(text);

  final LinguisticUnitSet terms;
  final TextStyle? style;
  final void Function(LinguisticUnit term)? onTermTap;
  final Color highlightColor;
  final TermPopupBuilder? popupBuilder;
  final bool divideWithColors;

  @override
  State<TermsText> createState() => _TermsTextState();
}

typedef TermPopupBuilder =
    Widget Function(
      BuildContext context,
      LinguisticUnit term,
      VoidCallback hide,
    );

class _TermsTextState extends State<TermsText>
    with Slot, SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  LinguisticUnit? _highlightedTerm;
  OverlayEntry? _overlay;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _overlayKey = GlobalKey();

  late LinguisticUnitSet terms = widget.terms;

  late final List<int> blanks = (() {
    final res = <int>[];
    for (var i = 0; i < terms.units.length; i++) {
      if (terms.units[i].blankId != null) {
        res.add(i);
      }
    }
    return res;
  }());

  String? blankPlaceholder(int index) {
    final blank = terms.units[index];
    final blankIndex = blanks.indexOf(index);
    if (blank.controller!.text.isNotEmpty) {
      return blank.controller!.text;
    }
    if (blanks.length > 1) {
      return "____ (Blank ${blankIndex + 1})";
    }
    return "____";
  }

  @override
  void onValue(value) {
    setState(() {});
  }

  bool hasBlankFocus(int index) {
    final focus =
        terms.units[index].focusNode != null &&
        terms.units[index].focusNode!.hasFocus;
    return focus;
  }

  bool hasNext(int index) {
    return index < terms.units.length - 1;
  }

  bool hasPrev(int index) {
    return index > 0;
  }

  LinguisticUnit next(int index) {
    return terms.units[index + 1];
  }

  LinguisticUnit prev(int index) {
    return terms.units[index - 1];
  }

  bool spaceRequired(int index) {
    return terms.spaceRequired(index);
  }

  Widget _defaultPopupBuilder(
    BuildContext context,
    LinguisticUnit term,
    VoidCallback hide,
  ) {
    // Widget? subtitle;

    // if (term.root != null) {
    //   subtitle = Text(term.root!, style: Theme.of(context).textTheme.bodySmall);
    // }

    return TermPopup(unit: term);
  }

  TermPopupBuilder get popupBuilder =>
      widget.popupBuilder ?? _defaultPopupBuilder;

  void _hideOverlay() {
    _overlay?.remove();
    _overlay = null;
  }

  Future<void> _showOverlay(
    BuildContext context,
    int index,
    TapUpDetails details,
  ) async {
    _hideOverlay();

    if (!widget.terms.resolved) {
      final resolved = await _resolve();
      if (!resolved) {
        return;
      }
    }

    if (!context.mounted) {
      return;
    }

    final term = terms.units[index];

    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;

    // Create overlay but don't insert yet
    _overlay = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: _hideOverlay,
                  behavior: HitTestBehavior.opaque,
                  child: Container(color: Colors.transparent),
                ),
              ),
              Positioned(
                left: details.globalPosition.dx,
                top: details.globalPosition.dy,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    // Get the popup size after it's built
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (_overlayKey.currentContext != null) {
                        final box =
                            _overlayKey.currentContext!.findRenderObject()
                                as RenderBox;
                        final size = box.size;

                        // Calculate position
                        double left = details.globalPosition.dx;
                        double top = details.globalPosition.dy;

                        // Adjust horizontal position if needed
                        if (left + size.width >
                            screenSize.width - screenPadding.right) {
                          left =
                              screenSize.width -
                              size.width -
                              screenPadding.right;
                        }
                        if (left < screenPadding.left) {
                          left = screenPadding.left;
                        }

                        // Adjust vertical position if needed
                        if (top + size.height >
                            screenSize.height - screenPadding.bottom) {
                          // Show above the tap point if not enough space below
                          top = details.globalPosition.dy - size.height - 10;

                          // If still not fitting, show at bottom of screen
                          if (top < screenPadding.top) {
                            top =
                                screenSize.height -
                                size.height -
                                screenPadding.bottom;
                          }
                        }
                        if (top < screenPadding.top) {
                          top = screenPadding.top;
                        }

                        // Update position if changed
                        if (left != details.globalPosition.dx ||
                            top != details.globalPosition.dy) {
                          final entry = _overlay;
                          if (entry != null) {
                            setState(() {
                              entry.markNeedsBuild();
                              _overlay = OverlayEntry(
                                builder:
                                    (context) => Stack(
                                      children: [
                                        Positioned.fill(
                                          child: GestureDetector(
                                            onTap: _hideOverlay,
                                            behavior: HitTestBehavior.opaque,
                                            child: Container(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: left,
                                          top: top,
                                          child: Material(
                                            key: _overlayKey,
                                            elevation: 8,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: popupBuilder(
                                              context,
                                              term,
                                              _hideOverlay,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              );
                              entry.remove();
                              Overlay.of(context).insert(_overlay!);
                            });
                          }
                        }
                      }
                    });

                    return Material(
                      key: _overlayKey,
                      elevation: 8,
                      borderRadius: BorderRadius.circular(8),
                      child: popupBuilder(context, term, _hideOverlay),
                    );
                  },
                ),
              ),
            ],
          ),
    );

    // Insert the overlay
    if (_overlay != null && context.mounted) {
      Overlay.of(context).insert(_overlay!);
    }
  }

  TextSpan space() {
    return const TextSpan(text: ' ');
  }

  bool interactive(LinguisticUnit term) {
    if (!terms.resolved) {
      return true;
    }
    return term.props?.isNotEmpty ?? false;
  }

  TextSpan _buildTermSpan(int index) {
    final term = terms.units[index];
    final isHighlighted = _highlightedTerm == term;

    TapGestureRecognizer? recognizer;

    if (interactive(term)) {
      recognizer =
          TapGestureRecognizer()
            ..onTapDown = (_) {
              setState(() => _highlightedTerm = term);
            }
            ..onTapUp = (details) {
              widget.onTermTap?.call(term);
              _showOverlay(context, index, details);
              setState(() => _highlightedTerm = null);
            }
            ..onTapCancel = () {
              setState(() => _highlightedTerm = null);
            };
    }

    Paint? background;

    if (hasBlankFocus(index)) {
      background = Paint()..color = widget.highlightColor.op(0.3);
    } else if (term.blankId != null) {
      if (term.controller!.text.isEmpty) {
        background = Paint()..color = AppColors.error.op(0.3);
      } else {
        background = Paint()..color = AppColors.success.op(0.3);
      }
    }

    var style = (widget.style ?? DefaultTextStyle.of(context).style).copyWith(
      backgroundColor: isHighlighted ? widget.highlightColor.op(0.3) : null,
      decoration: isHighlighted ? TextDecoration.underline : null,
      background: background,
    );

    if (widget.divideWithColors) {
      final bgColor = _bgColors[index % _bgColors.length];
      style = style.copyWith(foreground: Paint()..color = bgColor);
    }

    String text = term.text;

    if (term.blankId != null) {
      if (term.controller!.text.isEmpty) {
        text = blankPlaceholder(index) ?? "";
      }
    }

    return TextSpan(text: text, style: style, recognizer: recognizer);
  }

  void _listenFocus() {
    setState(() {});
  }

  bool get resolved => terms.resolved;

  Future<bool> _resolve() async {
    if (resolved) return true;
    if (!journeyController.hasJourney) {
      return false;
    }
    _controller.repeat();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Resolving..."),
        duration: Duration(seconds: 50),
      ),
    );

    try {
      terms = await Api.queries.parsedUnits(
        terms.units[0].text,
        journeyController.journey.id,
      );

      _controller.stop();
      _controller.value = 0;
      if (mounted) {
        setState(() {});
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The expression is resolved. Click it now!"),
          ),
        );
      }
      return true;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Error resolving")));
      }
      return false;
    } finally {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void initState() {
    for (var i = 0; i < terms.units.length; i++) {
      terms.units[i].focusNode?.addListener(_listenFocus);
    }
    _controller = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInBack));
    super.initState();
  }

  @override
  void dispose() {
    for (var i = 0; i < terms.units.length; i++) {
      terms.units[i].focusNode?.removeListener(_listenFocus);
    }
    _hideOverlay();
    _controller.dispose();
    super.dispose();
  }

  static final _bgColors = [
    Colors.red.op(1),
    Colors.green.op(1),
    Colors.blue.op(1),
    Colors.yellow.op(1),
    Colors.purple.op(1),
    Colors.orange.op(1),
    Colors.pink.op(1),
    Colors.teal.op(0.1),
    Colors.indigo.op(0.1),
    Colors.lime.op(0.1),
    Colors.amber.op(0.1),
    Colors.deepOrange.op(0.1),
    Colors.cyan.op(0.1),
    Colors.lightBlue.op(0.1),
    Colors.lightGreen.op(0.1),
    Colors.deepPurple.op(0.1),
    Colors.brown.op(0.1),
    Colors.blueGrey.op(0.1),
    Colors.grey.op(0.1),
    Colors.redAccent.op(0.1),
    Colors.greenAccent.op(0.1),
    Colors.blueAccent.op(0.1),
    Colors.yellowAccent.op(0.1),
    Colors.purpleAccent.op(0.1),
    Colors.orangeAccent.op(0.1),
    Colors.pinkAccent.op(0.1),
    Colors.tealAccent.op(0.1),
    Colors.indigoAccent.op(0.1),
    Colors.limeAccent.op(0.1),
    Colors.amberAccent.op(0.1),
    Colors.deepOrangeAccent.op(0.1),
    Colors.cyanAccent.op(0.1),
    Colors.lightBlueAccent.op(0.1),
    Colors.lightGreenAccent.op(0.1),
    Colors.deepPurpleAccent.op(0.1),
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? typo.bodyMedium;
    final textColor = textStyle.color ?? AppColors.onSurface;
    final animationColor = textColor.op(0.2);
    return CompositedTransformTarget(
      link: _layerLink,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final stops = <double>[
            -2,
            _animation.value - 0.1,
            _animation.value,
            _animation.value,
            1,
          ];
          return LayoutBuilder(
            builder: (context, constraints) {
              return RichText(
                text: TextSpan(
                  style: textStyle.copyWith(
                    foreground:
                        Paint()
                          ..shader = LinearGradient(
                            colors: [
                              textColor,
                              animationColor,
                              animationColor,
                              textColor,
                              textColor,
                            ],
                            stops: stops,
                          ).createShader(
                            Rect.fromLTWH(0, 0, constraints.maxWidth, 20),
                          ),
                  ),
                  children: [
                    for (int i = 0; i < terms.units.length; i++) ...[
                      _buildTermSpan(i),
                      if (spaceRequired(i)) space(),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TermPopup extends StatefulWidget {
  const TermPopup({super.key, required this.unit});

  final LinguisticUnit unit;

  @override
  State<TermPopup> createState() => _TermPopupState();
}

class _TermPopupState extends State<TermPopup> {
  bool get hasSubUnits =>
      widget.unit.subUnits != null && widget.unit.subUnits!.isNotEmpty;

  bool get hasProps =>
      widget.unit.props != null && widget.unit.props!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
      ),
      child: AppCard(
        title: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasSubUnits)
              TermsText(
                LinguisticUnitSet(widget.unit.subUnits!),
                divideWithColors: true,
              )
            else
              Text(widget.unit.text),
            if (hasProps) const SizedBox(height: 8),
            if (hasProps)
              ...widget.unit.props!.map(
                (prop) => TermProp(prop: prop, unit: widget.unit),
              ),
          ],
        ),
      ),
    );
  }
}

class TermProp extends StatefulWidget {
  const TermProp({super.key, required this.prop, required this.unit});

  final UnipProp prop;
  final LinguisticUnit unit;

  @override
  State<TermProp> createState() => _TermPropState();
}

class _Span {
  final String text;
  TextStyle style;
  final VoidCallback? onTap;

  _Span({required this.text, required this.style, this.onTap});

  TextSpan toTextSpan({TextStyle? style}) {
    return TextSpan(
      text: text,
      style: style ?? this.style,
      recognizer:
          onTap != null ? (TapGestureRecognizer()..onTap = onTap) : null,
    );
  }

  Widget toWidget({TextStyle? style}) {
    if (onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            child: IgnorePointer(
              ignoring: true,
              child: TermsText.fromString(
                text,
                style: (style ?? this.style).copyWith(color: AppColors.primary),
              ),
            ),
          ),
        ),
      );
    }
    return TermsText.fromString(text, style: style ?? this.style);
  }
}

class _TermPropState extends State<TermProp> {
  bool get isDict => widget.prop.dict != null;
  bool get hasDoc => widget.prop.doc != null;
  bool get hasValue => widget.prop.value != null;
  bool get hasKey => widget.prop.key != null;

  String get dictTarget {
    if (prop.value != null) {
      return prop.value!;
    }
    return widget.unit.text;
  }

  String get docTarget {
    return prop.doc!.title!;
  }

  String get docSearchTerm => prop.doc!.search!;

  String get docTitle => prop.doc?.title ?? prop.value ?? "Documentation";

  bool get onlyDict => prop.value == null;

  String get dictTitle =>
      onlyDict ? "Dictionary" : (prop.value ?? prop.key ?? "Dictionary");

  UnipProp get prop => widget.prop;

  @override
  Widget build(BuildContext context) {
    _Span? dictSpan;
    _Span? docSpan;
    _Span? valueSpan;
    _Span? keySpan;

    if (isDict && dictTarget != prop.value) {
      dictSpan = _Span(
        text: dictTitle,
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: AppColors.primary),
        onTap: () {
          logger.d("tap dict \"$dictTarget\"");
        },
      );
    }

    if (hasDoc) {
      docSpan = _Span(
        text: docTitle,
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: AppColors.primary),
        onTap: () {
          DocumentationContent.showAsBottomSheet(
            context,
            docTitle,
            docSearchTerm,
          );
        },
      );
    }

    if (hasKey) {
      keySpan = _Span(
        text: prop.key!,
        style: Theme.of(context).textTheme.bodyMedium!,
      );
    }

    if (hasValue) {
      valueSpan = _Span(
        text: prop.value!,
        style: Theme.of(context).textTheme.bodyLarge!,
        onTap:
            prop.value == dictTarget
                ? () {
                  logger.d("tap dict \"${prop.value}\"");
                }
                : null,
      );
    }

    // final additionalSpans = <TextSpan>[
    //   if (isDict && hasDoc)
    //     TextSpan(text: "\n")
    //   else if (isDict || hasDoc)
    //     TextSpan(text: " "),
    //   if (isDict) dictSpan!.toTextSpan(),
    //   if (isDict && hasDoc) TextSpan(text: " "),
    //   if (hasDoc) docSpan!.toTextSpan(),
    // ];

    final additionaWidgets = <Widget>[
      if (isDict && dictTarget != prop.value) dictSpan!.toWidget(),
      if (isDict && dictTarget != prop.value && hasDoc)
        const SizedBox(width: 4),
      if (hasDoc) docSpan!.toWidget(),
    ];

    if (hasKey && hasValue) {
      final keyStyle = Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.normal);
      final valueStyle = Theme.of(
        context,
      ).textTheme.bodySmall!.copyWith(fontStyle: FontStyle.italic);
      // return RichText(
      //   text: TextSpan(
      //     children: [
      //       keySpan!.toTextSpan(style: keyStyle),
      //       TextSpan(text: ": ", style: keyStyle),
      //       valueSpan!.toTextSpan(style: valueStyle),
      //       if (additionalSpans.isNotEmpty) TextSpan(text: "\n"),
      //       ...additionalSpans,
      //     ],
      //   ),
      // );

      return Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 4,
            runSpacing: 4,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.start,
            children: [
              keySpan!.toWidget(style: keyStyle),
              Text(": ", style: keyStyle),
              valueSpan!.toWidget(style: valueStyle),
            ],
          ),
          ...additionaWidgets,
        ],
      );
    }

    if (hasKey) {
      final keyStyle = Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic);
      // return RichText(
      //   text: TextSpan(
      //     children: [keySpan!.toTextSpan(style: keyStyle), ...additionalSpans],
      //   ),
      // );

      return Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [keySpan!.toWidget(style: keyStyle), ...additionaWidgets],
      );
    }

    if (hasValue) {
      final valueStyle = Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic);
      // return RichText(
      //   text: TextSpan(
      //     children: [
      //       valueSpan!.toTextSpan(style: valueStyle),
      //       ...additionalSpans,
      //     ],
      //   ),
      // );
      return Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [valueSpan!.toWidget(style: valueStyle), ...additionaWidgets],
      );
    }

    // return RichText(text: TextSpan(children: [...additionalSpans]));

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...additionaWidgets],
    );
  }
}
