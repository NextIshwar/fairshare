import 'package:fairshare/home/widgets/bills.dart';
import 'package:fairshare/home/widgets/profile_and_notifications.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: 12.toMobileWidth,
            right: 12.toMobileWidth,
            top: 32.toMobileHeight),
        child: Column(
          children: [
            const ProfileAndNotification(),
            Divider(
              color: Theme.of(context).dividerColor,
              thickness: 1,
            ),
            const Bills(),
          ],
        ),
      ),
    );
  }
}
