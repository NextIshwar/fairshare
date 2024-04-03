import 'dart:ui';
import 'package:fairshare/friends/friends.dart';
import 'package:fairshare/home/widgets/all_transactions.dart';
import 'package:fairshare/home/widgets/bills.dart';
import 'package:fairshare/home/widgets/navigation_card.dart';
import 'package:fairshare/home/widgets/notification_end_drawer.dart';
import 'package:fairshare/home/widgets/profile_and_notifications.dart';
import 'package:fairshare/home/widgets/recent_splinters.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? selectedTab;
  bool startAnimation = false;
  Map<String, bool> navigationTab = {
    'Home': true,
    'Friends': false,
    'Graph': false,
    'Profile': false,
  };

  @override
  void initState() {
    super.initState();
    selectedTab = 'Home';
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        selectedTab == 'Friends'
            ? const FriendsAndGroups()
            : Padding(
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
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: 80.toMobileHeight,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.grey[800]!.withOpacity(0.5),
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _navigationTab
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: NavigationCard(
                                onTap: () {
                                  setState(() {
                                    navigationTab[selectedTab!] = false;
                                    selectedTab = e.title;
                                    navigationTab[e.title] = true;
                                  });
                                },
                                icon: e.icon,
                                title: e.title,
                                isSelected: navigationTab[e.title]!,
                              ),
                            ))
                        .toList()),
              ),
            ),
          ),
        )
      ]),
      endDrawer: NotificationEndDrawer(
        closeDrawer: () {
          scaffoldKey.currentState?.closeEndDrawer();
        },
      ),
    );
  }
}

List<NavigationModel> _navigationTab = [
  NavigationModel(Icons.home_outlined, 'Home', isSelected: true),
  NavigationModel(Icons.group_outlined, 'Friends'),
  NavigationModel(Icons.bar_chart_outlined, 'Graph'),
  NavigationModel(Icons.person_outline, 'Profile')
];

class NavigationModel {
  final String title;
  final IconData icon;
  bool isSelected;
  NavigationModel(this.icon, this.title, {this.isSelected = false});
}
