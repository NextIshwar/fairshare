import 'package:fairshare/services/size_config.dart';
import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  final bool isSelected;
  const NavigationCard({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        width: 80.toMobileWidth,
        height: 32.toMobileWidth,
        decoration: BoxDecoration(
            color:
                isSelected ? Colors.black.withOpacity(0.5) : Colors.transparent,
            borderRadius: BorderRadius.circular(16)),
        duration: const Duration(milliseconds: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).highlightColor
                  : Theme.of(context).textTheme.displayMedium!.color,
            ),
            if (isSelected)
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 12,
                ),
              )
          ],
        ),
      ),
    );
  }
}
