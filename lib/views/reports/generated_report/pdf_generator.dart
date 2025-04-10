import 'dart:io';
import 'dart:typed_data';
import 'package:intl/intl.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;


Future<Uint8List> fetchImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}

Future<Uint8List> generatePdf({
  required int id,
  required String tankName,
  required DateTime createdAt,
  // required Map<String, dynamic> status,
  required Map<String, dynamic> resultdata,
  required String labReportImage,
  required String labLogo,
  required String cultureType,
}) async {
  final reportImageBytes = await fetchImage(labReportImage);
  final logoImageBytes = await fetchImage(labLogo);

  final pdfBytes = await generatePdfWithImages(
    id: id,
    tankName: tankName,
    createdAt: createdAt,
    //status: status,
    resultdata: resultdata,
    labReportImageBytes: reportImageBytes,
    labLogoBytes: logoImageBytes,
    cultureType: cultureType,
  );

  return pdfBytes;
}

Future<Uint8List> generatePdfWithImages({
  required int id,
  required String tankName,
  required DateTime createdAt,
  //required Map<String, dynamic> status,
  required Map<String, dynamic> resultdata,
  required Uint8List labReportImageBytes,
  required Uint8List labLogoBytes,
  required String cultureType,
}) async {
  final pdf = pw.Document();

  final reportImage = pw.MemoryImage(labReportImageBytes);
  final logoImage = pw.MemoryImage(labLogoBytes);

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: double.infinity,
              height: 150.0,
              decoration: pw.BoxDecoration(
                image: pw.DecorationImage(
                  image: reportImage,
                  fit: pw.BoxFit.fill,
                ),
              ),
            ),

            pw.Divider(),
            pw.Text('Tank Name: $tankName', style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 8),
            pw.Text('Culture Type: $cultureType',
                style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 8),
            pw.Text(
              'Created At: ${DateFormat('MMM dd yyyy').format(createdAt)}',
              style: pw.TextStyle(fontSize: 18),
            ),
            pw.SizedBox(height: 8),
            pw.Text(
              'Result:',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            //pw.SizedBox(height: 8),
            pw.Table.fromTextArray(
              cellStyle: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
                color: PdfColors.black,
              ),
              border: pw.TableBorder.all(width: 1, color: PdfColors.black),
              headerCount: 1,
              cellAlignment: pw.Alignment.topLeft,
              headerAlignment: pw.Alignment.topLeft,
              data: resultdata.entries
                  .map((entry) => [entry.key, entry.value.toString()])
                  .toList(),
            ),

            pw.SizedBox(height: 8),
          ],
        );
      },
    ),
  );

  return pdf.save();
}

Future<String> savePdfToLocalStorage(Uint8List pdfBytes) async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String filePath = '${appDocDir.path}/Unity_aqua_generated_report.pdf';
  final File file = File(filePath);

  await file.writeAsBytes(pdfBytes);

  return filePath;
}
