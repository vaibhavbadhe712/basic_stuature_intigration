
import 'package:basic_intigration/constant/app_sizes.dart';
import 'package:basic_intigration/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidget<T> extends StatefulWidget {
  final List<T> items;
  final T selectedItem;
  final ValueChanged<T> onChanged;

  CustomDropdownWidget({
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  _CustomDropdownWidgetState<T> createState() =>
      _CustomDropdownWidgetState<T>();
}

class _CustomDropdownWidgetState<T> extends State<CustomDropdownWidget<T>> {
  late T _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: AppSizes.getPhoneSize(context, 20)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            icon: SizedBox.shrink(),
            value: _selectedItem,
            items: widget.items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: TextWidget(
                  context: context,
                  text: item.toString(),
                  fontSize: AppSizes.getPhoneSize(context, 16),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
                widget.onChanged(value);
              });
            },
          ),
        ),
      ),
    );
  }
}
