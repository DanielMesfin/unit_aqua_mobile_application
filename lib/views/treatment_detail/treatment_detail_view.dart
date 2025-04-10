import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';

import '../../widgets/primary_button.dart';
import 'treatment_detail_controller.dart';

class TreatmentDetailView extends GetView<TreatmentDetailController> {
  const TreatmentDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          controller.treatment.name ?? "",
          style: ThemeText.headlineThree
              .copyWith(color: ConstantColors.appBarTextColor),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              controller.treatment.description ?? "",
              style: ThemeText.bodyOne,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(
              "Images",
              style: ThemeText.bodyBoldOne,
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, i) => WidgetHelpers.clipRRectWithImage(
                imageUrl: controller.treatment.imgUrls[i],
                imageWidth: Get.width,
                imageHeight: 150,
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemCount: controller.treatment.imgUrls.length,
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
      bottomNavigationBar: controller.type == 'global'
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: PrimaryButton(
                hasLoading: true,
                isLoading: controller.isButtonLoading,
                width: 150,
                label: "Import to my Treatment",
                onPressed: () => controller.importTreatment(),
              ),
            )
          : null,
    );
  }
}
