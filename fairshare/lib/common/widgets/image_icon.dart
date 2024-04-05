import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class CutomImageIcon extends StatelessWidget {
  final double? height, width, imageHeight, imageWidth;
  final String imagePath;

  const CutomImageIcon(
      {super.key,
      this.height,
      this.width,
      required this.imagePath,
      this.imageHeight,
      this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.toMobileHeight,
      width: width ?? 40.toMobileHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).dividerColor,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        imagePath,
        height: imageHeight ?? 24.toMobileWidth,
        width: imageWidth ?? 24.toMobileWidth,
      ),
    );
  }
}
