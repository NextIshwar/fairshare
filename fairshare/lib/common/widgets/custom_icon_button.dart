import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double? height, width;
  final double borderRadius;
  final IconData? icon;
  final Color? buttonColor;
  const CustomIconButton({
    super.key,
    this.borderRadius = 4,
    this.height,
    this.icon,
    this.width,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/create-bill',
            arguments: {'pageTitle': 'Add a new bill'});
      },
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 8.toMobileWidth),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Icon(
                icon,
                color: Theme.of(context).highlightColor,
                size: 24,
              ),
            ),
            SizedBox(
              width: 2.toMobileWidth,
            ),
            Text(
              'Add Bills',
              style: TextStyle(color: Theme.of(context).highlightColor),
            ),
          ],
        ),
      ),
    );
  }
}
