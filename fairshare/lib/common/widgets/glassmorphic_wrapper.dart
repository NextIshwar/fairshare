import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphicWrapper extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blurSigmaX;
  final double blurSigmaY;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Color backgroundColor;
  final double backgroundOpacity;

  const GlassmorphicWrapper({
    Key? key,
    required this.child,
    this.borderRadius = 24,
    this.blurSigmaX = 10,
    this.blurSigmaY = 10,
    this.shadowColor = Colors.black,
    this.shadowBlurRadius = 16,
    this.shadowSpreadRadius = 8,
    this.backgroundColor = Colors.black,
    this.backgroundOpacity = 0.1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor.withOpacity(backgroundOpacity),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.2),
                blurRadius: shadowBlurRadius,
                spreadRadius: shadowSpreadRadius,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
