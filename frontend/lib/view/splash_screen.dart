import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/splash_page_component.dart';
import 'package:project/model/splash_screen_item.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/strings.dart';

import '../presentation/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: splashItems.length,
        controller: controller,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SplashPageComponent(
                item: splashItems[index],
              ),
              Positioned(
                  bottom: AppSizing.s_32 - AppSizing.s_8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppFontSizes.fs_24),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            index == 0
                                ? Text(
                                    AppStrings.appTitle,
                                    style: TextStyle(
                                        color: AppColors.light,
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppFontSizes.fs_24),
                                  )
                                : _splashIndicators(index),
                          ],
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (index < 4) {
                                    print(index);
                                    controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn);
                                  } else {
                                    Get.offNamed(AppRoutes.signIn);
                                  }
                                },
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: AppFontSizes.fs_16,
                                      color: AppColors.dark),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.offNamed(AppRoutes.signIn);
                                  },
                                  child: Text(
                                    "Skip",
                                    style: TextStyle(
                                      fontSize: AppFontSizes.fs_16,
                                      color: index == 0
                                          ? AppColors.light
                                          : AppColors.secondary,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }

  Widget _splashIndicators(int index) {
    return Row(
      children: [
        _indicator(index == 1),
        _spacer(),
        _indicator(index == 2),
        _spacer(),
        _indicator(index == 3),
        _spacer(),
        _indicator(index == 4),
      ],
    );
  }

  SizedBox _spacer() {
    return const SizedBox(
      width: AppSizing.s_4,
    );
  }

  Widget _indicator(bool active) {
    return Container(
      height: AppSizing.s_8,
      width: AppSizing.s_8,
      decoration: BoxDecoration(
        color: active ? AppColors.secondary : AppColors.lightDark,
        borderRadius: BorderRadius.circular(AppSizing.s_8 / 2),
      ),
    );
  }

  // _handleNavigation(int index) async {
  //   final pref = await SharedPreferences.getInstance();
  //   bool? hasVisited = false;
  //   try {
  //     hasVisited = pref.getBool("hasVisited");
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //   }

  //   if (index == 0 && hasVisited == true) {
  //     await Future.delayed(const Duration(seconds: 5), () {
  //       Get.offNamed(
  //         AppRoutes.signIn,
  //       );
  //     });
  //   } else if (index < 4) {
  //     await Future.delayed(const Duration(seconds: 2), () {
  //       controller.nextPage(
  //         duration: const Duration(microseconds: 2000),
  //         curve: Curves.easeIn,
  //       );
  //     });
  //   } else if (index == 4) {
  //     await Future.delayed(const Duration(seconds: 5), () {
  //       Get.offNamed(AppRoutes.signIn);
  //     });
  //   }
  // }
}
