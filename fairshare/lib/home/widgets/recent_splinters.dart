import 'package:fairshare/common/widgets/spliter_list.dart';
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
        SpliterList(
          startAnimation: startAnimation,
        )
      ],
    );
  }
}
