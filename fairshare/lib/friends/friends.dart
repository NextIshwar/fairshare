import 'package:fairshare/common/constants.dart';
import 'package:fairshare/common/widgets/custom_icon.dart';
import 'package:fairshare/common/widgets/toggle_switch.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class FriendsAndGroups extends StatefulWidget {
  const FriendsAndGroups({super.key});

  @override
  State<FriendsAndGroups> createState() => _FriendsAndGroupsState();
}

class _FriendsAndGroupsState extends State<FriendsAndGroups>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 64.toMobileHeight,
          left: 12.toMobileWidth,
          right: 12.toMobileWidth),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Friends List',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Row(
                children: [
                  CustomIcon(icon: Icons.search_outlined, onTap: () {}),
                  SizedBox(width: 8.toMobileWidth),
                  CustomIcon(icon: Icons.person_add_outlined, onTap: () {})
                ],
              )
            ],
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          ToggleSwitch(
            borderColor: [Theme.of(context).highlightColor],
            borderWidth: 1,
            minHeight: 40.toMobileHeight,
            minWidth: SizeConfig.screenWidth,
            cornerRadius: 30.0,
            activeBgColors: [
              [Theme.of(context).highlightColor],
              [Theme.of(context).highlightColor]
            ],
            activeFgColor: Colors.black,
            inactiveBgColor: Colors.transparent,
            inactiveFgColor: Theme.of(context).highlightColor,
            initialLabelIndex: 1,
            totalSwitches: 2,
            labels: const ['Groups', 'Friends'],
            radiusStyle: true,
            onToggle: (index) {},
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Groups',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Text(
                '+Add New',
                style: TextStyle(color: Colors.greenAccent),
              )
            ],
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.6,
            width: 400,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 40,
              itemBuilder: (context, index) => InkWell(
                highlightColor: Theme.of(context).dividerColor.withOpacity(0.8),
                onTap: () {
                  if (_animationController.isDismissed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 52.toMobileHeight,
                          width: 52.toMobileHeight,
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
                          width: 8.toMobileWidth,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Isle of Wight Trip',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(
                              height: 6.toMobileHeight,
                            ),
                            if (isExpanded) ...[
                              RichText(
                                text: TextSpan(
                                    text: 'Chris Owes you ',
                                    style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 12,
                                        letterSpacing: 1.1,
                                        fontWeight: FontWeight.w100),
                                    children: const [
                                      TextSpan(
                                          text: '${Constants.rs}500',
                                          style: TextStyle(
                                              color: Colors.greenAccent,
                                              letterSpacing: 1.1))
                                    ]),
                              ),
                              SizedBox(
                                height: 2.toMobileHeight,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'Harry Owes you ',
                                    style: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 12,
                                        letterSpacing: 1.1,
                                        fontWeight: FontWeight.w100),
                                    children: const [
                                      TextSpan(
                                          text: '${Constants.rs}1500',
                                          style: TextStyle(
                                              color: Colors.greenAccent,
                                              letterSpacing: 1.1))
                                    ]),
                              ),
                            ]
                          ],
                        ),
                      ],
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == const ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 0).animate(anim)
                            : Tween<double>(begin: 0, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                      child: isExpanded
                          ? const RotatedBox(
                              quarterTurns: 90,
                              child: Icon(Icons.arrow_drop_down,
                                  key: ValueKey('icon1')),
                            )
                          : const Icon(
                              Icons.arrow_drop_down,
                              key: ValueKey('icon2'),
                            ),
                    ),
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
