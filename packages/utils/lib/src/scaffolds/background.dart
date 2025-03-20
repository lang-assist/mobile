import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../utils.dart';

class BrocaBackground extends StatelessWidget {
  const BrocaBackground({super.key, required this.child, required this.seed});

  final Widget child;
  final int seed;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BrocaBackgroundPainter(seed: seed),
      child: child,
    );
  }
}

class _BrocaBackgroundPainter extends CustomPainter {
  static const maxConnections = 5;
  final int seed;

  _BrocaBackgroundPainter({required this.seed});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);
    final points = <Offset>[];
    final connections = <List<int>>[];

    // Yoğunluk faktörünü hesapla (üstten alta azalan)
    double getDensityFactor(double y) {
      final normalizedY = y / size.height;
      // Üstte daha yoğun, aşağı doğru azalan bir eğri
      return math.pow(1 - normalizedY, 1.2) * 0.9; // Daha yumuşak azalma
    }

    // Rastgele nokta oluştur
    void createRandomPoint(
      double minX,
      double maxX,
      double minY,
      double maxY, {
      bool forceAdd = false,
    }) {
      final x = minX + random.nextDouble() * (maxX - minX);
      final y = minY + random.nextDouble() * (maxY - minY);

      if (forceAdd || random.nextDouble() < getDensityFactor(y) * 1.2) {
        // Daha fazla nokta
        // Yakındaki noktalarla minimum mesafe kontrolü
        final density = getDensityFactor(y);
        final minDistance = 15.0 + (1 - density) * 25.0; // Daha yakın noktalar
        var canAdd = true;

        for (final point in points) {
          if ((Offset(x, y) - point).distance < minDistance) {
            canAdd = false;
            break;
          }
        }

        if (canAdd) {
          points.add(Offset(x, y));
        }
      }
    }

    // Ana sinaps merkezleri oluştur (organik dağılım için)
    void createSynapseCluster(
      double centerX,
      double centerY,
      double radius,
      int count,
    ) {
      for (var i = 0; i < count; i++) {
        final angle = random.nextDouble() * 2 * math.pi;
        final distance = random.nextDouble() * radius;
        final x = centerX + math.cos(angle) * distance;
        final y = centerY + math.sin(angle) * distance;
        createRandomPoint(x - 15, x + 15, y - 15, y + 15, forceAdd: true);
      }
    }

    // Rastgele noktalar oluştur
    final baseCount =
        (size.width * size.height) / 12000; // Daha fazla baz nokta
    for (var i = 0; i < baseCount; i++) {
      createRandomPoint(
        -size.width * 0.2, // Daha geniş alan
        size.width * 1.2,
        -size.height * 0.2,
        size.height * 1.2,
      );
    }

    // Sinaps kümeleri oluştur (daha fazla ve dağınık)
    createSynapseCluster(size.width * 0.2, size.height * 0.15, 120, 10);
    createSynapseCluster(size.width * 0.8, size.height * 0.15, 120, 10);
    createSynapseCluster(size.width * 0.5, size.height * 0.3, 140, 12);
    createSynapseCluster(size.width * 0.3, size.height * 0.5, 100, 8);
    createSynapseCluster(size.width * 0.7, size.height * 0.5, 100, 8);
    createSynapseCluster(size.width * 0.15, size.height * 0.7, 90, 7);
    createSynapseCluster(size.width * 0.85, size.height * 0.7, 90, 7);

    // Bağlantıları oluştur
    for (var i = 0; i < points.length; i++) {
      final y = points[i].dy;
      final density = getDensityFactor(y);
      final maxDist =
          size.width * (0.15 + density * 0.25); // Daha uzun bağlantılar
      final minConnections = (2 * density).ceil();
      final maxConn = (maxConnections * density).ceil();
      final connectionCount =
          minConnections + random.nextInt(maxConn - minConnections + 1);

      final distances = <MapEntry<int, double>>[];

      for (var j = 0; j < points.length; j++) {
        if (i != j) {
          final dist = (points[i] - points[j]).distance;
          if (dist < maxDist) {
            distances.add(MapEntry(j, dist));
          }
        }
      }

      distances.sort((a, b) => a.value.compareTo(b.value));
      for (var j = 0; j < connectionCount && j < distances.length; j++) {
        connections.add([i, distances[j].key]);
      }
    }

    // Bağlantıları çiz
    final connectionPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5;

    for (final connection in connections) {
      final start = points[connection[0]];
      final end = points[connection[1]];
      final distance = (end - start).distance;
      final avgY = (start.dy + end.dy) / 2;
      final density = getDensityFactor(avgY);

      // Mesafeye ve yoğunluğa göre opaklık
      final distanceFactor =
          1 - (distance / (size.width * 0.35)).clamp(0.0, 1.0);
      final opacity = 0.05 * density * distanceFactor; // Daha yüksek opaklık
      connectionPaint.color = AppColors.primary.op(opacity);

      final path = Path();
      path.moveTo(start.dx, start.dy);

      final mid = Offset((start.dx + end.dx) / 2, (start.dy + end.dy) / 2);
      final normal = Offset(
        -(end.dy - start.dy) / distance,
        (end.dx - start.dx) / distance,
      );

      final controlOffset = distance * (0.2 + random.nextDouble() * 0.3);
      final control1 = Offset(
        mid.dx + normal.dx * controlOffset,
        mid.dy + normal.dy * controlOffset,
      );
      final control2 = Offset(
        mid.dx - normal.dx * controlOffset,
        mid.dy - normal.dy * controlOffset,
      );

      path.cubicTo(
        control1.dx,
        control1.dy,
        control2.dx,
        control2.dy,
        end.dx,
        end.dy,
      );

      canvas.drawPath(path, connectionPaint);
    }

    // Noktaları çiz
    for (final point in points) {
      final density = getDensityFactor(point.dy);

      // Parlama efekti
      final glowPaint =
          Paint()
            ..color = AppColors.primary.op(
              0.4 * density,
            ) // Daha belirgin parlama
            ..style = PaintingStyle.fill
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

      canvas.drawCircle(point, 15, glowPaint);

      // Ana nokta
      final nodePaint =
          Paint()
            ..color = AppColors.primary.op(
              0.05 * density,
            ) // Daha belirgin noktalar
            ..style = PaintingStyle.fill;

      canvas.drawCircle(point, 5, nodePaint);
    }
  }

  @override
  bool shouldRepaint(_BrocaBackgroundPainter oldDelegate) =>
      oldDelegate.seed != seed;
}
