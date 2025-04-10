// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:unity_labs/themes/theme_text.dart';



// class CompletedReportContainer extends StatelessWidget {
//   final int id;
//   final String tankName;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   //final Map<String, dynamic> status;
//   final Map<String, dynamic> resultdata;
//   final String cultureType;
//   final suggestion;
//   final labReportImage;
//   final labLogo;
//   //final String labReport;

//   const CompletedReportContainer({
//     super.key,
//     required this.id,
//     required this.tankName,
//     required this.createdAt,
//     required this.updatedAt,
//     //required this.status,
//     required this.labReportImage,
//     required this.labLogo,
//     required this.cultureType,
//     required this.resultdata,
//     required this.suggestion,
//     //required this.labReport,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ListView(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         children: [
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
//                   const Divider(
//                       color: Colors.black), // Horizontal Line Separator
//                 ],
//               ),
//             ),
//           Text(
//             "Tank Name: $tankName",
//             style: ThemeText.headlineOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "culture Type: $cultureType",
//             style: ThemeText.bodyOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "Created At: ${DateFormat('MMM dd yyyy').format(createdAt)}",
//             style: ThemeText.bodyOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "Last Updated At: ${DateFormat('MMM dd yyyy').format(updatedAt)}",
//             style: ThemeText.bodyOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             "Result:",
//             style: ThemeText.bodyBoldOne.copyWith(color: Colors.black),
//           ),
//           const SizedBox(height: 8.0),
//           Table(
//             columnWidths: const {
//               0: FlexColumnWidth(1),
//               1: FlexColumnWidth(2),
//             },
//             border: TableBorder.all(color: Colors.black),
//             defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//             children: [
//               for (var entry in resultdata.entries)
//                 TableRow(
//                   children: [
//                     TableCell(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           entry.key.toString(),
//                           style: ThemeText.bodyOne_50
//                               .copyWith(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     TableCell(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           entry.value.toString(),
//                           style: ThemeText.bodyOne_50
//                               .copyWith(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Suggestion:",
//                 style: ThemeText.bodyBoldOne.copyWith(color: Colors.black),
               
//               ),
//               Text(
//                 "$suggestion",
//                 style: ThemeText.bodyOne.copyWith(color: Colors.black),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//           const SizedBox(height: 8.0),
//         ],
        
//       ),
//     );
//   }
// }
