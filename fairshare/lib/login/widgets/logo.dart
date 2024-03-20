import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      flex: 2,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 200.toMobileHeight,
            width: 200.toMobileWidth,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: theme.primaryColorDark),
          ),
          Container(
            height: 140.toMobileHeight,
            width: 140.toMobileWidth,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: theme.primaryColorLight),
          )
        ],
      ),
    );
  }
}
