import 'package:fairshare/common/widgets/custom_icon.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class ProfileAndNotification extends StatelessWidget {
  const ProfileAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: theme.highlightColor,
                radius: 18.toMobileWidth,
                child: const Text('IK'),
              ),
              SizedBox(
                width: 8.toMobileWidth,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Ishwar! 😊👋',
                    style: theme.textTheme.displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.toMobileHeight,
                  ),
                  Text(
                    'Easily split bills & track expenses',
                    style: theme.textTheme.labelSmall,
                  ),
                ],
              )
            ],
          ),
          CustomIcon(
              icon: Icons.notifications_outlined,
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              })
        ],
      ),
    );
  }
}
