import 'package:api/api.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TermsText extends StatefulWidget {
  const TermsText(
    this.terms, {
    super.key,
    this.style,
    this.onTermTap,
    this.highlightColor = Colors.yellow,
    this.popupBuilder,
  });

  final TermSet terms;
  final TextStyle? style;
  final void Function(Term term)? onTermTap;
  final Color highlightColor;
  final TermPopupBuilder? popupBuilder;

  @override
  State<TermsText> createState() => _TermsTextState();
}

typedef TermPopupBuilder =
    Widget Function(BuildContext context, Term term, VoidCallback hide);

class _TermsTextState extends State<TermsText> {
  Term? _highlightedTerm;
  OverlayEntry? _overlay;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _overlayKey = GlobalKey();

  TermSet get terms => widget.terms;

  bool hasNext(int index) {
    return index < terms.terms.length - 1;
  }

  bool hasPrev(int index) {
    return index > 0;
  }

  Term next(int index) {
    return terms.terms[index + 1];
  }

  Term prev(int index) {
    return terms.terms[index - 1];
  }

  bool spaceRequired(int index) {
    if (hasNext(index)) {
      final nextTerm = next(index);
      if (nextTerm.type == TermType.PUNCTUATION) {
        return false;
      }
    }
    return true;
  }

  Widget _defaultPopupBuilder(
    BuildContext context,
    Term term,
    VoidCallback hide,
  ) {
    Widget? subtitle;

    if (term.root != null) {
      subtitle = Text(term.root!, style: Theme.of(context).textTheme.bodySmall);
    }

    if (term.subTerms?.isNotEmpty ?? false) {
      return AppCard(
        title: TermsText(
          TermSet(term.subTerms!),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: subtitle,
        onTap: hide,
      );
    }
    return AppCard(
      title: Text(term.value, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: subtitle,
      onTap: hide,
    );
  }

  TermPopupBuilder get popupBuilder =>
      widget.popupBuilder ?? _defaultPopupBuilder;

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  void _hideOverlay() {
    _overlay?.remove();
    _overlay = null;
  }

  void _showOverlay(BuildContext context, Term term, TapUpDetails details) {
    _hideOverlay();

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
    Overlay.of(context).insert(_overlay!);
  }

  TextSpan space() {
    return const TextSpan(text: ' ');
  }

  bool interactive(Term term) {
    return term.type != TermType.WHITESPACE &&
        term.type != TermType.PUNCTUATION;
  }

  TextSpan _buildTermSpan(int index) {
    final term = terms.terms[index];
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
              _showOverlay(context, term, details);
              setState(() => _highlightedTerm = null);
            }
            ..onTapCancel = () {
              setState(() => _highlightedTerm = null);
            };
    }

    return TextSpan(
      text: term.value,
      style: widget.style?.copyWith(
        backgroundColor: isHighlighted ? widget.highlightColor.op(0.3) : null,
        decoration: isHighlighted ? TextDecoration.underline : null,
      ),
      recognizer: recognizer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: RichText(
        text: TextSpan(
          style: widget.style ?? DefaultTextStyle.of(context).style,
          children: [
            for (int i = 0; i < terms.terms.length; i++) ...[
              _buildTermSpan(i),
              if (spaceRequired(i)) space(),
            ],
          ],
        ),
      ),
    );
  }
}
