import 'package:flutter/material.dart';
import 'package:project/components/custom_nav_bar.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';
import '../presentation/spacing.dart';
import '../presentation/strings.dart';
import 'menu_component.dart';

class MainPageContainer extends StatelessWidget {
  final Widget child;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  final UserType userType;

  MainPageContainer({super.key, required this.child, required this.userType});

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
            child: Column(children: [
              CustomNavBar(
                title: AppStrings.appTitle,
                onTap: () {
                  final state = _sideMenuKey.currentState;
                  if (state!.isOpened) {
                    state.closeSideMenu(); // close side menu
                  } else {
                    state.openSideMenu(); // open side menu
                  }
                },
                icon: Icons.menu,
              ),
              AppSpacing.verticalSpacer(),
              Expanded(child: child),
            ]),
          ),
        ),
      ),
    );
  }
}
