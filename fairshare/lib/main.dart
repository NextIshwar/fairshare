import 'package:fairshare/create_bill/create_bill.dart';
import 'package:fairshare/home/home.dart';
import 'package:fairshare/login/login.dart';
import 'package:fairshare/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const Home(),
        '/create-bill': (context) => const CreateBill()
      },
      theme: Themes.darkTheme,
    );
  }
}
