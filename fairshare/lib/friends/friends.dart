import 'dart:math';

import 'package:fairshare/common/constants.dart';
import 'package:fairshare/common/icon_images.dart';
import 'package:fairshare/common/widgets/custom_icon.dart';
import 'package:fairshare/common/widgets/toggle_switch.dart';
import 'package:fairshare/friends/friends_card.dart';
import 'package:fairshare/login/widgets/animation_wrapper.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class FriendsAndGroups extends StatefulWidget {
  const FriendsAndGroups({super.key});

  @override
  State<FriendsAndGroups> createState() => _FriendsAndGroupsState();
}

class _FriendsAndGroupsState extends State<FriendsAndGroups>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  bool startAnimation = false;
  int isGroup = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
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
            initialLabelIndex: isGroup,
            totalSwitches: 2,
            labels: const ['Groups', 'Friends'],
            radiusStyle: true,
            onToggle: (index) {
              setState(() {
                if (isGroup == 0) {
                  isGroup = 1;
                } else {
                  isGroup = 0;
                }
              });
            },
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          isGroup == 0
              ? GroupList(
                  startAnimation: startAnimation,
                  animationController: _animationController,
                )
              : FriendsCard(
                  startAnimation: startAnimation,
                )
        ],
      ),
    );
  }
}

class GroupList extends StatefulWidget {
  final bool startAnimation;
  final AnimationController? animationController;
  const GroupList(
      {super.key, required this.startAnimation, this.animationController});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  List<bool> isExpanded = [];

  @override
  void initState() {
    super.initState();
    isExpanded = List.filled(30, false);
  }

  @override
  Widget build(BuildContext context) {
    final rng = Random();
    return Column(
      children: [
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
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.7,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 30,
              itemBuilder: (context, index) => Column(
                children: [
                  AnimatedOpacity(
                    curve: Curves.easeIn,
                    opacity: widget.startAnimation ? 1 : 0,
                    duration: const Duration(milliseconds: 500 + (1 * 200)),
                    child: AnimationWrapper(
                      startAnimation: widget.startAnimation,
                      index: index,
                      height: 64.toMobileHeight,
                      child: InkWell(
                        highlightColor:
                            Theme.of(context).dividerColor.withOpacity(0.8),
                        onTap: () {
                          if (widget.animationController?.isDismissed ?? true) {
                            widget.animationController?.forward();
                          } else {
                            widget.animationController?.reverse();
                          }
                          setState(() {
                            isExpanded[index] = !isExpanded[index];
                          });
                        },
                        child: SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.toMobileHeight),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        height: 48.toMobileHeight,
                                        width: 48.toMobileHeight,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Theme.of(context).dividerColor,
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          IconImages.images[rng.nextInt(
                                              IconImages.images.length)],
                                          height: 30.toMobileWidth,
                                          width: 30.toMobileWidth,
                                        )),
                                    SizedBox(
                                      width: 8.toMobileWidth,
                                    ),
                                    FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Isle of Wight Trip',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                          SizedBox(
                                            height: 6.toMobileHeight,
                                          ),
                                          if (isExpanded[index]) ...[
                                            RichText(
                                              text: TextSpan(
                                                  text: 'Chris Owes you ',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .disabledColor,
                                                      fontSize: 12,
                                                      letterSpacing: 1.1,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                  children: const [
                                                    TextSpan(
                                                        text:
                                                            '${Constants.rs}500',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .greenAccent,
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
                                                      color: Theme.of(context)
                                                          .disabledColor,
                                                      fontSize: 12,
                                                      letterSpacing: 1.1,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                  children: const [
                                                    TextSpan(
                                                        text:
                                                            '${Constants.rs}1500',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .greenAccent,
                                                            letterSpacing: 1.1))
                                                  ]),
                                            ),
                                          ]
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 150),
                                  transitionBuilder: (child, anim) =>
                                      RotationTransition(
                                    turns: child.key == const ValueKey('icon1')
                                        ? Tween<double>(begin: 1, end: 0)
                                            .animate(anim)
                                        : Tween<double>(begin: 0, end: 1)
                                            .animate(anim),
                                    child: FadeTransition(
                                        opacity: anim, child: child),
                                  ),
                                  child: isExpanded[index]
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
                      ),
                    ),
                  ),
                  const Divider()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
