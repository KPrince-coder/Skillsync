import 'package:flutter/material.dart';

import '../presentation/constants.dart';

// ignore: must_be_immutable
class AppLogo extends StatelessWidget {
  final double? size;

  AppLogo({
    super.key,
    required this.imgUrl,
    this.color,
    this.size = AppSizing.s_64
  });

  final String imgUrl;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size! * 2,
      width: size! * 2,
      padding: const EdgeInsets.all(AppSizing.s_24),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size!)),
      child: SizedBox(
        width: size!,
        height: size!,
        child: Image.asset(
          imgUrl,
        ),
      ),
    );
  }
}
