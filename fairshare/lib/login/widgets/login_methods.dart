import 'package:fairshare/login/widgets/animation_wrapper.dart';
import 'package:fairshare/common/widgets/custom_button.dart';
import 'package:fairshare/common/widgets/custom_textbox.dart';
import 'package:fairshare/login/widgets/or_divider.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class LoginMethods extends StatefulWidget {
  final double? height;
  const LoginMethods({super.key, this.height});

  @override
  State<LoginMethods> createState() => _LoginMethodsState();
}

class _LoginMethodsState extends State<LoginMethods> {
  double screenHeight = 0;
  bool startAnimation = false;
  late FocusNode _userNameFocusNode;
  late FocusNode _passwordFocusNode;
  bool obscureText = true;

  @override
  void dispose() {
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
    _userNameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.height,
      duration: const Duration(seconds: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextBox(
            index: 1,
            width: SizeConfig.screenWidth - 48,
            hintText: 'Enter your name',
            title: 'User name',
            focusNode: _userNameFocusNode,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          CustomTextBox(
            index: 2,
            title: 'Password',
            obscureText: obscureText,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).dividerColor,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            width: SizeConfig.screenWidth - 48,
            hintText: 'Enter your password',
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) {
              _passwordFocusNode.unfocus();
            },
          ),
          SizedBox(
            height: 8.toMobileHeight,
          ),
          AnimationWrapper(
            index: 3,
            startAnimation: startAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false,
                      onChanged: (val) {},
                    ),
                    Text(
                      'Remember me',
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password ?',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8.toMobileHeight,
          ),
          AnimationWrapper(
            index: 4,
            startAnimation: startAnimation,
            child: CustomButton(
              width: SizeConfig.screenWidth,
              height: 180.toMobileHeight,
              buttonName: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          const OrDivider(),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          AnimationWrapper(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).dividerColor)),
            index: 5,
            startAnimation: startAnimation,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.mail),
              SizedBox(
                width: 12.toMobileWidth,
              ),
              Text('Login with Gmail',
                  style: Theme.of(context).textTheme.displayMedium),
            ]),
          ),
          SizedBox(
            height: 16.toMobileHeight,
          ),
          AnimationWrapper(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).dividerColor)),
            index: 6,
            startAnimation: startAnimation,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.phone),
              SizedBox(
                width: 12.toMobileWidth,
              ),
              Text('Login with Mobile',
                  style: Theme.of(context).textTheme.displayMedium),
            ]),
          ),
        ],
      ),
    );
  }
}
