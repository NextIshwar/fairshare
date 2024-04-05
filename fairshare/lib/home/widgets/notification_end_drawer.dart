import 'package:fairshare/common/constants.dart';
import 'package:fairshare/common/widgets/custom_icon.dart';
import 'package:fairshare/common/widgets/glassmorphic_wrapper.dart';
import 'package:fairshare/home/model/notification_model.dart';
import 'package:fairshare/home/widgets/all_transactions.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class NotificationEndDrawer extends StatelessWidget {
  final void Function()? closeDrawer;
  const NotificationEndDrawer({super.key, required this.closeDrawer});

  @override
  Widget build(BuildContext context) {
    final notificationData =
        AllNotification.fromJson(dummyNotificationList).notification;
    return GlassmorphicWrapper(
      borderRadius: 16,
      blurSigmaX: 10,
      blurSigmaY: 10,
      shadowColor: Colors.black,
      shadowBlurRadius: 16,
      shadowSpreadRadius: 8,
      backgroundColor: Colors.white,
      backgroundOpacity: 0.1,
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth * 0.7,
        margin: EdgeInsets.symmetric(horizontal: 16.toMobileWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 48.toMobileHeight,
                bottom: 24.toMobileHeight,
              ),
              child: InkWell(
                onTap: closeDrawer,
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                    ),
                    SizedBox(
                      width: 12.toMobileWidth,
                    ),
                    Text(
                      'Notification',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: notificationData!.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatDateToMonthYear(
                            notificationData[index].dateTime!),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 16),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 28.toMobileHeight),
                        height: (60 *
                                notificationData[index].allTransactions!.length)
                            .toMobileHeight,
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(
                              parent: NeverScrollableScrollPhysics(),
                            ),
                            itemCount:
                                notificationData[index].allTransactions!.length,
                            itemBuilder: (context, ind) {
                              final transactionData =
                                  notificationData[index].allTransactions![ind];
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: 16.toMobileHeight),
                                child: Row(
                                  children: [
                                    CustomIcon(
                                      height: 44.toMobileHeight,
                                      width: 44.toMobileHeight,
                                      iconWidget: Image.asset(
                                        transactionData.picture!,
                                        height: 25.toMobileHeight,
                                        width: 25.toMobileHeight,
                                      ),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      width: 16.toMobileHeight,
                                    ),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          text:
                                              '${transactionData.whoPaid} paid ${Constants.rs}600/- for ${transactionData.transactionMessage} and ${transactionData.whoOwe} ${transactionData.whoPaid == 'You' ? 'owes you' : 'owe him'} ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${Constants.rs}${transactionData.dueAmount}/-',
                                              style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
