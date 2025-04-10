import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';

import 'book_card.dart';
import 'book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Books',
              style: ThemeText.headlineThree,
            ),
            Obx(
              () => controller.isLoading.isTrue
                  ? Container()
                  : Text(
                      controller.selectedCategory == null
                          ? ''
                          : controller.selectedCategory!.value.name.toString(),
                      style: ThemeText.headlineThree,
                    ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              controller.selectedCategory = controller.categoryList
                  .firstWhere(
                    (category) => category.id.toString() == value,
                  )
                  .obs;
              controller.booksByCategory(value);
            },
            icon: const Icon(
              Icons.arrow_drop_down_circle_rounded,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              return controller.categoryList.map((category) {
                return PopupMenuItem<String>(
                  value: category.id.toString(),
                  child: Text(category.name.toString()),
                );
              }).toList();
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 20),
                child: WidgetHelpers.pagePadding(
                  child: GridView.builder(
                    itemCount: controller.bookList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .7,
                      // Utils.getChildAspectRatio(Get.height, context),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (ctx, i) => BookCard(
                      book: controller.bookList[i],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
