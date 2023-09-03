import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/input_field.dart';
import 'package:project/components/select_field.dart';
import 'package:project/controller/sign_up_controller.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/routes.dart';

import '../components/button_component.dart';
import '../presentation/constants.dart';
import '../presentation/strings.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final SignUpController _controller = Get.put(SignUpController());
  List<String> inputStrings = [];
  List<String> snapshotStrings = [];

  List<Map<String, String>> itemList = [
    {"key": "electrician"},
    {"key": "gardener"},
    {"key": "plumber"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.light,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.offNamed(AppRoutes.signUp);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.dark,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppSizing.s_24,
          right: AppSizing.s_24,
          bottom: AppSizing.s_24 - 8,
          top: AppSizing.s_32,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: AppSizing.s_8,
                    right: AppSizing.s_8,
                    top: AppSizing.s_64),
                child: Text(
                  "Thanks for continuing this far, won't and you would be all set for  ${AppStrings.appTitle}",
                  style: TextStyle(
                    fontSize: AppFontSizes.fs_16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: AppSizing.s_24,
              ),
              InputFieldComponent(
                controller: _controller.description,
                label: "tell your employers little about you",
                maxLines: 5,
                inputType: TextInputType.multiline,
                height: AppSizing.s_120,
              ),
              const SizedBox(
                height: AppSizing.s_16,
              ),
              InputFieldComponent(
                controller: _controller.experience,
                label: "Your years of experience",
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: AppSizing.s_16,
              ),
              InputFieldComponent(
                controller: _controller.experience,
                label: "your contact",
                inputType: TextInputType.phone,
              ),
              const SizedBox(
                height: AppSizing.s_16,
              ),
              SelectTextField(
                controller: _controller.expertise,
                label: "Chose your expertise",
                itemList: itemList,
              ),
              const SizedBox(
                height: AppSizing.s_16,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                alignment: WrapAlignment.start,
                children: [
                  for (String input in inputStrings)
                    Chip(
                        label: Text(input),
                        onDeleted: () {
                          _removeInputString(input);
                        }),
                ],
              ),
              if (inputStrings.isNotEmpty)
                const SizedBox(
                  height: AppSizing.s_16,
                ),
              InputFieldComponent(
                controller: _controller.additionalExperience,
                label: "Any skills you want to add",
                iconButton: IconButton(
                  onPressed: () {
                    if (_controller.additionalExperience.text.isNotEmpty) {
                      _addInputString(_controller.additionalExperience.text);
                    }
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
              const SizedBox(
                height: AppSizing.s_32,
              ),
              ButtonComponent(
                label: "Continue",
                onPressed: () {
                  Get.offNamed(AppRoutes.worker);
                },
              ),
              const Text(
                "Congratulations for successful registration",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addInputString(String input) {
    final bool test = [...inputStrings]
            .where((val) => val.toLowerCase() == input.toLowerCase())
            .length >
        0;

    if (test) {
      Get.snackbar("Info", "experience already added",
          backgroundColor: Colors.yellowAccent,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      setState(() {
        inputStrings.add(input);
        _controller.additionalExperience.clear();
      });
    }
  }

  void _removeInputString(String input) {
    setState(() {
      inputStrings.remove(input);
    });
  }
}
