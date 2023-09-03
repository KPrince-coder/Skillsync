import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
}
