import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/model/book/book_model.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/book/read_book_view.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  const BookCard({
    required this.book,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    inspect(book);
    return InkWell(
      onTap: () => Get.to(() => ReadBookView(url: book.url ?? "", title : book.title ?? "")),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: WidgetHelpers.allRoundedRectangle(
          color: Colors.grey[300]!,
          borderRadius: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Expanded(
              child: WidgetHelpers.clipRRectWithImage(
                onTap: () => Get.to(() => ReadBookView(url: book.url ?? "", title : book.title ?? "")),
                borderRadius: 0,
                imageUrl: book.thumbnailUrl ?? "",
                // imageHeight: Get.height * 0.22,
                // imageWidth: double.infinity * .7,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              book.title ?? "",
              style: ThemeText.bodyBoldOne,
            ),
          ],
        ),
      ),
    );
  }
}
