import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.context,
    required this.text,
    this.color,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w600,
    this.textOverflow,
    bool? SoftWrap,
    double? letterSpacing,
    this.maxline,
  });

  final String text;
  final BuildContext context;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxline,
    );
  }
}
