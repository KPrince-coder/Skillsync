import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/app_logo.dart';
import 'package:project/components/aside_page_container.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/feedback_component.dart';
import 'package:project/components/menu_component.dart';
import 'package:project/components/section_heading.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/spacing.dart';
import 'package:project/presentation/strings.dart';

class FixerDetailScreen extends StatefulWidget {
  const FixerDetailScreen({super.key});

  @override
  State<FixerDetailScreen> createState() => _FixerDetailScreenState();
}

class _FixerDetailScreenState extends State<FixerDetailScreen> {
  List<String> otherSkills = ["Cooking", "Driving", "Cleaning"];
  List<Map<String, String>> feedbacks = [
    {"name": "Thomas", "feedback": AppStrings.servicesCarpenterDescription},
    {"name": "Matthew", "feedback": AppStrings.servicesCarpenterDescription},
    {"name": "Joyce", "feedback": AppStrings.servicesCarpenterDescription}
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = Get.arguments as Map<String, dynamic>;
    UserType userType = map["userType"] as UserType;
    return AsidePageContainer(
      userType: userType,
      backRoute: map["route"]!,
      title: map["title"]!,
      child: Column(children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(
              imgUrl: AppImageUrls.profileImage,
              size: MediaQuery.of(context).size.width * 0.2,
              color: AppColors.primary,
            ),
            AppSpacing.verticalSpacer(),
            Text("dacsolo10@gmail.com"),
            Text("Dacosta Solomon"),
            Text("0545227189"),
            AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
            SizedBox(
              width: AppSizing.s_64 + 40,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSizing.s_2, horizontal: AppSizing.s_8),
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(AppSizing.s_8)),
                    child: Text(
                      "Rating",
                      style: TextStyle(color: AppColors.light),
                    ),
                  ),
                  Spacer(),
                  const Text("${0.0}")
                ],
              ),
            ),
          ],
        )),
        AppSpacing.verticalSpacer(),
        ButtonComponent(
          label: "Book for service",
          onPressed: () {},
        ),
        AppSpacing.verticalSpacer(),
        Expanded(
            child: Column(children: [
          SectionHeader(
            title: "Other skills and feedbacks",
            icon: Icons.refresh,
            onPressed: () {},
          ),
          AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
          Expanded(
              child: ListView(
            children: [
              if (otherSkills.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Skills"),
                    AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
                    ...otherSkills.map((e) {
                      return SkillTile(skill: e);
                    }).toList(),
                    AppSpacing.verticalSpacer(size: AppSizing.s_24),
                  ],
                ),
              if (feedbacks.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Feedbacks"),
                    AppSpacing.verticalSpacer(size: AppSizing.s_16 - 4),
                    for (Map<String, String> obj in feedbacks)
                      Container(
                        margin: const EdgeInsets.only(bottom: AppSizing.s_8),
                        child: FeedBackItem(
                          name: obj['name']!,
                          feedback: obj['feedback']!,
                        ),
                      )
                  ],
                )
            ],
          ))
        ]))
      ]),
    );
  }
}

class SkillTile extends StatelessWidget {
  final String skill;
  const SkillTile({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppSizing.s_4),
      padding: const EdgeInsets.symmetric(
          vertical: AppSizing.s_8, horizontal: AppSizing.s_24),
      decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(AppSizing.s_16)),
      child: Text(skill),
    );
  }
}
