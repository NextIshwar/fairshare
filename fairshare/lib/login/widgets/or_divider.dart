import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth - 48,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Theme.of(context).dividerColor,
                height: 36,
                thickness: 2,
              ),
            ),
          ),
          Text(
            'OR',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 16),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Theme.of(context).dividerColor,
                thickness: 2,
                height: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
