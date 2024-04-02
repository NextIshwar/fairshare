import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double? height, width;
  final void Function() onTap;
  const CustomIcon({
    super.key,
    required this.icon,
    this.height,
    this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: height ?? 32,
        width: width ?? 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).dividerColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(4)),
        child: Icon(icon),
      ),
    );
  }
}
