import 'dart:async';
import 'dart:math';

import 'package:assist_app/src/controllers/conversation.dart';
import 'package:assist_app/src/utils/auth.dart';
import 'package:assist_app/src/widgets/audio_player.dart';
import 'package:assist_app/widgets.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class ConversationBuilder extends StatefulWidget {
  const ConversationBuilder({
    super.key,
    required this.conversation,
    required this.material,
    required this.onSubmit,
  });

  final Fragment$DetailedMaterial material;
  final Fragment$ConversationDetails conversation;
  final Future<void> Function() onSubmit;

  @override
  State<ConversationBuilder> createState() => _ConversationBuilderState();
}

class _ConversationBuilderState extends State<ConversationBuilder> {
  @override
  void initState() {
    // controller.listen();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late final controller = ConversationController(widget.material);
  final scrollController = ScrollController();

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
                    ResponsiveConfig.of(context).containerPadding +
                    EdgeInsets.only(bottom: 16),
                child: Column(
                  spacing: 16,
                  children: [
                    // Wrap(
                    //   children: [
                    //     AppButton(
                    //       onPressed: () {
                    //         Api.mutations.removeConversationAssistant();
                    //       },
                    //       title: const Text("Remove assistant"),
                    //     ),
                    //     AppButton(
                    //       onPressed: () {
                    //         Api.mutations.clearConversation(widget.material.id);
                    //       },
                    //       title: const Text("Clear conversation"),
                    //     ),
                    //   ],
                    // ),
                    AppCard(
                      title: TermsText(
                        widget.conversation.instructions,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var character in widget.conversation.characters)
                            if (character.name == "\$user")
                              Row(
                                spacing: 16,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImggenUserAvatar(
                                          avatar: AuthController().user.avatar,
                                        ),
                                        Text(AuthController().user.name),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Text("You")),
                                ],
                              )
                            else
                              Row(
                                spacing: 16,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ImggenUserAvatar(
                                          avatar: character.avatar!,
                                        ),
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            maxWidth: 100,
                                          ),
                                          child: Text(
                                            character.name,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(character.description ?? ""),
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),

                    controller.turns.builder((turns) {
                      return Column(
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
  final Fragment$DetailedMaterial material;

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

  Gradient getGradient(double progress) {
    if (isUser) {
      return LinearGradient(
        colors: [
          AppColors.primary,
          AppColors.primary,
          AppColors.primary.op(0.6),
          AppColors.primary,
          AppColors.primary,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [
          0,
          (progress - 0.3).clamp(0, 1),
          progress,
          (progress + 0.3).clamp(0, 1),
          1,
        ],
      );
    } else {
      return LinearGradient(
        colors: [
          AppColors.secondary,
          AppColors.secondary,
          AppColors.secondary.op(0.6),
          AppColors.secondary,
          AppColors.secondary,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [
          0,
          (progress - 0.3).clamp(0, 1),
          progress,
          (progress + 0.3).clamp(0, 1),
          1,
        ],
      );
    }
  }

  ConversationController? _controller;
  ConversationController get controller => _controller!;

  @override
  void dispose() {
    _controller?.playingTurnId.removeSlot(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      _controller = ConversationPlayerProvider.of(context);
      lastPlaying = controller.isTurnPlaying(widget.turn.id);
      controller.playingTurnId.addSlot(this);
    }

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          if (isUser) SizedBox(width: 80),
          Expanded(
            child: Builder(
              builder: (context) {
                Widget child = DefaultTextStyle.merge(
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  child: Builder(
                    builder: (context) {
                      var children = [
                        ImggenUserAvatar(
                          avatar:
                              isUser
                                  ? AuthController().user.avatar
                                  : character(widget.turn.character).avatar!,
                        ),
                        controller.audioStates[widget.turn.id]!.builder((_) {
                          final state = controller.audioStates[widget.turn.id]!;
                          if (state.error != null) {
                            return const Icon(
                              Icons.error,
                              color: AppColors.error,
                            );
                          }
                          if (!state.value) {
                            return ConversationPlayer(turn: widget.turn);
                          }
                          return CircularProgressIndicator.adaptive();
                        }),
                        Expanded(child: TermsText(widget.turn.text!)),
                      ];

                      if (isUser) {
                        children = children.reversed.toList();
                      }

                      return Row(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children,
                      );
                    },
                  ),
                );

                return controller.playingTurnId.builder((_) {
                  final isPlaying = controller.isTurnPlaying(widget.turn.id);
                  if (isPlaying) {
                    return controller.progress.builder((pr) {
                      return Container(
                        padding: ResponsiveConfig.of(context).containerPadding,
                        decoration: BoxDecoration(
                          gradient: getGradient(pr),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: child,
                      );
                    });
                  } else {
                    return Container(
                      padding: ResponsiveConfig.of(context).containerPadding,
                      decoration: BoxDecoration(
                        color: isUser ? AppColors.primary : AppColors.secondary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: child,
                    );
                  }
                });
              },
            ),
          ),
          if (!isUser) SizedBox(width: 80),
        ],
      ),
    );
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

  AudioRecorder record = AudioRecorder();

  Future<Uint8List?> stopRecording() async {
    final path = await record.stop();

    recording.value = false;
    cancelling.value = false;

    _subscription?.cancel();
    _subscription = null;

    if (path == null) {
      return null;
    }

    Uint8List buffer;

    if (kIsWeb) {
      buffer = (await get(Uri.parse(path))).bodyBytes;
    } else {
      throw UnimplementedError();
    }

    widget.onSend(null, buffer);

    return buffer;

    // if (res == null) {
    //   throw Exception("Recording failed");
    // }

    // if (kIsWeb) {
    //   final blobRes = await get(Uri.parse(res));
    //   if (blobRes.statusCode != 200) {
    //     throw Exception("Recording failed: ${blobRes.statusCode}");
    //   }
    //   print("Recording blob: ${blobRes.bodyBytes.length}");
    //   return blobRes.bodyBytes;
    // } else {
    //   final path = (await getTemporaryDirectory()).path;
    //   final p = "$path/$res";
    //   throw Exception("Recording failed: $p");
    // }
  }

  Future<void> cancelRecording() async {
    setState(() {
      recording.value = false;
    });
    if (await record.isRecording()) {
      await record.stop();
    }

    amplitudes.clear();

    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> startRecording() async {
    cancelling.value = false;
    if (await record.isRecording()) {
      await cancelRecording();
    }

    amplitudes.clear();
    setState(() {
      recording.value = true;
    });

    _subscription = record
        .onAmplitudeChanged(Duration(milliseconds: 16))
        .listen((amplitude) {
          amplitudes.add(amplitude);
        });

    String path;

    if (kIsWeb) {
      path = "";
    } else {
      path =
          "${(await getTemporaryDirectory()).path}/${Random().nextInt(1000000)}.wav";
    }

    record.start(
      RecordConfig(
        encoder: AudioEncoder.wav,
        sampleRate: 16000,
        numChannels: 1,
      ),
      path: path,
    );

    setState(() {});
  }

  StreamSubscription<Amplitude>? _subscription;

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
        color: AppColors.background,
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
                return AppButton(
                  onPressed: () {},
                  variant: AppButtonVariant.text,
                  size: AppSizeVariant.large,
                  onTapUp: (details) async {
                    cancelRecording();
                  },

                  onTapDown: (details) async {
                    startRecording();
                  },
                  onTapCancel: () {
                    print("tap cancel");
                    if (cancelling.value) {
                      cancelRecording();
                    } else {
                      stopRecording();
                    }
                  },
                  onCancelling: (cancelling) {
                    print("cancelling: $cancelling");
                    this.cancelling.value = cancelling;
                  },
                  title:
                      recording.value
                          ? cancelling.value
                              ? Icon(Icons.cabin, color: AppColors.primary)
                              : Icon(Icons.stop, color: AppColors.primary)
                          : Icon(Icons.mic, color: AppColors.primary),
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
