import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class RecentSplinters extends StatelessWidget {
  final bool startAnimation;
  const RecentSplinters({super.key, this.startAnimation = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Splinters',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            Text(
              'View All',
              style: TextStyle(
                color: Theme.of(context).highlightColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        SizedBox(
          height: 12.toMobileHeight,
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: 68.toMobileHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => index != 4
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 200 + (index * 200)),
                    transform: Matrix4.translationValues(
                        startAnimation ? 0 : SizeConfig.screenWidth - 48, 0, 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.toMobileWidth,
                          vertical: 4.toMobileWidth),
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
        ),
      ],
    );
  }
}
