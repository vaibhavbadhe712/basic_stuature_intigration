import 'package:basic_intigration/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color, required this.context,  int? height});

  final BuildContext context;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.dividerColor,
    );
  }
}
