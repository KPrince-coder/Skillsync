import 'package:flutter/material.dart';
import 'package:project/presentation/constants.dart';

class AppSpacing {
  static SizedBox verticalSpacer({double? size = AppSizing.s_32 - 2}) =>
      SizedBox(
        height: size,
      );
}
