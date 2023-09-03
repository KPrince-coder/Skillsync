import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/input_field.dart';
import 'package:project/components/select_field.dart';
import 'package:project/controller/sign_up_controller.dart';
import 'package:project/presentation/constants.dart';

import '../components/app_logo.dart';
import '../presentation/colors.dart';
import '../presentation/routes.dart';
import '../presentation/strings.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController _controller = Get.put(SignUpController());

  final List<Map<String, String>> list = [
    {
      "key": "worker",
    },
    {"key": "employer"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppSizing.s_24,
          right: AppSizing.s_24,
          bottom: AppSizing.s_24 - 8,
          top: AppSizing.s_32,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizing.s_64),
                  child: AppLogo(
                    imgUrl: AppImageUrls.appIcon,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
              const Text(
                "Let's register you for ${AppStrings.appTitle}",
                style: TextStyle(
                  fontSize: AppFontSizes.fs_24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizing.s_24,
              ),
              SelectTextField(
                controller: _controller.userType,
                label: "choose your user status",
                itemList: list,
              ),
              const SizedBox(
                height: AppSizing.s_8,
              ),
              InputFieldComponent(
                  controller: _controller.username, label: "your user name"),
              const SizedBox(
                height: AppSizing.s_8,
              ),
              InputFieldComponent(
                controller: _controller.email,
                label: "your email",
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: AppSizing.s_8,
              ),
              InputFieldComponent(
                controller: _controller.password,
                label: "choose password",
                isObscured: true,
              ),
              const SizedBox(
                height: AppSizing.s_8,
              ),
              InputFieldComponent(
                controller: _controller.confirmPassword,
                label: "confirm password",
                isObscured: true,
              ),
              const SizedBox(
                height: AppSizing.s_24,
              ),
              
              ButtonComponent(
                label: "Continue",
                onPressed: () {
                  if (_controller.userType.dropDownValue!.value == "worker") {
                    Get.toNamed(AppRoutes.signUp2);
                  } else if (_controller.userType.dropDownValue!.value ==
                      "employer") {
                    Get.offNamed(AppRoutes.user);
                  }
                },
              ),
              const SizedBox(
                height: AppSizing.s_24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account,"),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(AppRoutes.signIn);
                      },
                      child: const Text("let's login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
