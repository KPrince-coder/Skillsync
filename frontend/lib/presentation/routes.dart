import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = "/";
  static const String signUp = "/signUp";
  static const String signUp2 = "/signUp2";
  static const String signIn = "/signIn";
  static const String user = "/user";
  static const String worker = "/worker";
  static const String serviceDetails = "/services";
  static const String fixeDetails = "/fixerDetails";
  static const String tasks = "/task";
  static const String updateProfile = "/updateProfile";
  static const String taskDetails = "/taskDetails";
}

Map<String, Widget Function(BuildContext)> applicationRoutes(
    BuildContext context, Map<String, Widget> map) {
  return {
    AppRoutes.splashScreen: (context) => map[AppRoutes.splashScreen]!,
    AppRoutes.signIn: (context) => map[AppRoutes.signIn]!,
    AppRoutes.signUp: (context) => map[AppRoutes.signUp]!,
    AppRoutes.signUp2: (context) => map[AppRoutes.signUp2]!,
    AppRoutes.worker: (context) => map[AppRoutes.worker]!,
    AppRoutes.user: (context) => map[AppRoutes.user]!,
    AppRoutes.serviceDetails: (context) => map[AppRoutes.serviceDetails]!,
    AppRoutes.fixeDetails: (context) => map[AppRoutes.fixeDetails]!,
    AppRoutes.tasks: (context) => map[AppRoutes.tasks]!,
    AppRoutes.updateProfile: (context) => map[AppRoutes.updateProfile]!,
    AppRoutes.taskDetails: (context) => map[AppRoutes.taskDetails]!
  };
}
