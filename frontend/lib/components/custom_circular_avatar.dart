import 'package:flutter/material.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';
import '../presentation/strings.dart';
import 'app_logo.dart';

class CustomCircularAvatar extends StatelessWidget {
  final double? size;
  final String? imgUrl;
  final bool? canUpdate;
  const CustomCircularAvatar({
    super.key,
    this.imgUrl,
    this.canUpdate = true,
    this.size = AppSizing.s_64,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AppLogo(
          size: size,
          imgUrl: imgUrl ?? AppImageUrls.profileImage,
          color: AppColors.primary,
        ),
        if (canUpdate == true)
          Positioned(
              right: -10,
              top: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt,
                  color: AppColors.lightGray,
                ),
              ))
      ],
    );
  }
}
