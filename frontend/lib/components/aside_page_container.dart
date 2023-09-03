import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';
import '../presentation/spacing.dart';
import 'custom_nav_bar.dart';
import 'floating_action_button.dart';
import 'menu_component.dart';

class AsidePageContainer extends StatelessWidget {
  final bool? hideActionButton;
  final Widget child;
  final String title;
  final String backRoute;
  AsidePageContainer(
      {super.key,
      required this.child,
      required this.title,
      required this.backRoute,
      this.hideActionButton = false,
      required this.userType});

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final UserType userType;

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _sideMenuKey,
      menu: MenuComponent(
        sideMenuKey: _sideMenuKey,
        userType: userType,
      ),
      type: SideMenuType.slide,
      background: AppColors.primaryDark,
      radius: BorderRadius.circular(AppSizing.s_16),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizing.s_24, vertical: AppSizing.s_16),
            child: Column(
              children: [
                CustomNavBar(
                  icon: Icons.arrow_back,
                  title: title,
                  isReversed: true,
                  onTap: () {
                    Get.offNamed(backRoute,
                        arguments: {"title": title, "userType": userType});
                  },
                ),
                AppSpacing.verticalSpacer(size: AppSizing.s_4),
                Expanded(child: child)
              ],
            ),
          ),
        ),
        floatingActionButton: !hideActionButton!
            ? FloatingActionButtonCompnent(
                onPressed: () {
                  final state = _sideMenuKey.currentState;
                  if (state!.isOpened) {
                    state.closeSideMenu(); // close side menu
                  } else {
                    state.openSideMenu(); // open side menu
                  }
                },
              )
            : null,
      ),
    );
  }
}
