import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class SpliterList extends StatelessWidget {
  final bool startAnimation;
  const SpliterList({super.key, this.startAnimation = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 68.toMobileHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).textTheme.labelSmall!.color!,
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => index != 4
            ? AnimatedContainer(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 200 + (index * 200)),
                transform: Matrix4.translationValues(
                    startAnimation ? 0 : SizeConfig.screenWidth - 48, 0, 0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4.toMobileWidth, vertical: 4.toMobileWidth),
                  child: Container(
                    height: 50.toMobileHeight,
                    width: 50.toMobileHeight,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('lib/assets/images/img.jpg')),
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).highlightColor),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 4.toMobileWidth, vertical: 4.toMobileWidth),
                child: Container(
                  height: 50.toMobileHeight,
                  width: 50.toMobileHeight,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.add_outlined,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
      ),
    );
  }
}
