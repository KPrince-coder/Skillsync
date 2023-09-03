import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/emloyee_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  // String baseUrl = FlutterConfig.get("APP_BASE_URL") as String;
  String baseUrl = "http://localhsot:8080/api";

  // user name
  // email
  // password
  // confirm password
  // userType
  SingleValueDropDownController userType = SingleValueDropDownController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  SingleValueDropDownController expertise = SingleValueDropDownController();
  TextEditingController experience = TextEditingController();
  TextEditingController additionalExperience = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController contactInfo = TextEditingController();
  TextEditingController description = TextEditingController();

  // type = worker
  // choose job type
  // other services you render
  // personal description
  // experience
  // location
  // contact info
  // -- mobile number

  Future<EmployeeModel?>? registerEmployee(
      {required EmployeeModel employeeModel}) async {
    print("-----------------user 🤣🤣🤣🤣 ${employeeModel.toJson()}");
    final response = await http.post(
      Uri.parse("http://localhost:8080/api/employee"),
      headers: {'Content-Type': 'application/json'}, // Set appropriate headers
      body: jsonEncode(employeeModel.toJson()), // JSON-encoded data
    );

    if (response.statusCode == 201) {
      Map<String, String> responseData = jsonDecode(response.body);
      return EmployeeModel(
          username: responseData["username"]!,
          email: responseData["email"]!,
          imgUrl: responseData["imgUrl"] ?? "");
    } else {
      return null;
    }
  }

  // registerEmployee() {}
}
