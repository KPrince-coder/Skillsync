import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/custom_circular_avatar.dart';
import 'package:project/components/input_field.dart';
import 'package:project/components/menu_component.dart';
import 'package:project/components/section_heading.dart';
import 'package:project/controller/sign_up_controller.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/spacing.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final SignUpController controller = Get.put(SignUpController());
  UserType userType = Get.arguments as UserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        backgroundColor: AppColors.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.dark),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppFontSizes.fs_32, horizontal: AppSizing.s_32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircularAvatar(
                  size: AppSizing.s_120,
                ),
                const SectionHeader(title: "Your Details"),
                ProfileUpdateField(
                  controller: TextEditingController(text: "User name"),
                ),
                AppSpacing.verticalSpacer(size: AppSizing.s_12),
                ProfileUpdateField(
                  controller: TextEditingController(text: "Email"),
                ),
                AppSpacing.verticalSpacer(),
                ButtonComponent(
                  label: "Save",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileUpdateField extends StatefulWidget {
  const ProfileUpdateField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<ProfileUpdateField> createState() => _ProfileUpdateFieldState();
}

class _ProfileUpdateFieldState extends State<ProfileUpdateField> {
  bool editable = false;
  bool showBorder = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InputFieldComponent(
          controller: widget.controller,
          width: MediaQuery.of(context).size.width * 0.7,
          isEnabled: editable,
          hasBorder: showBorder,
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            setState(() {
              showBorder = !showBorder;
              editable = !editable;
            });
          },
        ),
      ],
    );
  }
}
