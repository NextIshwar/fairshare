import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final double? height, width;
  final void Function() onTap;
  final Widget? iconWidget;
  const CustomIcon(
      {super.key,
      this.icon,
      this.height,
      this.width,
      required this.onTap,
      this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 32,
        width: width ?? 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(4)),
        child: iconWidget ?? Icon(icon),
      ),
    );
  }
}
