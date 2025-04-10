// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:unity_labs/views/reports/report_view/report_view_controller.dart';

// import '../../../themes/theme_text.dart';

// class ReportContainer extends StatelessWidget {
//   final int id;
//   final String tankName;
//   final DateTime createdAt;
//   //final Map<String, dynamic> status;
//   final Map<String, dynamic> resultdata;
//   final String cultureType;
//   final labReportImage;
//   final labLogo;
//   //final String labReport;
//   final ReportType currentReportType;
//   const ReportContainer({
//     super.key,
//     required this.id,
//     required this.currentReportType,
//     required this.tankName,
//     required this.createdAt,
//     //required this.status,
//     required this.labReportImage,
//     required this.labLogo,
//     required this.cultureType,
//     required this.resultdata,
//     //required this.labReport,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       child: ListView(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         children: [
//           // Text("ID: $id",
//           //     style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8.0),
//           if (labLogo.isNotEmpty || labReportImage.isNotEmpty)
//             Container(
//               margin: const EdgeInsets.only(bottom: 16.0),
//               child: Column(
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(labReportImage),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 16.0,
//                         bottom: 16.0,
//                         child: Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(width: 2, color: Colors.black),
//                             image: DecorationImage(
//                               image: NetworkImage(labLogo),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(color: Colors.black),
//                 ],
//               ),
//             ),
//           Text(
//             "Tank Name: $tankName",
//             style: ThemeText.headlineOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "Culture Type: $cultureType",
//             style: ThemeText.bodyOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "Created At: ${DateFormat('MMM dd yyyy').format(createdAt)}",
//             style: ThemeText.bodyOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "Result:",
//             style: ThemeText.bodyBoldOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           EachTable(currentReportType, resultdata),
//           const SizedBox(height: 8.0),
//           Container(
//             width: double.infinity,
//             margin: const EdgeInsets.only(top: 16.0),
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.indigo[700],
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(8),
//                     ),
//                   ),
//                   width: double.infinity,
//                   child: Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text(
//                       "Suggestions",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(8),
//                     ),
//                   ),
//                   width: double.infinity,
//                   child: Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text(
//                       resultdata['suggestion'],
//                       style: TextStyle(color: Colors.black, fontSize: 16),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
          
//           SizedBox(
//             height: 10,
//           ),
//           // Text(
//           //   "Status:",
//           //   style: ThemeText.bodyBoldOne.copyWith(color: Colors.black),
//           // ),
//           const SizedBox(height: 8.0),
//         ],
//       ),
//     );
//   }

