import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class AllTransactions extends StatelessWidget {
  final bool startAnimation;
  const AllTransactions({super.key, this.startAnimation = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Transactions',
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
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 40,
              itemBuilder: (context, index) => AnimatedContainer(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 200 + (index * 200)),
                transform: Matrix4.translationValues(
                    startAnimation ? 0 : SizeConfig.screenWidth - 48, 0, 0),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TransactionCard(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40.toMobileHeight,
              width: 40.toMobileHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).dividerColor,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.h_mobiledata,
                color: Color.fromARGB(255, 96, 150, 177),
              ),
            ),
            SizedBox(
              width: 12.toMobileWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Something transaction',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w300, letterSpacing: 1.1),
                ),
                SizedBox(
                  height: 4.toMobileHeight,
                ),
                Text(
                  'Jun 07 | 01:30 PM',
                  style: TextStyle(
                      color: Theme.of(context).dividerColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ],
        ),
        Text(
          'Rs600/-',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(letterSpacing: 1.1, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
