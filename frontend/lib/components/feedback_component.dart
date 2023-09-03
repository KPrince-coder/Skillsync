import 'package:flutter/material.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';
import 'fixer_tile.dart';

class FeedBackItem extends StatelessWidget {
  final String name;
  final String? imgUrl;
  final String feedback;

  const FeedBackItem({
    super.key,
    required this.name,
    required this.feedback,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FixerItem(
      name: name,
      specialty: feedback,
      isFeedBack: true,
      imgUrl: imgUrl,
      color: AppColors.lightGray,
      nameColor: AppColors.primary,
      avatarColor: AppColors.lightDark,
      subTitleStyle: TextStyle(
        fontSize: AppSizing.s_8 + 4,
        color: AppColors.lightDark,
      ),
    );
  }
}
