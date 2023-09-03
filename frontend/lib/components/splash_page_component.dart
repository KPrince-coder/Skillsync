import 'package:flutter/material.dart';
import 'package:project/model/splash_screen_item.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/strings.dart';

import 'app_logo.dart';

class SplashPageComponent extends StatelessWidget {
  final SplashItem item;
  const SplashPageComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizing.s_64,
        horizontal: AppSizing.s_24,
      ),
      color: AppStrings.appIconString == item.label
          ? AppColors.primary
          : AppColors.light,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: item.label == AppStrings.appIconString
            ? [
                AppLogo(
                  imgUrl: item.imgUrl,
                  color: AppColors.light,
                ),
                const SizedBox(
                  height: AppSizing.s_24,
                ),
                _textDisplay(item.label)
              ]
            : [
                Expanded(
                    child: Stack(
                      alignment:Alignment.center,
                  children: [
                    Container(
                      height: AppSizing.s_300,
                      width: AppSizing.s_300,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(AppSizing.s_240)),
                    ),
                    Image.asset(item.imgUrl),
                  ],
                )),
                _textDisplay(item.label),
              ],
      ),
    );
  }

  Text _textDisplay(String label) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.primaryDark,
        fontSize: AppFontSizes.fs_16 - 1,
      ),
      textAlign: TextAlign.center,
    );
  }
}
