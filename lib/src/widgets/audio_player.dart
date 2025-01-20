import 'package:assist_app/src/controllers/conversation.dart';
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

class _ConversationPlayerState extends State<ConversationPlayer> {
  @override
  Widget build(BuildContext context) {
    final controller = ConversationPlayerProvider.of(context);

    return controller.playingTurnId.builder((_) {
      return IconButton(
        onPressed: () {
          if (controller.isTurnPlaying(widget.turn.id)) {
            controller.pauseTurn();
          } else {
            controller.playTurn(widget.turn.id);
          }
        },
        icon: Icon(
          controller.isTurnPlaying(widget.turn.id)
              ? Icons.pause
              : Icons.play_arrow,
          color:
              controller.isTurnPlaying(widget.turn.id)
                  ? Colors.white
                  : Colors.white,
        ),
      );
    });
  }
}
