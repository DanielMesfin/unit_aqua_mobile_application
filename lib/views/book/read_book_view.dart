import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:unity_labs/common/constants/colors.dart';

class ReadBookView extends StatelessWidget {
  final String url;
  final String title;
  const ReadBookView({required this.url, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ConstantColors.appBarBackgroundColor,
        title: Text(
          title,
          style: TextStyle(color: ConstantColors.appBarTextColor),
        ),
      ),
      body: SfPdfViewer.network(
        url,
      ),
    );
  }
}
