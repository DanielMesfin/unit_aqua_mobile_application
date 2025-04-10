import 'package:flutter/material.dart';

import '../themes/theme_text.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget.bodyBoldOne(
    this.title, {
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyBoldOne;
  CustomTextWidget.bodyBoldTwo(
    this.title, {
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyBoldTwo;
  CustomTextWidget.bodyBoldWhiteTwo(
    this.title, {
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyBoldWhiteTwo;
  const CustomTextWidget(
    this.title, {
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    required this.style,
    super.key,
  });
  CustomTextWidget.bodyTwo(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyTwo;
  CustomTextWidget.bodyThreeItalic(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyThreeItalic;
  CustomTextWidget.headlineThree(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.headlineThree;
  CustomTextWidget.headlineFour(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.headlineFour;
  CustomTextWidget.bodyOne(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyOne.copyWith(letterSpacing: letterSpacing);
  CustomTextWidget.bodyWhiteOne(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyWhiteOne;
  CustomTextWidget.headlinePrimaryOne(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.headlinePrimaryOne;
  CustomTextWidget.headlineTwo(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.headlineTwo;
  CustomTextWidget.headlineOne(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.headlineOne;
  CustomTextWidget.bodyPrimaryOne(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyPrimaryOne;
  CustomTextWidget.bodyOne_50(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyOne_50;
  CustomTextWidget.bodyThree(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyThree;
  CustomTextWidget.bodyGreyLineThrough(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyGreyLineThrough;
  CustomTextWidget.bodyPrimaryColorLineThrough(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyPrimaryColorLineThrough;
  CustomTextWidget.bodyPrimaryTwo(
    this.title, {
    this.maxLines = 2,
    this.textAlign,
    this.textOverflow,
    this.letterSpacing,
    super.key,
  })  : style = ThemeText.bodyPrimaryTwo;
  final String? title;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final double? letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
    );
  }
}