//   Table EachTable(ReportType currentReportType, resultdata) {
//     List<dynamic> resultwater = [
//       [
//         "pH",
//         "7.5-8.5",
//       ],
//       [
//         "Temperature",
//         "26-32 °C",
//       ],
//       [
//         "Salinity",
//         "0 PPT",
//       ],
//       [
//         "Carbonates (CO3)",
//         "20-40 PPM",
//       ],
//       [
//         "Bicarbonates (HCO3)",
//         "150-400 PPM",
//       ],
//       [
//         "Total Alkanility",
//         "150-500 PPM",
//       ],
//       [
//         "Total Hardness",
//         "150-300 PPM",
//       ],
//       [
//         "Calcium (Ca)",
//         ">100 PPM",
//       ],
//       [
//         "Magnesium (Mg)",
//         ">200 PPM",
//       ],
//       [
//         "Potassium (K)",
//         ">100 PPM",
//       ],
//       [
//         "Iron (Fe)",
//         "<1 PPM",
//       ],
//       [
//         "Sodium (Na)",
//         ">1500 PPM",
//       ],
//       [
//         "Chlorine (Cl2)",
//         "0 PPM",
//       ],
//       [
//         "Total Ammonia (TAN)",
//         "< 0.5 PPM",
//       ],
//       [
//         "Un-Ionized Ammonia (NH3)",
//         "< 0.1 PPM",
//       ],
//       [
//         "Nitrite (NO2)",
//         "< 0.25 PPM",
//       ],
//       [
//         "Hydrozen Sulphide (H2S)",
//         "< 0.01 PPM",
//       ],
//       [
//         "Carbon Dioxide (CO2)",
//         "< 10 PM  ",
//       ],
//       [
//         "Dissolved Oxygen (D.O)",
//         ">4 PPM ",
//       ],
//       [
//         "Electrical Conductivity (E.C.)",
//         "200-1000 µS/cm",
//       ],
//       [
//         "Total Dissolved Solids (T.D.S.)",
//         "10-600 mg/Ltr",
//       ],
//     ];
//     List<dynamic> resultfish = [
//       [
//         'Fish Details',
//       ],
//       ['Body Colour'],
//       ['Body Texture'],
//       ['Mucus'],
//       ['Eyes'],
//       ['Fins Colour'],
//       ['Gills'],
//       ['Intestines'],
//       ['Internal Blood Lumps'],
//       ['Liver'],
//       ['Gut'],
//       ['Gall Bladder'],
//       ['Red Disease'],
//       ['Ulcerative Dropsy'],
//       ['Abdominal Dropsy'],
//       ['Body Columnaris'],
//       ['Gill Columnaris'],
//       ['Epizootic UlcerativeSyndrome'],
//       ['Dactylogyrus'],
//       ['Gyrodactylus'],
//       ['Trichodina'],
//       ['Myxobolus'],
//       ['Anchor Worm Or Lernaea'],
//       ['Argulus'],
//       ['Fin Rot Or Tailrot'],
//       [
//         'Hemorrhagic Septicemia',
//       ],
//       [
//         'diagnosed Problem And Disease',
//       ]
//     ];
//     List<dynamic> shrimp = [
//       ['External Abnormal Color'],
//       ['External Lesion Ulcers'],
//       ['External Excessive Mucus'],
//       ['External Malformations'],
//       ['Gills Discoloration'],
//       ['Gills Parasites'],
//       ['Hepatopancreas Discoloration'],
//       ['Hepatopancreas Enlargement'],
//       ['Stomach Foreign Material'],
//       ['Stomach Abnormalities'],
//       ['Reproductive Abnormalities'],
//       ['Intestine Blockages'],
//       ['Intestine Parasites'],
//       ['Muscle Tissue Discoloration'],
//       ['Muscle Tissue Lesions'],
//       ['Nervous System Abnormalities'],
//       ['General Behavior Weakness or Lethargy'],
//       ['General Behavior Reduced Feeding'],
//       ['Specific Disease White Spot Syndrome Virus'],
//       ['Specific Disease Infectious Hypodermal Virus'],
//       ['Specific Disease Running Mortality Syndrome'],
//       ['Specific Disease Taura Syndrome Virus'],
//       ['Specific Disease Yellow Head Virus'],
//       ['Specific Disease Early Mortality Syndrome'],
//       ['Specific Disease Vibrio Infections'],
//       ['Specific Disease Aeromonas Infections'],
//       ['Specific Disease EHP'],
//       ['Specific Disease Fungi and Bacteria'],
//       ['External Body Cramps'],
//       ['External Tail Root'],
//       ['External Vibrio'],
//       ['Gills Black Gills'],
//       ['Gills Brown Gills'],
//       ['Hepatopancreas Shrinked'],
//       ['Intestine Fluids'],
//       ['Intestine White Gut'],
//       ['Intestine White Fecus'],
//       ['Muscle Tissue White Muscle'],
//       ['Diagnosed Problem and Disease'],
//     ];
//     List<dynamic> resultSoilData = [
//       ['Soil Type'],
//       ['Soil Nature'],
//       ['Soil pH'],
//       ['Organic Carbon'],
//       ['Available Nitrogen'],
//       ['Phosphorus'],
//       ['Potash'],
//       ['Sulphur'],
//       ['Zinc'],
//       ['Iron'],
//       ['Boron'],
//       ['Lime Test'],
//     ];
//     List<dynamic> resultPCRlData = [
//       ['White Spots (WSSV) '],
//       ['Enterocytozoon (EHP)'],
//       ['IHHNV'],
//       ['EMS'],
//       ['IMNV'],
//       ['V.Harvey'],
//       ['V.Parahaemolyticus'],
//     ];
//     List<dynamic> resultFeed = [
//       ['Fat '],
//       ['Protein'],
//       ['Mositure'],
//       ['Ash'],
//       ['Fiber'],
//     ];
//     List<dynamic> resultCluter = [
//       ['Yellow Colonies '],
//       ['Green Colonies'],
//     ];
//     List<dynamic> result = resultdata.entries
//         .map((entry) => [entry.key, entry.value.toString()])
//         .toList();

