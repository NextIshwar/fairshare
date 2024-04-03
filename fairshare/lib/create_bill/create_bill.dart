import 'package:fairshare/common/widgets/custom_button.dart';
import 'package:fairshare/common/widgets/custom_textbox.dart';
import 'package:fairshare/common/widgets/spliter_list.dart';
import 'package:fairshare/login/widgets/animation_wrapper.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class CreateBill extends StatefulWidget {
  const CreateBill({super.key});

  @override
  State<CreateBill> createState() => _CreateBillState();
}

class _CreateBillState extends State<CreateBill> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          arguments['pageTitle'],
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 12.toMobileWidth, vertical: 20.toMobileHeight),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomTextBox(
                hintStyle: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.normal),
                index: 1,
                width: SizeConfig.screenWidth,
                hintText: 'Pizza Party',
                title: 'Title',
                // focusNode: _userNameFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  // FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
              SizedBox(
                height: 16.toMobileHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextBox(
                    readOnly: true,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                    index: 2,
                    width: SizeConfig.screenWidth * 0.4,
                    hintText: '01-06-2024',
                    title: 'Date',
                    // focusNode: _userNameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      // FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  ),
                  CustomTextBox(
                    readOnly: true,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                    index: 2,
                    width: SizeConfig.screenWidth * 0.4,
                    hintText: '04:00 PM',
                    title: 'Time',
                    // focusNode: _userNameFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      // FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16.toMobileHeight,
              ),
              CustomTextBox(
                hintStyle: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.normal),
                index: 3,
                width: SizeConfig.screenWidth,
                hintText: '\u{20B9}600/-',
                title: 'Enter Amount',
                // focusNode: _userNameFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  // FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
              SizedBox(
                height: 16.toMobileHeight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Split Money with',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 8.toMobileHeight,
                  ),
                  SpliterList(
                    startAnimation: startAnimation,
                  ),
                ],
              ),
              SizedBox(
                height: 24.toMobileHeight,
              ),
              SizedBox(
                child: AnimationWrapper(
                  index: 4,
                  startAnimation: startAnimation,
                  child: CustomButton(
                    buttonName: 'Create Bill',
                    height: 40.toMobileHeight,
                    width: 120.toMobileWidth,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
