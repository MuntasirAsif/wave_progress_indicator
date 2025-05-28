import 'package:flutter/material.dart';
import 'package:wave_progress_indicator/painter/wave_painter.dart';

/// A customizable, animated wave progress indicator widget.
///
/// The `WaveProgressIndicator` renders an animated water-wave effect to visualize progress,
/// similar to a filling liquid container. You can customize the wave's appearance,
/// animation speed, gradient, border radius, and optionally overlay a child widget on top.
///
/// ### Parameters:
/// - `value` (required): Progress value between 0.0 and 1.0.
/// - `gradientColors`: List of colors used to build a default gradient if `gradient` is not provided.
/// - `gradient`: A custom `LinearGradient` for the wave fill.
/// - `waveHeight`: The amplitude of the wave.
/// - `speed`: The speed of the wave animation.
/// - `borderRadius`: The radius to apply to the clipped container.
/// - `child`: An optional widget to display over the wave (e.g., text or icon).
///
/// ### Example Usage:
/// ```dart
/// WaveProgressIndicator(
///   value: 0.6,
///   gradientColors: [Colors.blue, Colors.cyan],
///   waveHeight: 15,
///   speed: 1.2,
///   borderRadius: BorderRadius.circular(12),
///   child: Center(child: Text("60%", style: TextStyle(color: Colors.white))),
/// );
/// ```
class WaveProgressIndicator extends StatefulWidget {
  final double value; // Pass progress value directly
  final List<Color> gradientColors;
  final LinearGradient? gradient;
  final double waveHeight;
  final double speed;
  final BorderRadius borderRadius;
  final Widget? child;

  const WaveProgressIndicator({
    super.key,
    required this.value,
    this.gradientColors = const [Colors.blue, Colors.blue, Colors.blueAccent],
    this.waveHeight = 10.0,
    this.speed = 1.0,
    this.gradient,
    this.borderRadius = BorderRadius.zero,
    this.child,
  });

  @override
  WaveProgressIndicatorState createState() => WaveProgressIndicatorState();
}

class WaveProgressIndicatorState extends State<WaveProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (2000 ~/ widget.speed)),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: widget.borderRadius,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: WavePainter(
                  progress: widget.value,
                  waveHeight: widget.waveHeight,
                  animationValue: _animationController.value,
                  gradientColors: widget.gradientColors,
                  gradient: widget.gradient,
                ),
                child: const SizedBox(),
              ),
              if (widget.child != null) widget.child!,
            ],
          ),
        );
      },
    );
  }
}
