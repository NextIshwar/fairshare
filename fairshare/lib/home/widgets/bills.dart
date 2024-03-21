import 'package:fairshare/common/widgets/custom_icon_button.dart';
import 'package:fairshare/home/widgets/recent_bill_card.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class Bills extends StatelessWidget {
  const Bills({super.key});

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
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: RecentBillCard(
                height: 100.toMobileHeight,
                width: 148.toMobileWidth,
                borderRadius: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
