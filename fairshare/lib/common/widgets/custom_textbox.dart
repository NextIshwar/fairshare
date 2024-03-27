import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  final double? height, width;
  final String hintText, title;
  final int index;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  const CustomTextBox({
    super.key,
    this.height,
    this.width,
    required this.hintText,
    required this.title,
    required this.index,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  double screenHeight = 0;
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
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (widget.index * 200)),
      height: widget.height,
      width: widget.width,
      transform:
          Matrix4.translationValues(startAnimation ? 0 : widget.width!, 0, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 8.toMobileHeight,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.displaySmall,
          cursorColor: Theme.of(context).highlightColor,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
