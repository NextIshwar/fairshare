import 'package:fairshare/home/widgets/all_transactions.dart';
import 'package:fairshare/home/widgets/bills.dart';
import 'package:fairshare/home/widgets/profile_and_notifications.dart';
import 'package:fairshare/home/widgets/recent_splinters.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool startAnimation;
  const HomePage({super.key, this.startAnimation = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 12.toMobileWidth,
          right: 12.toMobileWidth,
          top: 32.toMobileHeight),
      child: Column(
        children: [
          AnimatedOpacity(
              curve: Curves.easeIn,
              opacity: startAnimation ? 1 : 0,
              duration: const Duration(milliseconds: 500 + (1 * 200)),
              child: const ProfileAndNotification()),
          Divider(
            color: Theme.of(context).dividerColor,
            thickness: 1,
          ),
          AnimatedOpacity(
              curve: Curves.easeInOut,
              opacity: startAnimation ? 1 : 0,
              duration: const Duration(milliseconds: 500 + (2 * 200)),
              child: Bills(
                startAnimation: startAnimation,
              )),
          SizedBox(
            height: 28.toMobileHeight,
          ),
          AnimatedOpacity(
              curve: Curves.easeInOut,
              opacity: startAnimation ? 1 : 0,
              duration: const Duration(milliseconds: 500 + (3 * 200)),
              child: RecentSplinters(
                startAnimation: startAnimation,
              )),
          SizedBox(
            height: 28.toMobileHeight,
          ),
          AnimatedOpacity(
              opacity: startAnimation ? 1 : 0,
              duration: const Duration(milliseconds: 500 + (4 * 200)),
              child: AllTransactions(
                startAnimation: startAnimation,
              ))
        ],
      ),
    );
  }
}
