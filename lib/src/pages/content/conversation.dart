import 'dart:async';
import 'dart:math';

import 'package:api/api.dart';
import 'package:assist_app/src/controllers/conversation.dart';
import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/utils/auth.dart';
import 'package:assist_app/src/widgets/audio_player.dart';
import 'package:assist_app/src/widgets/components/record.dart';
import 'package:assist_app/widgets.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:record/record.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class ConversationBuilder extends StatefulWidget {
  const ConversationBuilder({
    super.key,
    required this.material,
    required this.onSubmit,
  });

  final MaterialController material;
  final Future<void> Function() onSubmit;

  @override
  State<ConversationBuilder> createState() => _ConversationBuilderState();
}

class _ConversationBuilderState extends State<ConversationBuilder> {
  @override
  void initState() {
    controller.refetchIfNeeded().then((value) {
      controller.listen();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late final controller = ConversationController(widget.material);
  final scrollController = ScrollController();

  Fragment$ConversationDetails get conversation =>
      widget.material.details as Fragment$ConversationDetails;

  @override
  Widget build(BuildContext context) {
    return ConversationPlayerProvider(
      controller: controller,
      child: controller.state.builder((_) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding:
                    EdgeInsets.symmetric(
                      vertical:
                          ResponsiveConfig.of(context).pagePadding.vertical,
                    ) +
                    EdgeInsets.only(bottom: 16),
                child: Column(
                  spacing: 16,
                  children: [
                    Wrap(
                      children: [
                        AppButton(
                          onPressed: () {
                            // Api.mutations.removeConversationAssistant();
                          },
                          title: const Text("Remove assistant"),
                        ),
                        AppButton(
                          onPressed: () {
                            // Api.mutations.clearConversation(widget.material.id);
                          },
                          title: const Text("Clear conversation"),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveConfig.of(context).pagePadding.horizontal,
                      ),
                      child: CharactersArea3(
                        characters: conversation.characters,
                        instructions: conversation.instructions,
                      ),
                    ),

                    Divider(color: AppColors.onSurface.op(0.1)),

                    controller.turns.builder((turns) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              ResponsiveConfig.of(
                                context,
                              ).pagePadding.horizontal,
                        ),
                        child: Column(
                          spacing: 16,
                          children: [
                            if (controller.isStarted) ...[
                              controller.sending.builder((_) {
                                return Column(
                                  spacing: 16,
                                  children: [
                                    for (var turn in turns)
                                      ConversationTurnWidget(
                                        turn: turn,
                                        material: widget.material,
                                      ),

                                    if (controller.sending.value)
                                      ConversationTurnSkeleton(
                                        isUser: true,
                                        avatar: ImggenUserAvatar(
                                          avatar: AuthController().user.avatar,
                                        ),
                                      ),

                                    if (controller.waitingAI)
                                      ConversationTurnSkeleton(
                                        isUser: false,
                                        avatar:
                                            controller.nextTurn == null
                                                ? null
                                                : ImggenUserAvatar(
                                                  avatar:
                                                      (widget.material.details
                                                              as Fragment$MaterialDetails$$ConversationDetails)
                                                          .characters
                                                          .firstWhere(
                                                            (element) =>
                                                                element.name ==
                                                                controller
                                                                    .nextTurn,
                                                          )
                                                          .avatar!,
                                                ),
                                      ),
                                  ],
                                );
                              }),
                            ] else ...[
                              AppButton(
                                onPressed: controller.listen,
                                title: const Text("Start conversation"),
                              ),
                            ],
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            <Signal>[controller.turns, controller.sending].multiSignal.builder((
              _,
            ) {
              return Column(
                children: [
                  if (controller.isUserTurn && !controller.sending.value)
                    ConversationUserInput(
                      onSend: (text, audio) {
                        controller.send(text, audio);
                      },
                    ),
                  if (controller.isCompleted)
                    Container(
                      width: double.infinity,
                      padding: ResponsiveConfig.of(context).containerPadding,
                      child: AppButton(
                        onPressed: widget.onSubmit,
                        title: const Text("Submit"),
                      ),
                    ),
                ],
              );
            }),
          ],
        );
      }),
    );
  }
}

class ConversationTurnSkeleton extends StatefulWidget {
  const ConversationTurnSkeleton({
    super.key,
    required this.isUser,
    this.avatar,
  });

  final bool isUser;
  final Widget? avatar;

  @override
  State<ConversationTurnSkeleton> createState() =>
      _ConversationTurnSkeletonState();
}

class _ConversationTurnSkeletonState extends State<ConversationTurnSkeleton>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    super.initState();
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Color get shimmerColor => AppColors.onSurface.op(0.1);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.isUser) SizedBox(width: 80),
        Expanded(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: shimmerColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: ResponsiveConfig.of(context).containerPadding,
                  child: Row(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!widget.isUser) ...[
                        widget.avatar ??
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: shimmerColor.op(animation.value),
                                shape: BoxShape.circle,
                              ),
                            ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: shimmerColor.op(animation.value),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 16,
                              decoration: BoxDecoration(
                                color: shimmerColor.op(animation.value),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 16,
                              decoration: BoxDecoration(
                                color: shimmerColor.op(animation.value),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (widget.isUser) ...[
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: shimmerColor.op(animation.value),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        widget.avatar ??
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: shimmerColor.op(animation.value),
                                shape: BoxShape.circle,
                              ),
                            ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        if (!widget.isUser) SizedBox(width: 80),
      ],
    );
  }
}

class ConversationTurnWidget extends StatefulWidget {
  const ConversationTurnWidget({
    super.key,
    required this.turn,
    required this.material,
  });

  final Fragment$ConversationTurn turn;
  final MaterialController material;

  @override
  State<ConversationTurnWidget> createState() => _ConversationTurnWidgetState();
}

class _ConversationTurnWidgetState extends State<ConversationTurnWidget>
    with Slot {
  bool get isUser => widget.turn.character == "\$user";

  Fragment$ConversationCharacter character(String name) {
    final details =
        widget.material.details
            as Fragment$MaterialDetails$$ConversationDetails;
    return details.characters.firstWhere((element) => element.name == name);
  }

  ConversationController? _controller;
  ConversationController get controller => _controller!;

  @override
  void dispose() {
    _controller?.playingTurnId.removeSlot(this);
    super.dispose();
  }

  bool? lastPlaying;

  @override
  void onValue(value) {
    final isPlaying = controller.isTurnPlaying(widget.turn.id);
    if (lastPlaying == false && isPlaying) {
      Scrollable.ensureVisible(context);
    }
    lastPlaying = isPlaying;
  }

  Widget _buildCharacterArea() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        controller.audioStates[widget.turn.id]!.builder((_) {
          final state = controller.audioStates[widget.turn.id]!;
          if (state.error != null) {
            return Icon(Icons.error, color: AppColors.error, size: 16);
          }
          if (!state.value) {
            return ConversationPlayer(turn: widget.turn);
          }
          return SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(AppColors.primary),
            ),
          );
        }),
        SizedBox(height: 4),
        ImggenUserAvatar(
          avatar:
              widget.turn.character == "\$user"
                  ? AuthController().user.avatar
                  : character(widget.turn.character).avatar!,
          size: 48,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      _controller = ConversationPlayerProvider.of(context);
      lastPlaying = controller.isTurnPlaying(widget.turn.id);
      controller.playingTurnId.addSlot(this);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isUser) SizedBox(width: 80),
          if (!isUser) _buildCharacterArea(),
          Expanded(
            child: controller.playingTurnId.builder((_) {
              final isPlaying = controller.isTurnPlaying(widget.turn.id);

              return LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment:
                        isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 0.7,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            right: isUser ? AppSpacing.md : 0,
                            left: isUser ? 0 : AppSpacing.md,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isUser ? AppColors.primary : AppColors.surface,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(isUser ? 20 : 5),
                              bottomRight: Radius.circular(isUser ? 5 : 20),
                            ),
                            boxShadow: [
                              if (!isUser)
                                BoxShadow(
                                  color: AppColors.onSurface.op(0.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(isUser ? 20 : 5),
                              bottomRight: Radius.circular(isUser ? 5 : 20),
                            ),
                            child: Stack(
                              children: [
                                if (isPlaying)
                                  controller.progress.builder((pr) {
                                    return Positioned.fill(
                                      child: LinearProgressIndicator(
                                        value: pr,
                                        backgroundColor: Colors.transparent,
                                        valueColor: AlwaysStoppedAnimation(
                                          isUser
                                              ? Colors.white.op(0.2)
                                              : AppColors.primary.op(0.2),
                                        ),
                                      ),
                                    );
                                  }),
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        isUser
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                    children: [
                                      if (!isUser)
                                        Text(
                                          widget.turn.character,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                      TermsText(
                                        widget.turn.text!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                          color:
                                              isUser
                                                  ? Colors.white
                                                  : AppColors.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
          if (isUser) _buildCharacterArea(),
          if (!isUser) SizedBox(width: 80),
        ],
      ),
    );
  }
}

class ConversationUserInput extends StatefulWidget {
  const ConversationUserInput({super.key, required this.onSend});

  final void Function(String?, Uint8List?) onSend;

  @override
  State<ConversationUserInput> createState() => _ConversationUserInputState();
}

class _ConversationUserInputState extends State<ConversationUserInput> {
  Signal<String> text = Signal<String>("");

  double height = 60;

  Signal<bool> cancelling = Signal<bool>(false);
  Signal<bool> recording = Signal<bool>(false);

  SignalList<Amplitude> amplitudes = SignalList<Amplitude>([]);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerPadding = ResponsiveConfig.of(context).containerPadding;
    return AnimatedContainer(
      width: double.infinity,
      height: height + containerPadding.horizontal,
      duration: animationDuration,
      alignment: Alignment.bottomCenter,
      padding: containerPadding,
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.op(0.1),
            blurRadius: 10,
            offset: Offset(0, -10),
          ),
        ],
        border: Border(
          top: BorderSide(color: AppColors.onSurface.op(0.3), width: 1),
        ),
      ),
      child: text.builder((_) {
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 55,
              bottom: 0,
              top: 0,
              left: 0,
              child: recording.builder((recording) {
                return AnimatedOpacity(
                  opacity: recording ? 1 : 0,
                  duration: animationDuration,
                  child: AmplitudeWidget(
                    amplitudes: amplitudes,
                    cancelling: cancelling,
                  ),
                );
              }),
            ),

            recording.builder((recording) {
              return AnimatedPositioned(
                left: !recording ? 0 : -screenWidth - 200,
                right: !recording ? 55 : screenWidth + 55,
                bottom: 0,
                duration: animationDuration,
                child: MeasureSize(
                  onChange: (size) {
                    height = size.height;
                    setState(() {});
                  },
                  child: AppTextFormField(
                    hint: "Type your message",
                    minLines: 1,
                    maxLines: 3,
                    signal: text,
                    suffix:
                        text.value.isEmpty
                            ? null
                            : AppButton(
                              variant: AppButtonVariant.text,
                              onPressed: () {
                                text.value = "";
                              },
                              title: Icon(
                                Icons.close,
                                color: AppColors.primary,
                              ),
                            ),
                  ),
                ),
              );
            }),

            AnimatedPositioned(
              right: text.value.isEmpty ? -100 : 0,
              bottom: 0,
              duration: animationDuration,
              child: AppButton(
                variant: AppButtonVariant.text,
                size: AppSizeVariant.large,
                onPressed: () {
                  if (text.value.isEmpty) {
                    return;
                  }
                  widget.onSend(text.value, null);
                },
                title: Icon(Icons.send, color: AppColors.primary),
              ),
            ),
            AnimatedPositioned(
              right: text.value.isEmpty ? 0 : -500,
              bottom: 0,
              duration: animationDuration,
              child: [recording, cancelling].multiSignal.builder((_) {
                return RecordWidget(
                  onRecordComplete: (data) {
                    widget.onSend(null, data);
                  },
                  onRecordStart: () {
                    recording.value = true;
                  },
                  onRecordCancel: () {
                    recording.value = false;
                  },
                  onAmplitudeChanged: (amplitude) {
                    amplitudes.add(amplitude);
                  },
                  onCancellingStateChanged: (cancelling) {
                    this.cancelling.value = cancelling;
                  },
                  size: 25,
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}

class AmplitudeWidget extends StatefulWidget {
  const AmplitudeWidget({
    super.key,
    required this.amplitudes,
    required this.cancelling,
  });

  final SignalList<Amplitude> amplitudes;
  final Signal<bool> cancelling;

  @override
  State<AmplitudeWidget> createState() => _AmplitudeWidgetState();
}

class _AmplitudeWidgetState extends State<AmplitudeWidget> {
  double get maxAmplitude => widget.amplitudes.lastOrNull?.max ?? 0;

  double rate(int index) {
    if (index >= widget.amplitudes.length) {
      return 0.01;
    }

    if (index < 0) {
      return 0.01;
    }

    final current = (40 - (widget.amplitudes[index].current).abs()).abs();

    // Normalize current value between 0 and 1 where:
    // current = 40 -> 0.2
    // current = 0 or 160 -> 1.0
    final x = (current - 10) / 30; // normalize to -0.33 to 1
    return 0.01 +
        0.99 * (4 * x * x); // quadratic curve that peaks at x=0 and x=1
  }

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return widget.amplitudes.builder((_) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final boxCount = (constraints.maxWidth / 6).ceil();

          final maxHeight = constraints.maxHeight;

          if (scrollController.hasClients) {
            scrollController.position.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
            );
          }

          return widget.cancelling.builder((c) {
            return SizedBox(
              height: maxHeight,
              width: double.infinity,
              child: ListView.builder(
                controller: scrollController,
                itemExtent: 6,
                itemCount: max(widget.amplitudes.length, boxCount),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  if (i >= widget.amplitudes.length) {
                    return Container(
                      alignment: Alignment.center,
                      height: maxHeight,
                      width: 4,

                      child: _AmpItem(
                        key: Key("amp-$i"),
                        height: maxHeight * 0.1,
                        width: 4,
                        color: c ? Colors.red : AppColors.textPrimary.op(0.3),
                      ),
                    );
                  }

                  final index = i;

                  return Container(
                    alignment: Alignment.center,
                    height: maxHeight,
                    width: 4,

                    child: _AmpItem(
                      key: Key("amp-$i"),
                      height: maxHeight * rate(index),
                      width: 4,
                      color: c ? Colors.red : AppColors.primary,
                    ),
                  );
                },
              ),
            );
          });
        },
      );
    });
  }
}

class _AmpItem extends StatefulWidget {
  const _AmpItem({
    super.key,
    required this.height,
    required this.width,
    required this.color,
  });

  final double height, width;
  final Color color;

  @override
  State<_AmpItem> createState() => __AmpItemState();
}

class __AmpItemState extends State<_AmpItem> {
  bool _animated = false;

  @override
  Widget build(BuildContext context) {
    if (!_animated) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _animated = true;
        });
      });
    }
    return AnimatedContainer(
      duration: animationDuration,
      width: widget.width,
      height: _animated ? widget.height : 0,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class CharactersArea1 extends StatelessWidget {
  const CharactersArea1({
    super.key,
    required this.characters,
    required this.instructions,
  });

  final List<Fragment$ConversationCharacter> characters;
  final LinguisticUnitSet instructions;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: TermsText(
        instructions,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var character in characters)
            Row(
              spacing: 16,
              children: [
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImggenUserAvatar(
                        avatar:
                            character.name == "\$user"
                                ? AuthController().user.avatar
                                : character.avatar!,
                      ),
                      Text(
                        character.name == "\$user"
                            ? AuthController().user.name
                            : character.name,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    character.name == "\$user"
                        ? "You"
                        : character.description ?? "",
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class CharactersArea2 extends StatelessWidget {
  const CharactersArea2({
    super.key,
    required this.characters,
    required this.instructions,
  });

  final List<Fragment$ConversationCharacter> characters;
  final LinguisticUnitSet instructions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.onSurface.op(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conversation Partners",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var character in characters)
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            ImggenUserAvatar(
                              size: 64,
                              avatar:
                                  character.name == "\$user"
                                      ? AuthController().user.avatar
                                      : character.avatar!,
                            ),
                            SizedBox(height: 8),
                            Text(
                              character.name == "\$user"
                                  ? AuthController().user.name
                                  : character.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            if (character.description != null)
                              Container(
                                constraints: BoxConstraints(maxWidth: 150),
                                child: Text(
                                  character.description!,
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.onSurface.op(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Instructions",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              TermsText(
                instructions,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CharactersArea3 extends StatelessWidget {
  const CharactersArea3({
    super.key,
    required this.characters,
    required this.instructions,
  });

  final List<Fragment$ConversationCharacter> characters;
  final LinguisticUnitSet instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary.op(0.1), AppColors.surface],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 16,
        children: [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TermsText(
              instructions,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ...characters.map((character) {
            final isUser = character.name == "\$user";
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary.op(0.2)),
              ),
              child: Row(
                children: [
                  ImggenUserAvatar(
                    size: 60,
                    avatar:
                        isUser
                            ? AuthController().user.avatar
                            : character.avatar!,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isUser ? AuthController().user.name : character.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (!isUser && character.description != null)
                          Text(
                            character.description!,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
