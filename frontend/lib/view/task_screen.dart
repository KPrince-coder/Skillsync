import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/aside_page_container.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/input_field.dart';
import 'package:project/components/menu_component.dart';
import 'package:project/components/section_heading.dart';
import 'package:project/components/select_field.dart';
import 'package:project/controller/task_controller.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/spacing.dart';
import 'package:project/presentation/strings.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return AsidePageContainer(
      userType: UserType.employee,
      backRoute: AppRoutes.user,
      title: "Tasks",
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SectionHeader(title: "Create Task"),
            SelectTextField(
              controller: SingleValueDropDownController(),
              itemList: const [
                {"key": "Carpenter"},
                {"key": "Electric"},
                {"key": "Plummer"},
                {"key": "Gardener"},
              ],
              label: "Choose task type",
            ),
            AppSpacing.verticalSpacer(size: AppSizing.s_12),
            InputFieldComponent(
              controller: controller.title,
              label: "Add title",
            ),
            AppSpacing.verticalSpacer(size: AppSizing.s_12),
            InputFieldComponent(
              controller: controller.description,
              label: "Describe the task",
              maxLines: 5,
              height: AppSizing.s_120,
            ),
            AppSpacing.verticalSpacer(),
            ButtonComponent(
              label: "Save",
              onPressed: () {},
            ),
            SectionHeader(
              title: "List of tasks",
              icon: Icons.refresh,
              onPressed: () {},
            ),
            AppSpacing.verticalSpacer(size: AppSizing.s_12),
            for (int index = 0; index < 4; index++)
              Container(
                margin: const EdgeInsets.only(bottom: AppSizing.s_8),
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizing.s_16, horizontal: AppSizing.s_24),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(AppSizing.s_24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.servicesCarpenterTitle,
                      style: TextStyle(color: AppColors.primary),
                    ),
                    SizedBox(
                        child: Text(
                      AppStrings.servicesElectricianDescription,
                      style: TextStyle(
                          color: AppColors.gray, fontSize: AppSizing.s_12),
                    ))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
