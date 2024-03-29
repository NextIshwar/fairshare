library glowy_borderspertino.dart;

import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// This Widget creates a glowing, animated gradient border around your widgets.
///
/// [gradientColors] specify which colors to use for the gradient
/// [borderSize] specifies how big the hard border is around your widget
/// [glowSize] specifies how far and intense the glow should be
/// [animationProgress] if != null, the gradient will rotate towards its destination. Value between 0..1
/// [child] content does not get blurred, is surrounded by the glowing border
/// [stretchAlongAxis] use if you place this widget inside column or row with stretch alignment
/// [stretchAxis] choose depending on row or column
class AnimatedGradientBorder extends StatefulWidget {
  const AnimatedGradientBorder(
      {super.key,
      required this.child,
      required this.gradientColors,
      this.animationTime,
      this.borderSize,
      this.glowSize,
      this.animationProgress,
      this.stretchAlongAxis = false,
      this.stretchAxis = Axis.horizontal});

  final Widget child;
  final double? borderSize;
  final double? glowSize;
  final List<Color> gradientColors;
  final int? animationTime;
  final double? animationProgress;
  final bool stretchAlongAxis;
  final Axis stretchAxis;

  @override
  State<StatefulWidget> createState() => AnimatedGradientState();
}

class AnimatedGradientState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _angleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: widget.animationTime ?? 2));
    _controller.addListener(() => setState(() {}));
    _angleAnimation =
        Tween<double>(begin: 0.1, end: 2 * math.pi).animate(_controller);
    if (widget.animationProgress != null) {
      _controller.forward();
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedGradientBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    final animateTo = widget.animationProgress;
    if (animateTo != null) {
      _controller.animateTo(animateTo);
    } else {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final negativeMargin = -1.0 * (widget.borderSize ?? 0);
    return Container(
      padding: EdgeInsets.all(
          (widget.glowSize ?? 5) * 3 + (widget.borderSize ?? 0) * 3),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: negativeMargin,
                left: negativeMargin,
                right: negativeMargin,
                bottom: negativeMargin,
                child: AnimatedGradientContainer(
                  gradientColors: widget.gradientColors,
                  gradientAngle: _angleAnimation.value,
                )),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: widget.glowSize ?? 0, sigmaY: widget.glowSize ?? 0),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      top: negativeMargin,
                      right: negativeMargin,
                      left: negativeMargin,
                      bottom: negativeMargin,
                      child: AnimatedGradientContainer(
                        gradientColors: widget.gradientColors,
                        gradientAngle: _angleAnimation.value,
                      )),
                  if (widget.stretchAlongAxis)
                    SizedBox(
                      width: widget.stretchAxis == Axis.horizontal
                          ? double.infinity
                          : null,
                      height: widget.stretchAxis == Axis.vertical
                          ? double.infinity
                          : null,
                      child: widget.child,
                    )
                  else
                    widget.child,
                ],
              ),
            ),
          ]),
    );
  }
}

class AnimatedGradientContainer extends StatelessWidget {
  const AnimatedGradientContainer(
      {super.key, required this.gradientColors, required this.gradientAngle});

  final List<Color> gradientColors;
  final double gradientAngle;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
                colors: [...gradientColors, ...gradientColors.reversed],
                stops: _generateColorStops(
                    [...gradientColors, ...gradientColors.reversed]),
                transform: GradientRotation(gradientAngle))));
  }

  List<double> _generateColorStops(List<dynamic> colors) {
    return colors.asMap().entries.map((entry) {
      double percentageStop = entry.key / colors.length;
      return percentageStop;
    }).toList();
  }
}
