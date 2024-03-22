import 'package:fairshare/common/widgets/custom_icon_button.dart';
import 'package:fairshare/home/widgets/recent_bill_card.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class Bills extends StatelessWidget {
  final bool startAnimation;
  const Bills({super.key, this.startAnimation = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Bills',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            CustomIconButton(
              height: 36.toMobileHeight,
              width: 100.toMobileWidth,
              buttonColor: Theme.of(context).primaryColorLight,
              icon: Icons.add,
            ),
          ],
        ),
        SizedBox(
          height: 16.toMobileHeight,
        ),
        SizedBox(
          height: 120.toMobileHeight,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => AnimatedContainer(
              duration: Duration(milliseconds: 200 + (index * 200)),
              transform: Matrix4.translationValues(
                  startAnimation ? 0 : SizeConfig.screenWidth - 48, 0, 0),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RecentBillCard(
                  height: 100.toMobileHeight,
                  width: 148.toMobileWidth,
                  borderRadius: 12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
