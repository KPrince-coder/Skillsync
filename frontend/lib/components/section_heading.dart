import 'package:flutter/material.dart';
import 'package:project/presentation/constants.dart';

class SectionHeader extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final String title;
  const SectionHeader({
    super.key,
    this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: AppFontSizes.fs_16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(onPressed: onPressed, icon: Icon(icon))
      ],
    );
  }
}
