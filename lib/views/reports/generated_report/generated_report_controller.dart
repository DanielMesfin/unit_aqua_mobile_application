import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;
//import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class GeneratedReportController extends GetxController {
  final selectedOption = 'Pdf'.obs;
  final TextEditingController phoneNumberController = TextEditingController();
  //final isLoading = true.obs;

  final int id = Get.arguments['id'];
  final String tankName = Get.arguments['tankName'];
  final DateTime createdAt = Get.arguments['createdAt'];
  //final Map<String, dynamic> status = Get.arguments['status'];
  final String farmerName = Get.arguments['farmer'] ?? "Default";
  final labReportImage = Get.arguments['labReportImage'];
  final labLogo = Get.arguments['labLogo'];
  final cultureType = Get.arguments['cultureType'];
  final resultdata = Get.arguments['resultdata'];
  final String suggetions = Get.arguments['suggetions'];

  @override
  void onInit() {
    super.onInit();
    id;
    tankName;
    createdAt;
    //status;
    suggetions;
    resultdata;
    farmerName;
  }

  Future<Uint8List?> captureWidgetToPng(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 1.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData!.buffer.asUint8List();

      await savePngToLocalStorage(pngBytes); // Save the PNG file

      return pngBytes;
    } catch (e) {
      return null;
    }
  }

  Future<File?> savePngToLocalStorage(Uint8List pngBytes) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      File file = File("${appDocDir.path}/captured_widget_new.png");
      await file.writeAsBytes(pngBytes);

      return file;
    } catch (e) {
      return null;
    }
  }

  Future<void> shareCapturedImage(Uint8List? imageBytes) async {
    try {
      // if (imageBytes != null) {
      //   final savedFile = await savePngToLocalStorage(imageBytes);
      //   if (savedFile != null) {
      //     //TODO heir is comment
      //     // await Share.shareXFiles([savedFile.path]);
      //   }
      if (imageBytes != null) {
        final savedFile = await savePngToLocalStorage(imageBytes);
        if (savedFile != null) {
          // Convert File path to XFile
          final XFile xFile = XFile(savedFile.path);

          // Share the XFile
          await Share.shareXFiles([xFile]);
        }
      }
    } catch (e) {
      print("Error sharing image: $e");
    }
  }

  Future<void> shareGeneratedText() async {
    try {
      String textData = '';

      final controller = Get.find<GeneratedReportController>();
      textData += "ID: ${controller.id}\n";
      textData += "Tank Name: ${controller.tankName}\n";
      textData +=
          "Created At: ${DateFormat('MMM dd yyyy').format(controller.createdAt)}\n";
      textData += "Result:\n";
      controller.resultdata.forEach((key, value) {
        textData += "$key: $value\n";
      });

      await Share.share(textData, subject: 'Generated Report');
    } catch (e) {
      print("Error sharing text: $e");
    }
  }
}
