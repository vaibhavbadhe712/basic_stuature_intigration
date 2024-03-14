
import 'package:basic_intigration/constant/app_enums.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';
import 'icon_widget.dart';

class SearchTextFieldWidget extends GetResponsiveView {
  SearchTextFieldWidget({
    Key? key,
    this.width = 150,
    this.height = 35,
    this.hintText,
    this.fontsize,
    this.color,
    this.showSuffixIcon = false,
    required this.onChanged,
    this.rounded,
    this.controller,
  }) : super(key: key);

  final double width;
  final double height;
  final String? hintText;
  final Color? color;
  final double? fontsize;
  final Function onChanged;
  bool showSuffixIcon;
  final double ?rounded;
   final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: color ?? AppColors.bodyColor,
        border: Border.all(
          color: AppColors.dividerColor,
          width: AppSizes.getPhoneSize(context, 2.0),
        ),
        borderRadius:  BorderRadius.all(
          Radius.circular(
          rounded ??  32,
          ),
        ),
      ),
      child: TextField(
        controller: controller, 
        maxLines: 1,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: fontsize),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(
            left: AppSizes.getPhoneSize(context, 10),
            right: AppSizes.getPhoneSize(context, 10),
          ),
          suffixIcon: showSuffixIcon == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconWidget(
                    context: context,
                    data: AppIcons.search.name,
                    width: AppSizes.getPhoneSize(context, 15),
                    height: AppSizes.getPhoneSize(context, 20),
                    color: AppColors.grayColor,
                  ),
                )
              : const SizedBox(),
          hintText: hintText,
        ),
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}
