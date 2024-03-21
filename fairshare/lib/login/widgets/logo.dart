import 'package:fairshare/login/widgets/glowy_border.dart';
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
          AnimatedGradientBorder(
            borderSize: 1,
            glowSize: 5,
            gradientColors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Theme.of(context).dividerColor,
            ],
            child: Container(
              height: 200.toMobileHeight,
              width: 200.toMobileWidth,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: theme.primaryColorDark),
            ),
          ),
          AnimatedGradientBorder(
            borderSize: 1,
            glowSize: 5,
            gradientColors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Theme.of(context).highlightColor,
            ],
            child: Container(
              height: 140.toMobileHeight,
              width: 140.toMobileWidth,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: theme.primaryColorLight),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "FS",
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w900,
                  fontSize: 44,
                ),
              ),
              SizedBox(
                height: 4.toMobileHeight,
              ),
              Text(
                "Fair Share",
                style: TextStyle(
                  color: Theme.of(context).textTheme.displayMedium!.color,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 8.toMobileHeight,
              ),
              Text(
                'Equal Shares, Equal Cares',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 4),
              )
            ],
          )
        ],
      ),
    );
  }
}
