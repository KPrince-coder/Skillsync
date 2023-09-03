import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/routes.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'custom_circular_avatar.dart';

enum UserType { employee, worker }

class MenuComponent extends StatelessWidget {
  final UserType? userType;
  const MenuComponent(
      {super.key,
      this.userType = UserType.employee,
      required this.sideMenuKey});
  final GlobalKey<SideMenuState> sideMenuKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      color: AppColors.primaryDark,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(
        top: AppSizing.s_64,
        left: AppSizing.s_24,
        right: AppSizing.s_24,
        bottom: AppSizing.s_32,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomCircularAvatar(),
                const SizedBox(
                  height: AppSizing.s_24,
                ),
                Text(
                  "dacsolo10@gmail.com",
                  style: TextStyle(color: AppColors.primary),
                ),
                Text(
                  "Dacosta",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightGray,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: AppSizing.s_4,
          ),
          Divider(
            color: AppColors.lightDark,
          ),
          const SizedBox(
            height: AppSizing.s_24,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                _menuTile(
                    icon: Icons.home,
                    onTap: () {
                      if (userType == UserType.employee) {
                        Get.offNamed(AppRoutes.user);
                      } else if (userType == UserType.worker) {
                        Get.offNamed(AppRoutes.worker);
                      }
                      _closeMenu();
                    },
                    title: "Home"),
                if (userType == UserType.employee)
                  _menuTile(
                      icon: Icons.task,
                      onTap: () {
                        Get.offNamed(AppRoutes.tasks);
                        _closeMenu();
                      },
                      title: "Tasks"),
                _menuTile(
                    icon: Icons.person,
                    onTap: () {
                      Get.offNamed(AppRoutes.updateProfile,
                          arguments: userType);
                      _closeMenu();
                    },
                    title: "Update Profile"),
                Divider(
                  color: AppColors.lightDark,
                ),
                _menuTile(
                    icon: Icons.monetization_on,
                    onTap: () {
                      _closeMenu();
                    },
                    title: "Payment Plan"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSizing.s_32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign out",
                        style: TextStyle(color: AppColors.lightGray),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile _menuTile(
      {void Function()? onTap, required String title, required IconData icon}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppFontSizes.fs_16 - 2,
          fontWeight: FontWeight.bold,
          color: AppColors.gray,
        ),
      ),
    );
  }

  void _closeMenu() {
    final state = sideMenuKey.currentState;
    if (state!.isOpened) {
      state.closeSideMenu();
    }
  }
}
