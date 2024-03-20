import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class AnimationWrapper extends StatelessWidget {
  final bool startAnimation;
  final int index;
  final Widget child;
  final Decoration? decoration;
  const AnimationWrapper({
    super.key,
    required this.index,
    this.startAnimation = false,
    required this.child,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: decoration,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      height: 48.toMobileHeight,
      transform: Matrix4.translationValues(
          startAnimation ? 0 : SizeConfig.screenWidth - 48, 0, 0),
      width: SizeConfig.screenWidth - 48,
      child: child,
    );
  }
}
