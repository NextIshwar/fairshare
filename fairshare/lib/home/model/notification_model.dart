import 'package:fairshare/common/icon_images.dart';

class AllNotification {
  List<Notification>? notification;

  AllNotification({this.notification});

  AllNotification.fromJson(Map<String, dynamic> json) {
    if (json['notification'] != null) {
      notification = <Notification>[];
      json['notification'].forEach((v) {
        notification!.add(Notification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (notification != null) {
      data['notification'] = notification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notification {
  String? dateTime;
  List<AllTransactions>? allTransactions;

  Notification({this.dateTime, this.allTransactions});

  Notification.fromJson(Map<String, dynamic> json) {
    dateTime = json['dateTime'];
    if (json['allTransactions'] != null) {
      allTransactions = <AllTransactions>[];
      json['allTransactions'].forEach((v) {
        allTransactions!.add(AllTransactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dateTime'] = dateTime;
    if (allTransactions != null) {
      data['allTransactions'] =
          allTransactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllTransactions {
  String? transactionMessage;
  String? dateTime;
  double? amount;
  String? picture;
  String? whoPaid;
  String? whoOwe;
  double? dueAmount;

  AllTransactions({
    this.transactionMessage,
    this.dateTime,
    this.amount,
    this.picture,
    this.dueAmount,
    this.whoOwe,
    this.whoPaid,
  });

  AllTransactions.fromJson(Map<String, dynamic> json) {
    transactionMessage = json['notificationMessage'];
    dateTime = json['dateTime'];
    amount = json['amount'];
    picture = json['picture'];
    whoPaid = json["whoPaid"];
    whoOwe = json["whoOwe"];
    dueAmount = json["dueAmount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['notificationMessage'] = transactionMessage;
    data['dateTime'] = dateTime;
    data['amount'] = amount;
    data['picture'] = picture;
    data["whoPaid"] = whoPaid;
    data["whoOwe"] = whoOwe;
    data["dueAmount"] = dueAmount;
    return data;
  }
}

final Map<String, dynamic> dummyNotificationList = {
  "notification": [
    {
      "dateTime": "2024-04-10T10:00:00",
      "allTransactions": [
        {
          "notificationMessage": "Cigarette",
          "dateTime": "2024-04-10T10:00:00",
          "amount": 45.0,
          "picture": IconImages.cigarette,
          "whoPaid": "You",
          "whoOwe": "John",
          "dueAmount": 45.0
        },
        {
          "notificationMessage": "Dinner",
          "dateTime": "2024-04-10T10:20:00",
          "amount": 35.0,
          "picture": IconImages.meal,
          "whoPaid": "Alice",
          "whoOwe": "you",
          "dueAmount": 35.0
        },
        {
          "notificationMessage": "Pizza",
          "dateTime": "2024-04-10T10:30:00",
          "amount": 350.0,
          "picture": IconImages.pizza,
          "whoPaid": "Alice",
          "whoOwe": "you",
          "dueAmount": 100.0
        },
        {
          "notificationMessage": "Gasoline",
          "dateTime": "2024-04-10T10:40:00",
          "amount": 35.0,
          "picture": IconImages.petrol,
          "whoPaid": "Alice",
          "whoOwe": "you",
          "dueAmount": 35.0
        }
      ]
    },
    {
      "dateTime": "2024-03-08T10:00:00",
      "allTransactions": [
        {
          "notificationMessage": "Grocery",
          "dateTime": "2024-04-08T09:00:00",
          "amount": 45.0,
          "picture": IconImages.grocery,
          "whoPaid": "You",
          "whoOwe": "John",
          "dueAmount": 45.0
        },
        {
          "notificationMessage": "Gasoline",
          "dateTime": "2024-04-08T10:30:00",
          "amount": 35.0,
          "picture": IconImages.petrol,
          "whoPaid": "Alice",
          "whoOwe": "you",
          "dueAmount": 35.0
        }
      ]
    },
    {
      "dateTime": "2024-02-07T21:00:00",
      "allTransactions": [
        {
          "notificationMessage": "Movie",
          "dateTime": "2024-04-07T18:00:00",
          "amount": 15.0,
          "picture": IconImages.movie,
          "whoPaid": "Alice",
          "whoOwe": "you",
          "dueAmount": 15.0
        }
      ]
    },
    {
      "dateTime": "2024-01-06T15:20:00",
      "allTransactions": [
        {
          "notificationMessage": "Lunch",
          "dateTime": "2024-04-06T12:30:00",
          "amount": 12.75,
          "picture": IconImages.meal,
          "whoPaid": "John",
          "whoOwe": "you",
          "dueAmount": 12.75
        }
      ]
    },
    {
      "dateTime": "2023-12-05T08:45:00",
      "allTransactions": [
        {
          "notificationMessage": "Coffee",
          "dateTime": "2024-04-05T08:00:00",
          "amount": 3.25,
          "picture": IconImages.coffee,
          "whoPaid": "You",
          "whoOwe": "Bob",
          "dueAmount": 3.25
        },
        {
          "notificationMessage": "Croissant",
          "dateTime": "2024-04-05T09:30:00",
          "amount": 2.75,
          "picture": IconImages.meal,
          "whoPaid": "You",
          "whoOwe": "John",
          "dueAmount": 2.75
        }
      ]
    },
    {
      "dateTime": "2023-11-04T18:30:00",
      "allTransactions": [
        {
          "notificationMessage": "Burger",
          "dateTime": "2024-04-04T12:15:00",
          "amount": 8.5,
          "picture": IconImages.burger,
          "whoPaid": "John",
          "whoOwe": "you",
          "dueAmount": 4.25
        }
      ]
    }
  ]
};
