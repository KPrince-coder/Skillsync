import 'package:flutter/material.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';

class FloatingActionButtonCompnent extends StatelessWidget {
  final void Function()? onPressed;
  const FloatingActionButtonCompnent({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizing.s_64,
      width: AppSizing.s_64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizing.s_240))),
        onPressed: onPressed,
        child: const Icon(Icons.menu),
      ),
    );
  }
}
