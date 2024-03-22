import 'package:fairshare/login/widgets/login_methods.dart';
import 'package:fairshare/login/widgets/logo.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Logo(
                height: isLoading
                    ? SizeConfig.screenHeight
                    : SizeConfig.screenHeight / 3,
              ),
              if (!isLoading)
                LoginMethods(
                  height: SizeConfig.screenHeight / 1.5,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
