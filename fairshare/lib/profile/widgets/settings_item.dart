import 'package:fairshare/common/widgets/image_icon.dart';
import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String imagePath;
  final String settingName;
  final void Function()? onPressed;
  final Widget? actionWidget;
  const SettingsItem({
    super.key,
    required this.imagePath,
    this.onPressed,
    required this.settingName,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Theme.of(context).dividerColor,
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CutomImageIcon(
            imagePath: imagePath,
          ),
          SizedBox(
            width: 8.toMobileWidth,
          ),
          Text(
            settingName,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Spacer(
            flex: 1,
          ),
          actionWidget == null
              ? Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14.toMobileHeight,
                )
              : actionWidget!,
        ],
      ),
    );
  }
}
