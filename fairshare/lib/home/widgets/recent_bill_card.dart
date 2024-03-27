import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class RecentBillCard extends StatelessWidget {
  final double? height, width;
  final double borderRadius;
  const RecentBillCard(
      {super.key, this.borderRadius = 4, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.toMobileWidth),
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: Theme.of(context).dividerColor.withOpacity(0.6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.toMobileHeight,
                  ),
                  Text(
                    'Pizza treat',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    height: 12.toMobileHeight,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '\u{20B9}200/ ',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(letterSpacing: 1.25)),
                      TextSpan(
                        text: '\u{20B9}600',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              fontWeight: FontWeight.w300,
                              color: const Color.fromARGB(255, 148, 147, 147),
                              letterSpacing: 1.25,
                            ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 4.toMobileHeight,
                  ),
                  Text(
                    'Your Split',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(255, 148, 147, 147),
                        ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/create-bill');
              },
              child: Container(
                height: 36.toMobileHeight,
                width: 108.toMobileWidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      size: 14,
                    ),
                    SizedBox(
                      width: 8.toMobileWidth,
                    ),
                    Text(
                      'Edit the Bill',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    )
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
