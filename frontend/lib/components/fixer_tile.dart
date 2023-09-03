import 'package:flutter/material.dart';
import 'package:project/presentation/strings.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';
import 'app_logo.dart';

class FixerItem extends StatelessWidget {
  final String name;
  final bool? isFeedBack;
  final String specialty;
  final double? rating;
  final String? imgUrl;
  final Color? color;
  final Color? nameColor;
  final Color? avatarColor;
  final TextStyle? subTitleStyle;
  const FixerItem({
    super.key,
    required this.name,
    required this.specialty,
    this.rating,
    this.imgUrl,
    this.color,
    this.nameColor,
    this.subTitleStyle,
    this.avatarColor,
    this.isFeedBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizing.s_16),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(AppSizing.s_16)),
      child: Row(
        children: [
          AppLogo(
            color: avatarColor ?? AppColors.primary,
            imgUrl: imgUrl ?? AppImageUrls.profileImage,
            size: AppSizing.s_32 + 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: nameColor ?? AppColors.lightGray,
                          fontSize: AppFontSizes.fs_16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: AppSizing.s_16,
                      width: AppSizing.s_16,
                      decoration: BoxDecoration(
                          color: AppColors.light,
                          borderRadius: BorderRadius.circular(AppSizing.s_16)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:
                          isFeedBack! ? AppSizing.s_240 - 20 : AppSizing.s_120,
                      child: Text(
                        specialty,
                        style: subTitleStyle ??
                            TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSizing.s_16,
                            ),
                        softWrap: true,
                      ),
                    ),
                    if (rating != null) Text("rating $rating")
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
