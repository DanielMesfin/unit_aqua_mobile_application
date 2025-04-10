
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/themes/custom_colors.dart';

class LogImage extends StatelessWidget {
  const LogImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
        ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:  CircleAvatar(
          radius: 50, 
          backgroundImage: AssetImage("assets/images/logo.jpg"),
        ),
        ),
      );
  }
}
