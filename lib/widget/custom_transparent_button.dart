// ignore_for_file: must_be_immutable

import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class CustomTransparentButton extends StatefulWidget {
  CustomTransparentButton({
    Key? key,
    required this.context,
    required this.data,
    required this.onPressed,
    this.color,
    this.borderRadius = 32,
    this.width = 106,
    this.height = 42,
    this.letterSpacing = 0,
    this.fontWeight = FontWeight.w600,
    this.background,
    this.fontSize = AppSizes.smallTextSize,
  }) : super(key: key);

  final BuildContext context;
  final String data;
  final Color? color;
  final double borderRadius;
  final double width;
  final double height;
  final double letterSpacing;
  final FontWeight fontWeight;
  final Color? background;
  final double fontSize;
  void Function()? onPressed;
  @override
  _CustomTransparentButtonState createState() =>
      _CustomTransparentButtonState();
}

class _CustomTransparentButtonState extends State<CustomTransparentButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            widget.background ?? AppColors.lightWhiteColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              side: BorderSide(
                color: widget.color ?? AppColors.blackColor,
              ),
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: TextWidget(
          context: context,
          text: widget.data,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.color ?? AppColors.blackColor,
          letterSpacing: widget.letterSpacing,
          SoftWrap: true,
        ),
      ),
    );
  }
}
