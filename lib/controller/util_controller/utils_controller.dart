
import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_enums.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UtilsController extends GetxController {
  final kPadding = 8.0;
  void showSnackBar({
    required String content,
    required BuildContext context,
    SnackType snackType = SnackType.error,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        content: TextWidget(
          text: content,
          fontSize: AppSizes.getPhoneSize(context, 16),
          fontWeight: FontWeight.w500,
          color: _getSnackbarTextColor(snackType),
          context: context,
        ),
        behavior: behavior,
        backgroundColor: _getSnackbarColor(snackType),
        padding: EdgeInsets.symmetric(
          horizontal: kPadding * 4,
          vertical: kPadding * 1.5,
        ),
      ),
    );
  }

  static Color _getSnackbarColor(SnackType type) {
    if (type == SnackType.error) return AppColors.redColor;
    if (type == SnackType.success) return AppColors.greenColor;
    return Colors.white;
  }

  static Color _getSnackbarTextColor(SnackType type) {
    if (type == SnackType.error) return AppColors.whiteColor;
    if (type == SnackType.success) return AppColors.whiteColor;
    return AppColors.blackColor;
  }
}
