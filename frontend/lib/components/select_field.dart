import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:project/presentation/constants.dart';

import '../presentation/colors.dart';

class SelectTextField extends StatefulWidget {
  final SingleValueDropDownController controller;
  final String label;
  final List<Map<String, String>> itemList;

  const SelectTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.itemList});

  @override
  State<SelectTextField> createState() => _SelectTextFieldState();
}

class _SelectTextFieldState extends State<SelectTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizing.s_64,
      child: DropDownTextField(
        textFieldDecoration: InputDecoration(
          hintText: "choose user status",
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: AppSizing.s_2, color: AppColors.lightDark),
            borderRadius: BorderRadius.circular(AppSizing.s_8),
          ),
        ),
        dropdownRadius: AppFontSizes.fs_8,
        controller: widget.controller,
        dropDownList: widget.itemList
            .map((map) =>
                DropDownValueModel(name: map["key"]!, value: map["key"]))
            .toList(),
      ),
    );
  }
}
