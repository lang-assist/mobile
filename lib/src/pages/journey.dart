import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class JourneyPage extends StatefulWidget {
  const JourneyPage({super.key});

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  Fragment$DetailedJourney get journey => journeyController.journey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: _JoruneyPath(
              path: journeyController.pathController,
              key: ValueKey(journeyController.pathController.path.id),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: PopupIconButton(
              icon: Icon(Icons.add),
              items: [
                AppButton(
                  onPressed: () async {
                    // await Api.mutations.genMaterial(
                    //   Input$GenMaterialInput(
                    //     journeyId: journey.id,

                    //     pathId: journey.paths.first.id,
                    //     type: Enum$MaterialType.STORY,
                    //   ),
                    // );
                  },
                  title: Text("Gen Story"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _JoruneyPath extends StatefulWidget {
  const _JoruneyPath({super.key, required this.path});

  final PathController path;

  @override
  State<_JoruneyPath> createState() => __JoruneyPathState();
}

class __JoruneyPathState extends State<_JoruneyPath> with Slot {
  final scrollController = ScrollController();
  int itemCount = 0;

  int? jumped;

  PathController get pathController => widget.path;

  @override
  void onValue(value) {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    pathController.addSlot(this);
    pathController.fetchMaterials();
    super.initState();
  }

  @override
  void dispose() {
    pathController.removeSlot(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);

    final mainAxisExtent =
        (responsive.breakpoint == Breakpoint.mobile ? 170.0 : 150.0) + 35;
    final crossAxisSpace = responsive.gridGutter;
    final mainAxisSpacing = 35.0;

    return scrollController.asSignal().builder((value) {
      return CustomPaint(
        painter: _PathBackgroundPainter(
          scrollOffset:
              scrollController.hasClients ? scrollController.offset : 0,
          padding: responsive.pagePadding,
          size: MediaQuery.sizeOf(context),
          crossAxisSpace: crossAxisSpace,
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          itemCount: itemCount,
        ),
        child: SmootScroll(
          scrollController: scrollController,
          builder: (controller) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: mainAxisExtent,
                crossAxisSpacing: crossAxisSpace,
                mainAxisSpacing: 0,
              ),
              itemCount:
                  pathController.materials.length +
                  3 +
                  (pathController.pageInfo.hasNextPage ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < 3) {
                  return Container(
                    height: mainAxisSpacing,
                    width: 100,
                    color: Colors.transparent,
                  );
                }

                if (index == pathController.materials.length + 3) {
                  return Builder(
                    builder: (_) {
                      return Center(child: AIIndicator(size: 30));
                    },
                  );
                }

                final material = pathController.materials[index - 3];

                return _MaterialCard(
                  material: material,
                  hasArrow: false,
                  height: mainAxisSpacing,
                );
              },
            );

            // return PaginationGrid(
            //   reversed: true,
            //   scrollController: controller,
            //   padding: responsive.pagePadding,
            //   options: PathMaterialsPaginationOptions(
            //     widget.path.id,
            //     Input$PaginationInput(sort: "createdAt:asc", limit: 18),
            //   ),
            //   additionalWidgets: [
            //     ...List.generate(
            //       3,
            //       (index) => Container(
            //         height: mainAxisSpacing,
            //         width: 100,
            //         color: Colors.transparent,
            //       ),
            //     ),
            //   ],
            //   onItemCount: (count) {
            //     SchedulerBinding.instance.addPostFrameCallback((_) {
            //       setState(() {
            //         itemCount = count - 3;
            //       });
            //     });
            //     if (itemCount != jumped) {
            //       if (scrollController.hasClients) {
            //         SchedulerBinding.instance.addPostFrameCallback((_) {
            //           scrollController.animateTo(
            //             scrollController.position.maxScrollExtent,
            //             duration: const Duration(milliseconds: 500),
            //             curve: Curves.easeInOut,
            //           );
            //           jumped = count - 3;
            //         });
            //       }
            //     }
            //   },
            //   itemBuilder: (material) {
            //     if (material is Fragment$CreatingMaterial) {
            //       return Container(
            //         height: mainAxisSpacing,
            //         width: 100,
            //         color: Colors.red,
            //       );
            //     }

            //     final mat = material as Fragment$Material;

            //     return _MaterialCard(
            //       material: material,
            //       hasArrow: false,
            //       height: mainAxisSpacing,
            //     );
            //   },
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     mainAxisExtent: mainAxisExtent,
            //     crossAxisSpacing: crossAxisSpace,
            //     mainAxisSpacing: 0,
            //   ),
            // );
          },
        ),
      );
    });
  }
}

class _MaterialCard extends StatefulWidget {
  const _MaterialCard({
    required this.material,
    this.hasArrow = true,
    this.height = 150,
  });

  final MaterialController material;
  final bool hasArrow;
  final double height;

  @override
  State<_MaterialCard> createState() => __MaterialCardState();
}

class __MaterialCardState extends State<_MaterialCard> with Slot {
  bool get isCreating => widget.material.isCreating;

  @override
  void initState() {
    super.initState();
    if (isCreating) {
      widget.material.fetchDetailed();
    }
    widget.material.addSlot(this);
  }

  @override
  void dispose() {
    widget.material.removeSlot(this);
    super.dispose();
  }

  @override
  void onValue(value) {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isCreating) {
      return Center(
        child: Column(children: [AIIndicator(size: 16), Text("Generating...")]),
      );
    }

    final meta = widget.material.metadata;

    final child = AppCard(
      onTap: () => context.material(widget.material.id),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.sm,
        children: [
          Tooltip(
            message: meta.description,
            child: Text(
              meta.description,

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      title: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(meta.title, maxLines: 2),
          Text(
            widget.material.type.name,
            style: TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    if (widget.hasArrow) {
      return WithArrow(height: widget.height, child: child);
    }

    return child;
  }
}

class _PathBackgroundPainter extends CustomPainter {
  final EdgeInsets padding;
  final Size size;
  final double crossAxisSpace;
  final double mainAxisExtent;
  final double mainAxisSpacing;
  final double scrollOffset;
  final int itemCount;

  _PathBackgroundPainter({
    required this.padding,
    required this.size,
    required this.crossAxisSpace,
    required this.mainAxisExtent,
    required this.mainAxisSpacing,
    required this.scrollOffset,
    required this.itemCount,
  });

  Size get drawingSize => Size(
    size.width - padding.left - padding.right,
    size.height - padding.top - padding.bottom,
  );

  Offset get drawingOffset => padding.topLeft;

  double get drawingWidth => (drawingSize.width - (crossAxisSpace * 2)) / 3;

  double getX(int index) {
    final x = drawingWidth * index + (crossAxisSpace * index);
    return x + drawingOffset.dx + (drawingWidth / 2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.primary.op(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20;

    final x1 = getX(0);
    final x2 = getX(1);
    final x3 = getX(2);

    final yStart = -50.0;
    final yEnd = size.height + 50.0;

    final path1 =
        Path()
          ..moveTo(x1, yStart)
          ..lineTo(x1, yEnd);

    canvas.drawPath(path1, paint);

    final path2 =
        Path()
          ..moveTo(x2, yStart)
          ..lineTo(x2, yEnd);

    canvas.drawPath(path2, paint);

    final path3 =
        Path()
          ..moveTo(x3, yStart)
          ..lineTo(x3, yEnd);

    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant _PathBackgroundPainter oldDelegate) =>
      oldDelegate.size != size ||
      oldDelegate.padding != padding ||
      oldDelegate.crossAxisSpace != crossAxisSpace ||
      oldDelegate.scrollOffset != scrollOffset ||
      oldDelegate.itemCount != itemCount;
}

class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offset = Offset(size.width / 2, size.height / 2);

    final paint =
        Paint()
          ..color = AppColors.primary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;

    final path =
        Path()
          ..moveTo(offset.dx - 10, offset.dy + 4)
          ..lineTo(offset.dx, offset.dy - 6)
          ..lineTo(offset.dx + 10, offset.dy + 4);

    canvas.drawPath(path, paint);

    final secondPath = path.shift(Offset(0, 6));
    canvas.drawPath(secondPath, paint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WithArrow extends StatelessWidget {
  const WithArrow({super.key, required this.child, required this.height});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          painter: _ArrowPainter(),
          child: SizedBox(height: height, width: double.infinity),
        ),
        Expanded(child: SizedBox(width: double.infinity, child: child)),
      ],
    );
  }
}
