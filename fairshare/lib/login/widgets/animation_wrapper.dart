import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class AnimationWrapper extends StatelessWidget {
  final bool startAnimation;
  final int index;
  final Widget child;
  final Decoration? decoration;
  final double? height;
  const AnimationWrapper({
    super.key,
    required this.index,
    this.startAnimation = false,
    required this.child,
    this.decoration,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: decoration,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200 + (index * 200)),
      height: height ?? 48.toMobileHeight,
      transform: Matrix4.translationValues(
          startAnimation ? 0 : SizeConfig.screenWidth - 48, 0, 0),
      width: SizeConfig.screenWidth - 48,
      child: child,
    );
  }
}
