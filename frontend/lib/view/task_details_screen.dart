import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/aside_page_container.dart';
import 'package:project/components/button_component.dart';
import 'package:project/components/menu_component.dart';
import 'package:project/components/section_heading.dart';
import 'package:project/presentation/colors.dart';
import 'package:project/presentation/constants.dart';
import 'package:project/presentation/routes.dart';
import 'package:project/presentation/spacing.dart';
import 'package:project/presentation/strings.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return AsidePageContainer(
      hideActionButton: true,
      backRoute: AppRoutes.worker,
      userType: UserType.worker,
      title: "Task Details",
      child: Column(
        children: [
          // AppSpacing.verticalSpacer(),
          const SectionHeader(title: "Task title"),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSizing.s_16, horizontal: AppSizing.s_16),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(AppSizing.s_8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.task_alt_rounded,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: AppSizing.s_24,
                ),
                SizedBox(
                  width: AppSizing.s_240,
                  child: Text(
                    AppStrings.servicesCarpenterDescription,
                    style: TextStyle(
                      color: AppColors.lightGray,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.verticalSpacer(),
          const SectionHeader(title: "TaskDetails"),
          AppSpacing.verticalSpacer(size: AppSizing.s_12),
          DataTable(
            decoration: BoxDecoration(
              color: AppColors.lightGray,
            ),
            columns: const [
              DataColumn(
                label: Text(
                  "Particulars",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                  label: Text(
                "Details",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text("Issuer")),
                DataCell(Text(
                  "John Doe",
                  style: TextStyle(color: AppColors.primary),
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text("Issue Date")),
                DataCell(Text(
                  "11-12-2020",
                  style: TextStyle(color: AppColors.primary),
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text("Status")),
                DataCell(Text(
                  "In progress",
                  style: TextStyle(color: AppColors.primary),
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text("Description")),
                DataCell(Text(
                  AppStrings.servicesCarpenterDescription,
                  style: TextStyle(color: AppColors.primary),
                )),
              ])
            ],
          ),
          AppSpacing.verticalSpacer(),

          _applyTaskButton()
        ],
      ),
    );
  }

  ButtonComponent _applyTaskButton() {
    return ButtonComponent(
      label: "Apply",
      onPressed: () {
        Get.snackbar("Task", "Apply for task",
            duration: const Duration(seconds: 3),
            animationDuration: const Duration(seconds: 1),
            padding: const EdgeInsets.symmetric(
                vertical: AppSizing.s_4, horizontal: AppSizing.s_24),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.primaryDark,
            margin: const EdgeInsets.symmetric(
                vertical: AppSizing.s_16, horizontal: AppSizing.s_32),
            isDismissible: true,
            icon: Icon(
              Icons.task_alt_rounded,
              color: AppColors.primary,
            ),
            messageText: Row(
              children: [
                const Text("Apply to task"),
                const Spacer(),
                TextButton(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: AppColors.secondary, fontSize: AppSizing.s_12),
                  ),
                  onPressed: () {
                    Get.closeCurrentSnackbar();
                  },
                ),
                TextButton(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: AppColors.primary, fontSize: AppSizing.s_12),
                  ),
                  onPressed: () {
                    setState(() {});
                  },
                )
              ],
            ));
      },
    );
  }
}
