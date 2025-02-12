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

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key, required this.audioId});

  final String audioId;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () async {
        final audioId = widget.audioId;
        final url = audioIdToUrl(audioId);
        final player = AudioPlayer();
        await player.play(UrlSource(url));
      },
      title: Text("Play"),
    );
  }
}
