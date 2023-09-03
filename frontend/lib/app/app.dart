import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/strings.dart';
import 'package:project/provider/employee_provider.dart';
import 'package:project/view/employee_screen.dart';
import 'package:project/view/fixer_detail.dart';
import 'package:project/view/services_detials_screen.dart';
import 'package:project/view/sign_in_screen.dart';
import 'package:project/view/sign_up_continue.dart';
import 'package:project/view/sign_up_screen.dart';
import 'package:project/view/splash_screen.dart';
import 'package:project/view/task_details_screen.dart';
import 'package:project/view/task_screen.dart';
import 'package:project/view/update_profile.dart';
import 'package:project/view/worker_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => EmployeeProvider(),
        child: HomePage(),
      )
    ], child: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static Map<String, Widget> map = {
    AppRoutes.splashScreen: const SplashScreen(),
    AppRoutes.signIn: SignInScreen(),
    AppRoutes.signUp: SignUpScreen(),
    AppRoutes.signUp2: const SignUpScreen2(),
    AppRoutes.worker: const WorkerScreen(),
    AppRoutes.user: const EmployeeScreen(),
    AppRoutes.serviceDetails: ServicesDetails(),
    AppRoutes.fixeDetails: const FixerDetailScreen(),
    AppRoutes.tasks: const TaskScreen(),
    AppRoutes.updateProfile: const UpdateProfile(),
    AppRoutes.taskDetails: const TaskDetails(),
  };

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppStrings.fontFamily),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: applicationRoutes(context, map),
    );
  }
}
