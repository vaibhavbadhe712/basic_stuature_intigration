import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../constant/app_colors.dart';
import 'text_widget.dart';

class MaterialTextFormFieldWidget extends StatelessWidget {
  final BuildContext context;
  final GlobalKey<FormState>? formFieldKey;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final TextStyle? style;
  final bool obscureText;
  final String labelText;
  final String? data;
  final String hintText;
  final bool readOnly;
  final Icon? suffixIcon;
  final Function? onSuffixIconClick;
  final FontWeight fontWeight;
  final double fontSize;
  final double textFontSize;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? maxLength;
  final bool isMandatory;
  // final bool isTextVisible;
  final bool autoFocus;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? hintColor;

  const MaterialTextFormFieldWidget({
    Key? key,
    required this.context,
    this.formFieldKey,
    this.textEditingController,
    this.initialValue,
    this.style,
    this.obscureText = false,
    this.labelText = "",
    this.data = "",
    this.hintText = "",
    this.readOnly = false,
    this.suffixIcon,
    this.onSuffixIconClick,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 20,
    this.textFontSize = 25,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.isMandatory = false,
    // this.isTextVisible = false,
    this.autoFocus = false,
    this.onChanged,
    this.onSubmit,
    this.inputFormatter,
    this.onTap,
    this.contentPadding,
    this.focusNode,
    this.borderColor,
    this.hintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: formFieldKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            maxLength: maxLength,
            focusNode: focusNode,
            onFieldSubmitted: onSubmit,
            autofocus: autoFocus,
            cursorColor: AppColors.blackColor,
            inputFormatters: inputFormatter,
            controller: textEditingController,
            initialValue: initialValue,
            readOnly: readOnly,
            onChanged: onChanged,
            maxLines: maxLines,
            obscureText: obscureText,
            textAlignVertical: TextAlignVertical.center,
            cursorWidth: 1,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              isDense: true,
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: TextStyle(
                fontFamily: 'Kumbh Sans',
                color: hintColor ?? AppColors.blackColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 2,
                  color: borderColor ?? AppColors.dividerColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 2,
                  color: borderColor ?? AppColors.dividerColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 2,
                  color: AppColors.grayColor,
                ),
              ),
              label: TextWidget(
                context: context,
                text: labelText,
                fontSize: fontSize,
              ),
              errorStyle: TextStyle(
                fontFamily: 'Kumbh Sans',
                color: Theme.of(context).errorColor,
                fontWeight: FontWeight.normal,
                fontSize: fontSize,
              ),
            ),
            style: TextStyle(
              fontFamily: 'Kumbh Sans',
              color: readOnly ? AppColors.whiteColor : AppColors.blackColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
