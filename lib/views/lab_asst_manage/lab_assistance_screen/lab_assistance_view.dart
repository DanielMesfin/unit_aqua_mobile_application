import 'package:flutter/material.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';

class LabAssistanceView extends StatelessWidget {
  const LabAssistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 35,
              child: Text("Lab Name",
                  style: ThemeText.bodyOne
                      .copyWith(color: Colors.grey, fontSize: 25)),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              options(
                title: 'Farmer Registration',
                onPressed: () => Get.toNamed(Routes.farmer),
              ),
              const SizedBox(
                height: 30,
              ),
              options(
                title: 'Tests Pending',
                onPressed: () => Get.toNamed(Routes.testPending),
              ),
              // const SizedBox(
              //   height: 100,
              // ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget options({required String title, required Function() onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: WidgetHelpers.allRoundedRectangle(
          color: CustomColors.primaryColor,
        ),
        width: Get.width,
        height: 180,
        child: Center(
          child: Text(
            title,
            style: ThemeText.headlineOne.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
