import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/custom_colors.dart';
import '../themes/theme_text.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.hintText,
    this.width = 0,
  });

  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? Function(T?)? validator;
  final String? hintText;
  final double width;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    final fieldWidth = width == 0 ? Get.width : width;

    return Container(
      width: fieldWidth,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff2f2f2),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: ThemeText.bodyOne_50,
          errorStyle:
              ThemeText.bodyThree.copyWith(color: CustomColors.errorColor),
        ),
        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((DropdownMenuItem<T> item) {
            return Text(
              item.value.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            );
          }).toList();
        },
        icon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
