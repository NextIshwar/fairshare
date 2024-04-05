import 'package:fairshare/common/constants.dart';
import 'package:fairshare/home/model/all_transaction_model.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class AllTransactions extends StatelessWidget {
  final bool startAnimation;
  const AllTransactions({super.key, this.startAnimation = false});

  @override
  Widget build(BuildContext context) {
    final allTransactions =
        AllTransactionModel.fromJson(dummyallTransactions).allTransactions;
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Transactions',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.toMobileHeight,
          ),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: allTransactions?.length ?? 0,
                itemBuilder: (context, index) => AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 200 + (index * 200)),
                  transform: Matrix4.translationValues(
                      startAnimation ? 0 : SizeConfig.screenWidth - 48, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TransactionCard(
                      transactions: allTransactions![index],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final Transactions transactions;
  const TransactionCard({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40.toMobileHeight,
              width: 40.toMobileHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).dividerColor,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                transactions.picture!,
                height: 30,
                width: 30,
              ),
            ),
            SizedBox(
              width: 12.toMobileWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactions.transactionMessage ?? '',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.2),
                ),
                SizedBox(
                  height: 4.toMobileHeight,
                ),
                Text(
                  formatDateTime(transactions.dateTime ?? ''),
                  style: TextStyle(
                      color: Theme.of(context).dividerColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ],
        ),
        Text(
          '${Constants.rs}${transactions.amount}/-',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(letterSpacing: 1.1, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

String formatDateTime(String dateTimeString) {
  // Parse the given datetime string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Format the date part
  String formattedDate =
      '${_getMonth(dateTime.month)} ${dateTime.day.toString().padLeft(2, '0')}';

  // Format the time part
  String formattedTime =
      '${_get12Hour(dateTime.hour)}:${dateTime.minute.toString().padLeft(2, '0')} ${_getAMPM(dateTime.hour)}';

  // Return formatted datetime
  return '$formattedDate | $formattedTime';
}

// Function to get month abbreviation
String _getMonth(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}

// Function to get 12-hour format
int _get12Hour(int hour) {
  return hour > 12 ? hour - 12 : hour;
}

// Function to get AM or PM
String _getAMPM(int hour) {
  return hour >= 12 ? 'PM' : 'AM';
}

String formatDateToMonthYear(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Format the date part
  String formattedDate = '${_getMonth(dateTime.month)}, ${dateTime.year}';
  return formattedDate;
}
