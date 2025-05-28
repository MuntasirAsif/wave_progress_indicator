import 'dart:math';
import 'package:flutter/widgets.dart';

/// A custom painter that draws a dynamic wave based on progress and animation.
///
/// This painter renders a sine wave animation inside a container,
/// useful for visual progress indicators with a water or liquid fill effect.
///
/// ### Parameters:
/// - [progress]: A value between 0.0 and 1.0 representing the fill level.
/// - [waveHeight]: The height/amplitude of the wave.
/// - [animationValue]: A looping animation value between 0.0 and 1.0 to animate the wave movement.
/// - [gradientColors]: Used if [gradient] is not provided to create a linear gradient fill.
/// - [gradient]: Optional. If provided, overrides [gradientColors] and is used for the wave fill.
class WavePainter extends CustomPainter {
  final double progress;
  final double waveHeight;
  final double animationValue;
  final List<Color> gradientColors;
  final LinearGradient? gradient;

  const WavePainter({
    required this.progress,
    required this.waveHeight,
    required this.animationValue,
    required this.gradientColors,
    this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = (gradient ??
                  LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ))
              .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..style = PaintingStyle.fill;

    final baseHeight = size.height * (1 - progress);
    final path = Path()..moveTo(0, baseHeight);

    for (double x = 0; x <= size.width; x++) {
      final y =
          baseHeight +
          sin((x / size.width * 2 * pi) + (animationValue * 2 * pi)) *
              waveHeight;
      path.lineTo(x, y);
    }

    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
