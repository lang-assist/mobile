import 'dart:math';
import 'package:flutter/material.dart';

import '../../utils.dart';

enum IndicatorOn { surface, primary }

class AIIndicator extends StatefulWidget {
  const AIIndicator({super.key, this.size, this.color, this.strokeWidth});

  final double? size;
  final Color? color;
  final double? strokeWidth;

  @override
  State<AIIndicator> createState() => _AIIndicatorState();
}

class _AIIndicatorState extends State<AIIndicator> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double size;

        if (widget.size != null) {
          size = widget.size!;
        } else if (constraints.hasBoundedWidth &&
            constraints.hasBoundedHeight) {
          size = min(constraints.maxWidth, constraints.maxHeight);
        } else if (constraints.hasBoundedHeight) {
          size = constraints.maxHeight;
        } else if (constraints.hasBoundedWidth) {
          size = constraints.maxWidth;
        } else {
          size = 20;
        }

        return SizedBox.square(
          dimension: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.square(
                dimension: size,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.color ?? AppColors.primary,
                  ),
                  trackGap: 1,
                  strokeWidth: widget.strokeWidth ?? 3.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:assist_utils/assist_utils.dart';

// class AIIndicator extends StatefulWidget {
//   const AIIndicator({
//     super.key,
//     this.size = 40.0,
//     this.color,
//     this.stepDelay = const Duration(
//       milliseconds: 300,
//     ), // Adımlar arası bekleme süresi
//   });

//   final double size;
//   final Color? color;
//   final Duration stepDelay;

//   @override
//   State<AIIndicator> createState() => _AIIndicatorState();
// }

// class _AIIndicatorState extends State<AIIndicator>
//     with TickerProviderStateMixin {
//   late final AnimationController _progressController;
//   late final Animation<double> _progressAnimation;
//   final List<List<_NetworkNode>> layers = [];
//   final List<_NetworkSignal> signals = [];
//   final _random = Random();
//   int _step = 0;

//   // Her katmandaki düğüm sayısı
//   static const List<int> _nodesPerLayer = [1, 3, 2];
//   static const Duration _stepDuration = Duration(milliseconds: 400);

//   @override
//   void initState() {
//     super.initState();

//     _progressController = AnimationController(
//       vsync: this,
//       duration: _stepDuration,
//     )..addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _progressController.stop();
//         Future.delayed(widget.stepDelay, () {
//           if (mounted) {
//             _step++;
//             _progressController.forward(from: 0);
//           }
//         });
//       }
//     });

//     _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
//     );

//     _progressController.addListener(_updateNetwork);
//     _initializeNetwork();
//     _progressController.forward();
//   }

//   void _initializeNetwork() {
//     layers.clear();

//     // Her katman için düğümleri oluştur
//     for (var i = 0; i < _nodesPerLayer.length; i++) {
//       final layer = <_NetworkNode>[];
//       final nodeCount = _nodesPerLayer[i];

//       // x pozisyonu: -0.4'ten 0.4'e kadar
//       final xPos = (i / (_nodesPerLayer.length - 1) * 0.8 - 0.4) * widget.size;

//       for (var j = 0; j < nodeCount; j++) {
//         // Düğümleri dikey olarak dağıt
//         final yOffset = (j - (nodeCount - 1) / 2) * (widget.size * 0.2);

//         layer.add(
//           _NetworkNode(
//             position: Offset(xPos, yOffset),
//             size: 2,
//             layer: i,
//             index: j,
//           ),
//         );
//       }
//       layers.add(layer);
//     }
//   }

//   void _updateNetwork() {
//     final progress = _progressAnimation.value;

//     if (_step % 2 == 0) {
//       // İlk adım: Birinci katmandan ikinci katmana 2 sinyal
//       if (signals.isEmpty) {
//         final startNode = layers.first.first;
//         final targetNodes = List<_NetworkNode>.from(layers[1])..shuffle();

//         for (var i = 0; i < 2; i++) {
//           signals.add(
//             _NetworkSignal(
//               currentNode: startNode,
//               progress: 0,
//               path: [startNode, targetNodes[i]],
//             ),
//           );
//         }
//       }

//       // Sinyalleri güncelle
//       for (var signal in signals) {
//         if (signal.pathIndex < signal.path.length - 1) {
//           signal.progress = progress;
//           if (progress >= 1.0) {
//             signal.pathIndex++;
//             signal.currentNode = signal.path[signal.pathIndex];
//           }
//         }
//       }
//     } else {
//       // İkinci adım: İkinci katmandan üçüncü katmana sinyaller
//       if (signals.isEmpty) {
//         final sourceNodes = layers[1];
//         final targetNodes = layers[2];

//         for (var sourceNode in sourceNodes) {
//           signals.add(
//             _NetworkSignal(
//               currentNode: sourceNode,
//               progress: 0,
//               path: [
//                 sourceNode,
//                 targetNodes[_random.nextInt(targetNodes.length)],
//               ],
//             ),
//           );
//         }
//       }

//       // Sinyalleri güncelle
//       for (var signal in signals) {
//         if (signal.pathIndex < signal.path.length - 1) {
//           signal.progress = progress;
//           if (progress >= 1.0) {
//             signal.pathIndex++;
//             signal.currentNode = signal.path[signal.pathIndex];
//           }
//         }
//       }
//     }

//     // Adım tamamlandığında sinyalleri temizle
//     if (progress >= 1.0) {
//       signals.clear();
//     }
//   }

//   @override
//   void dispose() {
//     _progressController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final color = widget.color ?? AppColors.primary;

//     return Container(
//       width: widget.size,
//       height: widget.size,
//       alignment: Alignment.center,
//       child: AnimatedBuilder(
//         animation: _progressController,
//         builder: (context, _) {
//           return CustomPaint(
//             size: Size(widget.size, widget.size),
//             painter: _NetworkPainter(
//               layers: layers,
//               signals: signals,
//               color: color,
//               progress: _progressController.value,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class _NetworkNode {
//   final Offset position;
//   final double size;
//   final int layer;
//   final int index;

//   _NetworkNode({
//     required this.position,
//     required this.size,
//     required this.layer,
//     required this.index,
//   });
// }

// class _NetworkSignal {
//   _NetworkNode currentNode;
//   final List<_NetworkNode> path;
//   double progress;
//   int pathIndex = 0;

//   _NetworkSignal({
//     required this.currentNode,
//     required this.progress,
//     required this.path,
//   });
// }

// class _NetworkPainter extends CustomPainter {
//   final List<List<_NetworkNode>> layers;
//   final List<_NetworkSignal> signals;
//   final Color color;
//   final double progress;

//   _NetworkPainter({
//     required this.layers,
//     required this.signals,
//     required this.color,
//     required this.progress,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);

//     // Bağlantıları çiz
//     for (var i = 0; i < layers.length - 1; i++) {
//       final currentLayer = layers[i];
//       final nextLayer = layers[i + 1];

//       for (final node in currentLayer) {
//         for (final nextNode in nextLayer) {
//           final start = node.position + center;
//           final end = nextNode.position + center;

//           canvas.drawLine(
//             start,
//             end,
//             Paint()
//               ..color = color.op(0.2)
//               ..strokeWidth = 0.8,
//           );
//         }
//       }
//     }

//     // Sinyalleri çiz
//     for (final signal in signals) {
//       if (signal.pathIndex < signal.path.length - 1) {
//         final start = signal.currentNode.position + center;
//         final end = signal.path[signal.pathIndex + 1].position + center;
//         final current = Offset.lerp(start, end, signal.progress)!;

//         // Sinyal izi
//         final path =
//             Path()
//               ..moveTo(start.dx, start.dy)
//               ..lineTo(current.dx, current.dy);

//         // Pulse efekti için opaklık
//         final pulseOpacity = (1 - (signal.progress - 0.5).abs() * 2).clamp(
//           0.0,
//           1.0,
//         );

//         canvas.drawPath(
//           path,
//           Paint()
//             ..color = color.op(0.6 * pulseOpacity)
//             ..strokeWidth = 1.5
//             ..style = PaintingStyle.stroke,
//         );

//         // Sinyal parçacığı
//         canvas.drawCircle(
//           current,
//           2 + pulseOpacity * 1, // Boyut pulse ile değişiyor
//           Paint()..color = AppColors.secondary.op(0.8 + pulseOpacity * 0.2),
//         );
//       }
//     }

//     // Düğümleri çiz
//     for (final layer in layers) {
//       for (final node in layer) {
//         final position = node.position + center;

//         // Düğüm gölgesi
//         // canvas.drawCircle(
//         //   position,
//         //   node.size + 1,
//         //   Paint()..color = color.op(0.3),
//         // );

//         // Düğüm
//         canvas.drawCircle(position, node.size, Paint()..color = color);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _NetworkPainter oldDelegate) => true;
// }
