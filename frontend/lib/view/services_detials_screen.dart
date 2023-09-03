import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/aside_page_container.dart';
import 'package:project/components/fixer_tile.dart';
import 'package:project/components/menu_component.dart';
import 'package:project/components/recent_task_time.dart';
import 'package:project/components/section_heading.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/spacing.dart';
import 'package:project/presentation/strings.dart';

import '../presentation/constants.dart';

class ServicesDetails extends StatefulWidget {
  ServicesDetails({super.key});

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  final Map<String, String> imgUrl = {
    "Electricians": AppImageUrls.bulb,
    "Plummer": AppImageUrls.fixer,
    "Gardener": AppImageUrls.gardener,
    "Carpenter": AppImageUrls.fixer,
  };

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> model = Get.arguments as Map<String, dynamic>;
    UserType userType = model["userType"] as UserType;

    return AsidePageContainer(
      userType: userType,
      title: model["title"]!,
      backRoute:
          userType == UserType.employee ? AppRoutes.user : AppRoutes.worker,
      child: Column(
        children: [
          Text("${model['title']} are always in demand"),
          AppSpacing.verticalSpacer(),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                color: AppColors.primaryDark,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizing.s_8)),
                child: Stack(
                  alignment: Alignment.topLeft,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: -10,
                      top: -40,
                      child: Image.asset(
                        imgUrl[model["title"]]!,
                        width: AppSizing.s_240 - 50,
                        height: AppSizing.s_240,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSizing.s_16, horizontal: AppSizing.s_24),
                      child: Column(
                        children: [
                          Text(
                            UserType.employee == userType
                                ? "Hellooo, I'm Bob your everyday ${model['title']} companion"
                                : "Welcome",
                            style: TextStyle(
                              color: AppColors.gray,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(children: [
              AppSpacing.verticalSpacer(),
              SectionHeader(
                title:
                    "List of ${model['title']} ${userType == UserType.worker ? 'Tasks' : ''}",
                icon: Icons.refresh,
                onPressed: () {},
              ),
              AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  clipBehavior: Clip.antiAlias,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (userType == UserType.employee) {
                          Get.toNamed(AppRoutes.fixeDetails, arguments: {
                            "route": AppRoutes.serviceDetails,
                            "title": model["title"] as String,
                            "userType": userType,
                          });
                        } else {
                          Get.toNamed(AppRoutes.taskDetails);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: AppSizing.s_8),
                        child: UserType.employee == userType
                            ? FixerItem(
                                name: "name",
                                nameColor: AppColors.lightDark,
                                specialty: model['title']!,
                                rating: 0.0,
                                color: AppColors.lightGray,
                                imgUrl: AppImageUrls.profileImage)
                            : const RecentTaskItem(),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
