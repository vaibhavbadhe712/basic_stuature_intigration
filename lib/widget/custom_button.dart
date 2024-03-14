
import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/widget/circular_progress_indictor.dart';

import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  final BuildContext context;
  final double width;
  final double height;
  final String data;
  final Function onClick;
  final bool isInProgress;
  final FontWeight fontWeight;
  final double fontSize;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? color;
  const CustomButtonWidget({
    Key? key,
    required this.context,
    required this.data,
    this.width = 110,
    this.height = 30,
    required this.onClick,
    this.isInProgress = false,
    this.borderRadius = 0,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.backgroundColor = AppColors.blackColor,
    this.color = AppColors.blackColor,
  }) : super(key: key);

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(widget.borderRadius),
      ),
      onTap: () {
        if (!widget.isInProgress) {
          widget.onClick();
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
            widget.borderRadius,
          )),
          color: widget.backgroundColor,
        ),
        child: widget.isInProgress
            ? CircularProgressIndicatorWidget(
                context: widget.context,
                size: 20,
                color: AppColors.containerColor,
              )
            : TextWidget(
                context: widget.context,
                text: widget.data,
                color: widget.color,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              ),
      ),
    );
  }
}
