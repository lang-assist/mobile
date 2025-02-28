import 'dart:async';

import 'package:api/api.dart';
import 'package:assist_app/src/controllers/conversation.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class ConversationPlayerProvider extends InheritedWidget {
  const ConversationPlayerProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  final ConversationController controller;

  @override
  bool updateShouldNotify(ConversationPlayerProvider oldWidget) {
    return oldWidget.controller != controller;
  }

  static ConversationController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ConversationPlayerProvider>()!
        .controller;
  }
}

class ConversationPlayer extends StatefulWidget {
  const ConversationPlayer({super.key, required this.turn});

  final Fragment$ConversationTurn turn;

  @override
  State<ConversationPlayer> createState() => _ConversationPlayerState();
}

class _ConversationPlayerState extends State<ConversationPlayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 1500),
  );

  late final List<Animation<double>> _barAnimations = [
    Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.8, curve: Curves.easeInOut),
      ),
    ),
    Tween<double>(begin: 0.3, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 0.9, curve: Curves.easeInOut),
      ),
    ),
    Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ConversationPlayerProvider.of(context);

    return controller.playingTurnId.builder((_) {
      final isPlaying = controller.isTurnPlaying(widget.turn.id);
      final color =
          widget.turn.character == "\$user" ? Colors.white : AppColors.primary;

      if (isPlaying && !_animationController.isAnimating) {
        _animationController.repeat(reverse: true);
      } else if (!isPlaying && _animationController.isAnimating) {
        _animationController.stop();
      }
      return GestureDetector(
        onTap: () {
          if (isPlaying) {
            controller.pauseTurn();
          } else {
            controller.playTurn(widget.turn.id);
          }
        },
        child: SizedBox(
          width: 24,
          height: 24,
          child:
              isPlaying
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < _barAnimations.length; i++)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: AnimatedBuilder(
                            animation: _barAnimations[i],
                            builder: (context, child) {
                              return Container(
                                width: 3,
                                height: 16 * _barAnimations[i].value,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  )
                  : Icon(Icons.play_arrow, color: color, size: 20),
        ),
      );
    });
  }
}

class WithProgressBar extends StatelessWidget {
  const WithProgressBar({
    super.key,
    required this.child,
    required this.progress,
    this.height = 4.0,
    this.progressColor,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
    this.containerDecoration,
  });

  final Widget child;
  final double progress;
  final double height;
  final Color? progressColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;
  final BoxDecoration? containerDecoration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pgColor = progressColor ?? theme.primaryColor;
    final radius = borderRadius ?? BorderRadius.circular(height / 2);

    return Stack(
      children: [
        child,
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.hasBoundedWidth) {
              return Container(
                height: height,
                width: constraints.maxWidth * progress.clamp(0.0, 1.0),
                decoration: BoxDecoration(color: pgColor, borderRadius: radius),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({
    super.key,
    required this.audioId,
    this.horizontalExpanded = false,
    this.animated = true,
    this.color,
    this.backgroundColor,
    this.borderRadius,
    this.iconSize = 24.0,
    this.onComplete,
    this.autoPlay = false,
    this.showProgressBar = true,
  });

  final String audioId;
  final bool horizontalExpanded;
  final bool animated;
  final Color? color;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double iconSize;
  final VoidCallback? onComplete;
  final bool autoPlay;
  final bool showProgressBar;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  late final AudioPlayer _player;
  late final AnimationController _animationController;
  late final List<Animation<double>> _barAnimations;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  double get _progress =>
      _duration.inMilliseconds > 0
          ? _position.inMilliseconds / _duration.inMilliseconds
          : 0.0;

  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    _player.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _position = _duration;
        if (_animationController.isAnimating) {
          _animationController.stop();
        }
      });

      if (widget.onComplete != null) {
        widget.onComplete!();
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _barAnimations = [
      Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.0, 0.8, curve: Curves.easeInOut),
        ),
      ),
      Tween<double>(begin: 0.3, end: 0.9).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.2, 0.9, curve: Curves.easeInOut),
        ),
      ),
      Tween<double>(begin: 0.3, end: 0.7).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
        ),
      ),
    ];

    if (widget.autoPlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _playAudio();
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _player.dispose();
    super.dispose();
  }

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
      _animationController.stop();
      _positionSubscription?.pause();
    } else {
      await _playAudio();
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  Future<void> _playAudio() async {
    final url = audioIdToUrl(widget.audioId);
    await _player.play(UrlSource(url));
    _duration = await _player.getDuration() ?? Duration.zero;

    _durationSubscription?.cancel();
    _durationSubscription = _player.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    _positionSubscription?.cancel();
    _positionSubscription = _player.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    if (widget.animated) {
      _animationController.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppColors.primary;
    final backgroundColor = widget.backgroundColor ?? AppColors.surface;
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(12);

    final playerContent = AppCard(
      padding: responsive.containerPadding,
      color: backgroundColor,
      onTap: _togglePlay,
      title: Row(
        mainAxisSize:
            widget.horizontalExpanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isPlaying && widget.animated)
            _buildAnimatedBars(color)
          else
            Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow_rounded,
              color: color,
              size: widget.iconSize,
            ),
          if (widget.horizontalExpanded) ...[
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isPlaying ? "Playing audio..." : "Play audio",
                    style: TextStyle(color: color, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );

    // final playerContent = Container(
    //   height: 48,
    //   width: widget.horizontalExpanded ? double.infinity : null,
    //   decoration: BoxDecoration(
    //     color: backgroundColor,
    //     borderRadius:
    //         widget.showProgressBar
    //             ? BorderRadius.vertical(top: Radius.circular(12))
    //             : borderRadius,
    //   ),
    //   child: Material(
    //     color: Colors.transparent,
    //     child: ,
    //   ),
    // );

    if (widget.showProgressBar) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: WithProgressBar(
          progress: _progress,
          progressColor: color,
          containerDecoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.op(0.05),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: playerContent,
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.op(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: playerContent,
      );
    }
  }

  Widget _buildAnimatedBars(Color color) {
    return SizedBox(
      width: widget.iconSize,
      height: widget.iconSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < _barAnimations.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1),
              child: AnimatedBuilder(
                animation: _barAnimations[i],
                builder: (context, child) {
                  return Container(
                    width: 3,
                    height: widget.iconSize * 0.7 * _barAnimations[i].value,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
