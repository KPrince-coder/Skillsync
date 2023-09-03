import 'package:flutter/material.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';

class ButtonComponent extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const ButtonComponent({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizing.s_32)),
            padding: const EdgeInsets.all(AppSizing.s_8 + 3)),
        child: Text(
          label,
          style:
              TextStyle(fontSize: AppFontSizes.fs_16, color: AppColors.light),
        ),
      ),
    );
  }
}
