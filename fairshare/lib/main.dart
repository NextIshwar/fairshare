import 'package:fairshare/login/widgets/login_methods.dart';
import 'package:fairshare/login/widgets/logo.dart';
import 'package:fairshare/services/size_config.dart';
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
      theme: Themes.darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SizedBox(
        width: SizeConfig.screenWidth,
        child: const Column(
          children: [
            Logo(),
            LoginMethods(),
          ],
        ),
      ),
    );
  }
}