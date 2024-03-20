import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? height, width;
  final String buttonName;
  const CustomButton(
      {super.key,
      this.onPressed,
      this.height,
      this.width,
      required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).highlightColor),
        child: Text(
          buttonName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
