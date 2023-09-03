import 'package:flutter/material.dart';
import 'package:project/model/emloyee_model.dart';

class EmployeeProvider extends ChangeNotifier {
  late EmployeeModel _employeeModel;

  EmployeeModel get employeeModel => _employeeModel;

  set employeeModel(EmployeeModel value) {
    _employeeModel = value;
    notifyListeners();
  }
}
