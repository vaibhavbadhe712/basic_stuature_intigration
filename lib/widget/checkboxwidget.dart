
import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/widget/sized_box.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

class CheckBoxWidget extends GetResponsiveView {
  CheckBoxWidget({
    Key? key,
    required this.context,
    this.value = false,
    this.data = "",
    this.contentPadding,
    required this.onChanged,
    this.fontSize = AppSizes.smallTextSize,
    this.fontWeight = FontWeight.normal,
    this.width = 18,
    this.height = 18,
    this.color,
    this.isMandatory = false,
  }) : super(key: key);

  final BuildContext context;
  final bool value;
  final String data;
  final Function onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final Color? color;
  final bool isMandatory;

  @override
  Widget? builder() {
    return Container(
      padding: contentPadding ?? EdgeInsets.zero,
      child: Row(
        children: [
          SizedBoxWidget(
            width: width,
            height: height,
            child: Checkbox(
              activeColor: AppColors.blackColor,
              side: BorderSide(
                width: screen.isPhone
                    ? AppSizes.getPhoneSize(context, 1)
                    : AppSizes.getWebSize(context, 1),
                color: color ?? Theme.of(context).primaryColor,
              ),
              value: value,
              onChanged: (value) {
                onChanged(value);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: screen.isPhone
                    ? AppSizes.getPhoneSize(context, 15)
                    : AppSizes.getWebSize(context, 15),
              ),
              child: TextWidget(
                context: context,
                text: data,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
