import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/main_page_container.dart';
import 'package:project/components/menu_component.dart';
import 'package:project/components/recent_task_time.dart';
import 'package:project/components/section_heading.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/spacing.dart';

import '../components/service_card_item.dart';
import '../model/service_tile_model.dart';
import '../presentation/strings.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key});

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  UserType userType = UserType.worker;
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
              SectionHeader(
                title: "Ongoing task",
              ),
              InkWell(
                splashColor: AppColors.primary,
                radius: AppSizing.s_12,
                onTap: () {
                  Get.toNamed(AppRoutes.taskDetails);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSizing.s_12, horizontal: AppSizing.s_24),
                  decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(AppSizing.s_12)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.task_alt_rounded,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: AppSizing.s_12,
                      ),
                      Text("Task name")
                    ],
                  ),
                ),
              ),
              AppSpacing.verticalSpacer(size: AppSizing.s_12),
              SizedBox(
                height: AppSizing.s_120 + 20,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.serviceDetails, arguments: {
                      "title": "Electricians",
                      "userType": userType
                    });
                  },
                  child: ServiceItemCard(
                    item: ServiceModel(
                      description:
                          "Are you free, then don't wast anytime earn some money.",
                      imgUrl: AppImageUrls.fixer,
                      rating: 2.0,
                      title: "Check out tasks",
                    ),
                    hasRating: false,
                    width: double.infinity,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    AppSpacing.verticalSpacer(),
                    SectionHeader(
                      title: "Applied Tasks",
                      icon: Icons.refresh,
                      onPressed: () {},
                    ),
                    AppSpacing.verticalSpacer(size: AppSizing.s_12),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: AppColors.gray,
                              onTap: () {
                                Get.toNamed(AppRoutes.taskDetails);
                              },
                              child: const RecentTaskItem(),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
