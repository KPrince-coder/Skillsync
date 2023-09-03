import 'package:flutter/material.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';

class InputFieldComponent extends StatelessWidget {
  final bool? hasBorder;
  final bool? isEnabled;
  final TextEditingController controller;
  final String? label;
  final double? height;
  final double? width;
  final bool isObscured;
  final IconButton? iconButton;
  final int? maxLines;
  final TextInputType? inputType;

  const InputFieldComponent(
      {super.key,
      required this.controller,
      this.label,
      this.isObscured = false,
      this.iconButton,
      this.maxLines = 1,
      this.inputType = TextInputType.text,
      this.height = AppSizing.s_64,
      this.hasBorder = true,
      this.isEnabled = true,
      this.width = double.infinity, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: hasBorder!
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                      width: AppSizing.s_2, color: AppColors.lightDark),
                  borderRadius: BorderRadius.circular(AppSizing.s_8),
                )
              : InputBorder.none,
          suffixIcon: iconButton,
        ),
        obscureText: isObscured,
        enabled: isEnabled,
      ),
    );
  }
}
