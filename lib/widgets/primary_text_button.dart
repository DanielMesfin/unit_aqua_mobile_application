import 'package:flutter/material.dart';
import '../common/constants/size_constants.dart';
import '../themes/theme_text.dart';

class PrimaryTextButton extends StatefulWidget {
  const PrimaryTextButton({
    super.key,
    this.width = Sizes.dimen_100,
    this.height = Sizes.dimen_45,
    required this.label,
    required this.onPressed,
    this.disabled = false,
  });
  final double height;
  final double width;
  final String label;
  final bool disabled;
  final Function() onPressed;

  @override
  _PrimaryTextButtonState createState() => _PrimaryTextButtonState();
}

class _PrimaryTextButtonState extends State<PrimaryTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.label,
        style:
            widget.disabled ? ThemeText.bodyOne_50 : ThemeText.bodyPrimaryOne,
      ),
    );
  }
}
