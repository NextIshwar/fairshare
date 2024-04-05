import 'package:fairshare/common/icon_images.dart';

class AllTransactionModel {
  List<Transactions>? allTransactions;

  AllTransactionModel({this.allTransactions});

  AllTransactionModel.fromJson(Map<String, dynamic> json) {
    if (json['allTransactions'] != null) {
      allTransactions = <Transactions>[];
      json['allTransactions'].forEach((v) {
        allTransactions!.add(Transactions.fromJson(v));
      });
    }
  }
}

class Transactions {
  String? transactionMessage;
  String? dateTime;
  double? amount;
  String? picture;

  Transactions(
      {this.transactionMessage, this.dateTime, this.amount, this.picture});

  Transactions.fromJson(Map<String, dynamic> json) {
    transactionMessage = json['transactionMessage'];
    dateTime = json['dateTime'];
    amount = json['amount'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['transactionMessage'] = transactionMessage;
    data['dateTime'] = dateTime;
    data['amount'] = amount;
    data['picture'] = picture;
    return data;
  }
}

Map<String, dynamic> dummyallTransactions = {
  "allTransactions": [
    {
      "transactionMessage": "Burger",
      "dateTime": "2024-04-04T12:15:00",
      "amount": 8.50,
      "picture": IconImages.burger
    },
    {
      "transactionMessage": "Beer at the pub",
      "dateTime": "2024-04-03T20:00:00",
      "amount": 6.75,
      "picture": IconImages.beerMug
    },
    {
      "transactionMessage": "Morning coffee",
      "dateTime": "2024-04-02T08:30:00",
      "amount": 3.25,
      "picture": IconImages.coffee
    },
    {
      "transactionMessage": "Monthly house rent",
      "dateTime": "2024-04-01T00:00:00",
      "amount": 1200.00,
      "picture": IconImages.houseRent
    },
    {
      "transactionMessage": "Dinner at a restaurant",
      "dateTime": "2024-03-30T19:00:00",
      "amount": 45.00,
      "picture": IconImages.meal
    },
    {
      "transactionMessage": "Movie tickets",
      "dateTime": "2024-03-29T15:30:00",
      "amount": 25.50,
      "picture": IconImages.movie
    },
    {
      "transactionMessage": "Swimming pool entry fee",
      "dateTime": "2024-03-28T13:00:00",
      "amount": 10.00,
      "picture": IconImages.swimming
    },
    {
      "transactionMessage": "Concert tickets",
      "dateTime": "2024-03-27T17:00:00",
      "amount": 60.00,
      "picture": IconImages.tickets
    },
    {
      "transactionMessage": "Beach vacation expenses",
      "dateTime": "2024-03-26T11:00:00",
      "amount": 150.00,
      "picture": IconImages.beach
    },
    {
      "transactionMessage": "Monthly utility bill",
      "dateTime": "2024-03-25T00:00:00",
      "amount": 85.00,
      "picture": IconImages.bill
    },
    {
      "transactionMessage": "WiFi subscription",
      "dateTime": "2024-03-24T10:30:00",
      "amount": 30.00,
      "picture": IconImages.wifi
    },
    {
      "transactionMessage": "Noodles for dinner",
      "dateTime": "2024-03-23T20:00:00",
      "amount": 9.50,
      "picture": IconImages.noodles
    },
    {
      "transactionMessage": "Pizza delivery",
      "dateTime": "2024-03-22T19:00:00",
      "amount": 12.99,
      "picture": IconImages.pizza
    },
    {
      "transactionMessage": "Weekly grocery shopping",
      "dateTime": "2024-03-21T16:00:00",
      "amount": 65.00,
      "picture": IconImages.grocery
    },
    {
      "transactionMessage": "Cigarette pack",
      "dateTime": "2024-03-20T08:00:00",
      "amount": 7.50,
      "picture": IconImages.cigarette
    },
    {
      "transactionMessage": "Clothing shopping",
      "dateTime": "2024-03-19T14:30:00",
      "amount": 120.00,
      "picture": IconImages.shopping
    },
    {
      "transactionMessage": "Petrol refill",
      "dateTime": "2024-03-18T13:45:00",
      "amount": 45.00,
      "picture": IconImages.petrol
    }
  ]
};
