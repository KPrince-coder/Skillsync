import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/app_logo.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/input_field.dart';
import 'package:project/controller/sign_in_controller.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/strings.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SignInController _controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizing.s_24,
          vertical: AppSizing.s_64,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSizing.s_64),
                child: AppLogo(
                  imgUrl: AppImageUrls.appIcon,
                  color: AppColors.primaryDark,
                ),
              ),
              Column(
                children: [
                  const Text(
                    "Hello there, Welcome to ${AppStrings.appTitle}",
                    style: TextStyle(
                      fontSize: AppFontSizes.fs_24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSizing.s_24,
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
                    label: "your password",
                    inputType: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
                  const SizedBox(
                    height: AppSizing.s_24,
                  ),
                  ButtonComponent(
                    label: "Login",
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(
                height: AppSizing.s_24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account,"),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUp);
                      },
                      child: const Text("register"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
