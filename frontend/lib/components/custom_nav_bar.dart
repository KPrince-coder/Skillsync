import 'package:flutter/material.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';
import '../presentation/strings.dart';
import 'app_logo.dart';

class CustomNavBar extends StatelessWidget {
  final bool? isReversed;
  final IconData icon;
  final void Function()? onTap;
  final String title;

  const CustomNavBar({
    super.key,
    this.isReversed = false,
    required this.icon,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return isReversed!
        ? Row(
            children: [
              IconButton(onPressed: onTap, icon: Icon(icon)),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                    fontSize: AppSizing.s_16 + 4,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppLogo(
                  size: 40,
                  imgUrl: AppImageUrls.appIcon,
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          )
        : Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppLogo(
                  size: 40,
                  imgUrl: AppImageUrls.appIcon,
                  color: AppColors.primaryDark,
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: TextStyle(
                    fontSize: AppSizing.s_16 + 4,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark),
              ),
              const Spacer(),
              IconButton(onPressed: onTap, icon: Icon(icon))
            ],
          );
  }
}
