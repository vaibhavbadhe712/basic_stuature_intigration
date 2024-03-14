import 'package:basic_intigration/constant/app_colors.dart';
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextformFieldWidget extends StatefulWidget {
  const TextformFieldWidget({
    super.key,
    this.hintText,
    this.height,
    this.rouneded = 5.0,
    this.fontWeight,
    this.focusNode,
    this.suffixIcon,
    this.isSuffixIconShow = false,
    this.isRounded = true,
    this.backgroundColor,
    this.controller,
    this.textInputType,
    this.inputFormater,
    this.onChanged,
    this.initialValue,
    this.isBorderColor = true,
    this.hintTextColor = AppColors.DarkGrayColor,
    this.cursorHeight,
    this.textFormFieldBorderColor,
    this.maxLines,
    this.fontSize,
    this.textInputAction,
  });

  final String? initialValue;
  final String? hintText;
  final bool isSuffixIconShow;
  final double? height;
  final double rouneded;
  final bool isRounded;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final Color? textFormFieldBorderColor;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormater;
  final bool? isBorderColor;
  final Function(String)? onChanged;
  final double? cursorHeight;

  final TextInputAction? textInputAction;

  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:
            widget.isRounded ? BorderRadius.circular(widget.rouneded) : null,
      ),
      height: widget.height,
      child: TextFormField(
          maxLines: widget.maxLines ?? 1,
          cursorHeight: widget.cursorHeight,
          initialValue: widget.initialValue,
          cursorColor: AppColors.DarkGrayColor,
          inputFormatters: widget.inputFormater,
          keyboardType: widget.textInputType,
          autofocus: true,
          controller: widget.controller,
          focusNode: widget.focusNode,
        
          onFieldSubmitted: widget.onChanged,
          style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: AppColors.blackColor),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.all(AppSizes.getPhoneSize(context, 10)),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  color: widget.hintTextColor),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.rouneded),
                  borderSide: BorderSide(
                      width: 1,
                      color: (widget.isBorderColor ?? false)
                          ? Colors.transparent
                          : AppColors.grayColor)),
              focusedBorder: widget.isRounded
                  ? UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.rouneded),
                      borderSide: BorderSide(
                          width: 1,
                          color: (widget.isBorderColor ?? false)
                              ? AppColors.bodyColor
                              : AppColors.checkInButtonColor))
                  : null,
              border: widget.isRounded
                  ? UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.rouneded),
                      borderSide: BorderSide(
                          width: 1,
                          color: (widget.isBorderColor ?? false)
                              ? AppColors.checkInButtonColor
                              : AppColors.checkInButtonColor))
                  : null)),
    );
  }
}