//     if (currentReportType == ReportType.water) {
//       final data = List<List<dynamic>>.generate(
//         resultwater.length,
//         (index) => <dynamic>[
//           resultwater[index][0],
//           resultwater[index][1],
//           result[index][1],
//         ],
//       );
//       final tableHeaders = ['Parameter', 'Optimum Level', 'Observation'];

//       return Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(1.5),
//           2: FlexColumnWidth(0.8),
//         },
//         children: [
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.indigo[700],
//             ),
//             children: tableHeaders.map((header) {
//               return TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     header,
//                     style: ThemeText.bodyThree.copyWith(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           ...data.map((row) {
//             return TableRow(
//               children: row.map((cellData) {
//                 return TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cellData.toString(),
//                       style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//         ],
//       );
//     } else if (currentReportType == ReportType.fish) {
//       final data = List<List<dynamic>>.generate(
//         resultfish.length,
//         (index) => <dynamic>[
//           resultfish[index][0],
//           result[index][1],
//         ],
//       );
//       final tableHeaders = ['Parameter', 'Observation'];

//       return Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(1.5),
//           // 2: FlexColumnWidth(0.8),
//         },
//         children: [
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.indigo[700],
//             ),
//             children: tableHeaders.map((header) {
//               return TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     header,
//                     style: ThemeText.bodyThree.copyWith(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           ...data.map((row) {
//             return TableRow(
//               children: row.map((cellData) {
//                 return TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cellData.toString(),
//                       style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//         ],
//       );
//     } else if (currentReportType == ReportType.feed) {
//       final data = List<List<dynamic>>.generate(
//         resultFeed.length,
//         (index) => <dynamic>[
//           resultFeed[index][0],
//           double.tryParse(result[index][1].toString())?.toInt().toString() ??
//               result[index][1].toString()
//         ],
//       );
//       final tableHeaders = ['Parameter', 'Observation'];

//       return Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(1.5),
//         },
//         children: [
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.indigo[700],
//             ),
//             children: tableHeaders.map((header) {
//               return TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     header,
//                     style: ThemeText.bodyThree.copyWith(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           ...data.map((row) {
//             return TableRow(
//               children: row.map((cellData) {
//                 return TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cellData.toString(),
//                       style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//         ],
//       );
//     } else if (currentReportType == ReportType.soil) {
//       final data = List<List<dynamic>>.generate(
//         resultSoilData.length,
//         (index) => <dynamic>[
//           resultSoilData[index][0],
//           result[index][1],
//         ],
//       );
//       final tableHeaders = ['Parameter', 'Observation'];

//       return Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(1.5),
//         },
//         children: [
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.indigo[700],
//             ),
//             children: tableHeaders.map((header) {
//               return TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     header,
//                     style: ThemeText.bodyThree.copyWith(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           ...data.map((row) {
//             return TableRow(
//               children: row.map((cellData) {
//                 return TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cellData.toString(),
//                       style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//         ],
//       );
//     } else if (currentReportType == ReportType.pcr) {
//       final data = List<List<dynamic>>.generate(
//         7,
//         (index) => <dynamic>[
//           resultPCRlData[index][0],
//           result[index][1],
//           result[7 + index][1],
//         ],
//       );

