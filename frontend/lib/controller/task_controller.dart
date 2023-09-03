import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  static TaskController get instance => Get.find();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
}
