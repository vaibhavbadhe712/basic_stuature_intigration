import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_utils/app_utils.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    Key? key,
    required this.context,
    required this.data,
    this.width = 12,
    this.height = 12,
    this.color,
    this.onClick,
  }) : super(key: key);
  final BuildContext context;
  final String data;
  final double width;
  final double height;
  final Color? color;
  final Function? onClick;
  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.onClick != null
        ? InkWell(
            onTap: () {
              widget.onClick!();
            },
            child: _iconWidget(),
          )
        : _iconWidget();
  }

  _iconWidget() {
    return Container(
      width: AppSizes.getPhoneSize(context, 24),
      height: AppSizes.getPhoneSize(context, 24),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        fetchIconFromAsset(widget.data),
        width: AppSizes.getPhoneSize(context, widget.width),
        height: AppSizes.getPhoneSize(context, widget.height),
        // ignore: deprecated_member_use
        color: widget.color ?? Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}