//       final tableHeaders = ['Parameter', 'Result', 'CT Value'];

//       return Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(1.3),
//           2: FlexColumnWidth(0.8),
//         },
//         children: [
//           // Header Row
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.indigo[700],
//             ),
//             children: tableHeaders.map((header) {
//               return TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     header,
//                     style: ThemeText.bodyThree.copyWith(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           // Data Rows
//           ...data.map((row) {
//             return TableRow(
//               children: row.map((cellData) {
//                 return TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cellData.toString(),
//                       style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//           // Footer Row (spanning two columns)
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//             ),
//             children: [
//               TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     result[15][0].toString(),
//                     style: ThemeText.bodyOne_50.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               TableCell(
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     result[15][1].toString(),
//                     style: ThemeText.bodyOne_50.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               // Empty cell to span the footer across two columns only
//               TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     '',
//                     style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//     } else if (currentReportType == ReportType.shrimp) {
//       final data = List<List<dynamic>>.generate(
//         // shrimp.length,
//         29,
//         (index) => <dynamic>[
//           shrimp[index][0],
//           result[index][1],
//         ],
//       );
//       final tableHeaders = ['Parameter', 'Observation '];
//       return Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(0.8),
//         },
//         children: [
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.indigo[700],
//             ),
//             children: tableHeaders.map((header) {
//               return TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     header,
//                     style: ThemeText.bodyThree.copyWith(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           ...data.map((row) {
//             return TableRow(
//               children: row.map((cellData) {
//                 return TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cellData.toString(),
//                       style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//         ],
//       );
//     } else if (currentReportType == ReportType.culture) {
//       final data = List<List<dynamic>>.generate(
//         resultCluter.length,
//         (index) => <dynamic>[
//           resultCluter[index][0],
//           result[index][1],
//         ],
//       );
//       final tableHeaders = ['Parameter', 'Observation'];

//       return Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: {
//           0: FlexColumnWidth(2),
//           1: FlexColumnWidth(1.5),
//         },
//         children: [
//           TableRow(
//             decoration: BoxDecoration(
//               color: Colors.indigo[700],
//             ),
//             children: tableHeaders.map((header) {
//               return TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Text(
//                     header,
//                     style: ThemeText.bodyThree.copyWith(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//           ...data.map((row) {
//             return TableRow(
//               children: row.map((cellData) {
//                 return TableCell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       cellData.toString(),
//                       style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                     ),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//         ],
//       );
//     }
//     return Table(
//       columnWidths: {
//         0: FlexColumnWidth(2),
//         1: FlexColumnWidth(1),
//       },
//       border: TableBorder.all(color: Colors.black),
//       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//       children: [
//         Header(),
//         for (var entry in resultdata.entries)
//           TableRow(
//             children: [
//               TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     entry.key.toString(),
//                     style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                   ),
//                 ),
//               ),
//               TableCell(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     entry.value.toString(),
//                     style: ThemeText.bodyOne_50.copyWith(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//       ],
//     );
//   }

//   TableRow Header() {
//     return TableRow(
//         decoration: BoxDecoration(
//           color: Colors.indigo[700],
//         ),
//         children: [
//           TableCell(
//               child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Parameter",
//               style: ThemeText.bodyOne_50
//                   .copyWith(color: Colors.white, fontSize: 12),
//             ),
//           )),
//           TableCell(
//               child: Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: Expanded(
//               child: Text(
//                 "Observation",
//                 style: ThemeText.bodyOne_50
//                     .copyWith(color: Colors.white, fontSize: 12),
//               ),
//             ),
//           )),
//         ]);
//   }
// }
