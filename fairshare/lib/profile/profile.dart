import 'package:fairshare/common/icon_images.dart';
import 'package:fairshare/login/widgets/animation_wrapper.dart';
import 'package:fairshare/profile/widgets/settings_item.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  bool startAnimation = false;
  bool isDarkMode = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 64.toMobileHeight,
          left: 12.toMobileWidth,
          right: 12.toMobileWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Profile',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 24.toMobileWidth,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('lib/assets/images/img.jpg')),
                  ),
                ),
              ),
              SizedBox(
                width: 12.toMobileWidth,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi Ishwar!',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 8.toMobileHeight),
                  Text('Premium User',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 12, fontWeight: FontWeight.normal))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          Text(
            'Settings',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.75,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: settingsTab.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    AnimatedOpacity(
                      curve: Curves.easeIn,
                      opacity: startAnimation ? 1 : 0,
                      duration: const Duration(milliseconds: 500 + (1 * 200)),
                      child: AnimationWrapper(
                        height: 56.toMobileHeight,
                        startAnimation: startAnimation,
                        index: index,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.toMobileHeight),
                          child: SettingsItem(
                            imagePath: settingsTab[index]!.iconPath,
                            settingName: settingsTab[index]!.name,
                            onPressed: () {},
                            actionWidget: index == 4
                                ? Switch.adaptive(
                                    value: isDarkMode,
                                    onChanged: (val) {
                                      setState(() {
                                        isDarkMode = !isDarkMode;
                                      });
                                    })
                                : null,
                          ),
                        ),
                      ),
                    ),
                    if (index != (settingsTab.length - 1)) ...[
                      const Divider(),
                      SizedBox(
                        height: 6.toMobileHeight,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum SettingsEnum {
  editProfile,
  transactionHistory,
  currency,
  premiumMembership,
  darkMode,
  helpAndSupport
}

Map<int, SettingsModel> settingsTab = {
  0: SettingsModel('Edit Profile', IconImages.person),
  1: SettingsModel('Transaction History', IconImages.transactionHistory),
  2: SettingsModel('Currency', IconImages.currency),
  3: SettingsModel('Premium Membership', IconImages.crown),
  4: SettingsModel('Dark Mode', IconImages.darkMode),
  5: SettingsModel('Help And Support', IconImages.help),
};

class SettingsModel {
  String iconPath;
  String name;
  SettingsModel(this.name, this.iconPath);
}
