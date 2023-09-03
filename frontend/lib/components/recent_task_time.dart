import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../presentation/colors.dart';
import '../presentation/constants.dart';

class RecentTaskItem extends StatelessWidget {
  const RecentTaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizing.s_4),
      decoration: BoxDecoration(color: AppColors.lightGray),
      child: ListTile(
        leading: Icon(Icons.task_alt),
        title: Text("Electrician"),
        subtitle: Text(DateFormat.jm().format(DateTime.now())),
      ),
    );
  }
}
