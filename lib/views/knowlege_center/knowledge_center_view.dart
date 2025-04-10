import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';

class KnowledgeCenterView extends StatelessWidget {
  const KnowledgeCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Knowledge Center",
            style: ThemeText.headlineOne.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            options(
              icon: Iconsax.paperclip,
              title: "News",
              onPressed: () => Get.toNamed(Routes.news),
            ),
            const SizedBox(height: 20),
            options(
              icon: Iconsax.book,
              title: "Books",
              onPressed: () => Get.toNamed(Routes.book),
            ),
            const SizedBox(height: 20),
            options(
              icon: Iconsax.video,
              title: "Videos",
              onPressed: () => Get.toNamed(Routes.videos),
            ),
            const SizedBox(height: 20),
            options(
              icon: Iconsax.activity,
              title: "Forum",
              onPressed: () => Get.toNamed(Routes.forum),
            ),
          ],
        ),
      ),
    );
  }

  Widget options({
    required IconData icon,
    required String title,
    required Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: WidgetHelpers.allRoundedRectangle(
          color: CustomColors.greyScale5,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: CustomColors.primaryColor,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: ThemeText.bodyOne,
            )
          ],
        ),
      ),
    );
  }
}
