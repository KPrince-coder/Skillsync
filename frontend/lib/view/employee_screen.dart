import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/main_page_container.dart';
import 'package:project/components/section_heading.dart';
import 'package:project/model/service_tile_model.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/strings.dart';

import '../components/fixer_tile.dart';
import '../components/menu_component.dart';
import '../components/recent_task_time.dart';
import '../components/service_card_item.dart';
import '../presentation/constants.dart';
import '../presentation/spacing.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final ScrollController _scrollController = ScrollController();
  UserType userType = UserType.employee;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MainPageContainer(
        userType: userType,
        child: Column(
          children: [
            const SectionHeader(title: "Services"),
            AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.serviceDetails,
                          arguments: {
                            "title": serviceModelList[index].title,
                            "userType": userType
                          },
                        );
                      },
                      child: ServiceItemCard(item: serviceModelList[index]));
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.verticalSpacer(),
                  SectionHeader(
                    title: "Fixer of the week",
                    icon: Icons.refresh,
                    onPressed: () {},
                  ),
                  AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.fixeDetails, arguments: {
                        "route": AppRoutes.user,
                        "title": "Electricians",
                        "userType": userType,
                      });
                    },
                    child: FixerItem(
                      imgUrl: AppImageUrls.profileImage,
                      name: "name",
                      rating: 0.0,
                      specialty: "Electrician",
                      color: AppColors.primaryDark,
                    ),
                  ),
                  AppSpacing.verticalSpacer(),
                  SectionHeader(
                    title: "List of recent Hiring",
                    icon: Icons.refresh,
                    onPressed: () {},
                  ),
                  AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const RecentTaskItem();
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
