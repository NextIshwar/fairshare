import 'package:fairshare/common/constants.dart';
import 'package:fairshare/login/widgets/animation_wrapper.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class FriendsCard extends StatelessWidget {
  final bool startAnimation;
  const FriendsCard({super.key, this.startAnimation = false});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.7,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: 40,
          itemBuilder: (context, index) => Column(
            children: [
              AnimationWrapper(
                startAnimation: startAnimation,
                height: 64.toMobileHeight,
                index: index,
                child: SizedBox(
                  width: SizeConfig.screenWidth,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.toMobileHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 52.toMobileHeight,
                          width: 52.toMobileHeight,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('lib/assets/images/img.jpg')),
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).dividerColor,
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          width: 8.toMobileWidth,
                        ),
                        FittedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Aman Pratap $index',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 6.toMobileHeight,
                              ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
