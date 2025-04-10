import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unity_labs/themes/custom_colors.dart';

import '../common/constants/size_constants.dart';
import '../themes/theme_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.validator,
    this.onSuffixButtonTap,
    this.suffixIcon,
    this.suffix,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLength,
    this.minmLength,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.name,
    this.inputAction = TextInputAction.done,
    this.height = Sizes.dimen_40,
    this.width = 0,
    this.borderRadius = 12,
    this.initialValue,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.onEditingComplete,
    this.autoFillHints,
    this.enabled = true,
    this.prefixText,
    this.autoFocus = false,
    this.focusNode,
  });
  final TextInputAction inputAction;
  final String? initialValue;
  final int? maxLength;
  final int? minmLength;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onSuffixButtonTap;
  final String labelText;
  final String? hintText;
  final String? prefixText;
  final IconData? suffixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final double height;
  final double width;
  final double borderRadius;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final List<String>? autoFillHints;
  final bool autoFocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    if (suffixIcon != null) {
      assert(suffix == null, "you can't use both suffix and suffixIcon");
    }
    if (suffix != null) {
      assert(suffixIcon == null, "you can't use both suffix and suffixIcon");
    }
    final fieldWidth = width == 0 ? Get.width : width;
    return Container(
      // height: height,
      width: fieldWidth,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        cursorColor: Colors.black,
        focusNode: focusNode,

        autofocus: autoFocus,
        autofillHints: autoFillHints,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // style: ThemeText.blackBookSubtitle_1_16F_50Opacity,
        controller: controller,
        keyboardType: keyboardType,
        onSaved: onSaved,
        readOnly: readOnly,
        enabled: enabled,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        maxLength: maxLength,
        textInputAction: inputAction,
        minLines: keyboardType == TextInputType.multiline ? 3 : 1,
        maxLines: keyboardType == TextInputType.multiline ? 5 : 1,
        validator: validator,
        obscureText: obscureText,
        initialValue: initialValue,
        decoration: InputDecoration(
          prefixText: prefixText,
          filled: true,
          fillColor: const Color(0xfff2f2f2),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: ThemeText.bodyOne_50,
          errorStyle:
              ThemeText.bodyThree.copyWith(color: CustomColors.errorColor),
          suffixIcon: suffix ??
              IconButton(
                icon: Icon(suffixIcon),
                color: Colors.grey,
                onPressed: onSuffixButtonTap,
              ),
        ),
      ),
    );
  }
}
