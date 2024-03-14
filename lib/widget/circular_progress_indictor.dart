import 'package:basic_intigration/widget/sized_box.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CircularProgressIndicatorWidget extends GetResponsiveView {
  CircularProgressIndicatorWidget({
    Key? key,
    required this.context,
    this.size = 30,
    this.strokeWidth = 2,
    this.color,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final BuildContext context;
  final double size;
  final double strokeWidth;
  final Color? color;
  final Alignment alignment;

  @override
  Widget? builder() {
    return Align(
      alignment: alignment,
      child: SizedBoxWidget(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
