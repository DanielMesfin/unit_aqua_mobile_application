import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
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

Future<String> savePdfToLocalStorage(Uint8List pdfBytes,String fileName) async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String filePath = '${appDocDir.path}/$fileName.pdf';
  final File file = File(filePath);

  await file.writeAsBytes(pdfBytes);

  return filePath;
}

List<String> farmDialogs = [
  "Welcome to the farm!",
  "It's a beautiful day for farming!",
  "Don't forget to water the plants!",
  "Time to harvest the crops!",
  "Check the weather before planting!",
  "Make sure to feed the animals!",
  "Let's plant some new seeds!",
  "Keep an eye out for pests!",
  "The soil looks great today!",
  "Remember to rotate your crops!",
];
String getRandomFarmDialog() {
  final random = Random();
  int randomIndex = random.nextInt(farmDialogs.length);
  return farmDialogs[randomIndex];
}

Future<Uint8List> generateReportW(
  PdfPageFormat pageFormat,
  id,
  farmerName,
  tankName,
  createdAt,
  cultureType,
  resultdata,
  labReportImageBytes,
  labLogoBytes,
  reportType,
  plankton,
) async {
  final reportImageBytes = await fetchImage(labReportImageBytes);
  final logoImageBytes = await fetchImage(labLogoBytes);
  const tableHeadersW = ['Parameter', 'Optimum Level', 'Observation'];
  const tableHeadersF = ['Parameter', 'Observation'];
  const tableHeadersS = ['Parameter', 'Observation'];
  const useFullFarm = ['UseFul Plankton', 'Units'];
  const harmFullFarm = ['HarmFul Plankton', 'Units'];
  final tableHeaderPCT = ['Parameter', 'Result', 'CT Value'];
  List<dynamic> resultwater = [
    [
      "pH",
      "7.5-8.5",
    ],
    [
      "Temperature",
      "26-32 °C",
    ],
    [
      "Salinity",
      "0 PPT",
    ],
    [
      "Carbonates (CO3)",
      "20-40 PPM",
    ],
    [
      "Bicarbonates (HCO3)",
      "150-400 PPM",
    ],
    [
      "Total Alkanility",
      "150-500 PPM",
    ],
    [
      "Total Hardness",
      "150-300 PPM",
    ],
    [
      "Calcium (Ca)",
      ">100 PPM",
    ],
    [
      "Magnesium (Mg)",
      ">200 PPM",
    ],
    [
      "Potassium (K)",
      ">100 PPM",
    ],
    [
      "Iron (Fe)",
      "<1 PPM",
    ],
    [
      "Sodium (Na)",
      ">1500 PPM",
    ],
    [
      "Chlorine (Cl2)",
      "0 PPM",
    ],
    [
      "Total Ammonia (TAN)",
      "< 0.5 PPM",
    ],
    [
      "Un-Ionized Ammonia (NH3)",
      "< 0.1 PPM",
    ],
    [
      "Nitrite (NO2)",
      "< 0.25 PPM",
    ],
    [
      "Hydrozen Sulphide (H2S)",
      "< 0.01 PPM",
    ],
    [
      "Carbon Dioxide (CO2)",
      "< 10 PM  ",
    ],
    [
      "Dissolved Oxygen (D.O)",
      ">4 PPM ",
    ],
    [
      "Electrical Conductivity (E.C.)",
      "200-1000 µS/cm",
    ],
    [
      "Total Dissolved Solids (T.D.S.)",
      "10-600 mg/Ltr",
    ],
  ];
  List<dynamic> resultfish = [
    [
      'Fish Details',
    ],
    ['Body Colour'],
    ['Body Texture'],
    ['Mucus'],
    ['Eyes'],
    ['Fins Colour'],
    ['Gills'],
    ['Intestines'],
    ['Internal Blood Lumps'],
    ['Liver'],
    ['Gut'],
    ['Gall Bladder'],
    ['Red Disease'],
    ['Ulcerative Dropsy'],
    ['Abdominal Dropsy'],
    ['Body Columnaris'],
    ['Gill Columnaris'],
    ['Epizootic UlcerativeSyndrome'],
    ['Dactylogyrus'],
    ['Gyrodactylus'],
    ['Trichodina'],
    ['Myxobolus'],
    ['Anchor Worm Or Lernaea'],
    ['Argulus'],
    ['Fin Rot Or Tailrot'],
    [
      'Hemorrhagic Septicemia',
    ],
    ["Red Mouth"],
    ["Bactirial Gill Root"],
    ["Egg /Role Infection"],
    ["Ichthyophthirius"],
    ["Fungal Infection"],
    [
      'diagnosed Problem And Disease',
    ]
  ];
  List<dynamic> shrimp = [
    ['External Abnormal Color'],
    ['External Lesion Ulcers'],
    ['External Excessive Mucus'],
    ['External Malformations'],
    ['Gills Discoloration'],
    ['Gills Parasites'],
    ['Hepatopancreas Discoloration'],
    ['Hepatopancreas Enlargement'],
    ['Stomach Foreign Material'],
    ['Stomach Abnormalities'],
    ['Reproductive Abnormalities'],
    ['Intestine Blockages'],
    ['Intestine Parasites'],
    ['Muscle Tissue Discoloration'],
    ['Muscle Tissue Lesions'],
    ['Nervous System Abnormalities'],
    ['General Behavior Weakness or Lethargy'],
    ['General Behavior Reduced Feeding'],
    ['Specific Disease White Spot Syndrome Virus'],
    ['Specific Disease Infectious Hypodermal Virus'],
    ['Specific Disease Running Mortality Syndrome'],
    ['Specific Disease Taura Syndrome Virus'],
    ['Specific Disease Yellow Head Virus'],
    ['Specific Disease Early Mortality Syndrome'],
    ['Specific Disease Vibrio Infections'],
    ['Specific Disease Aeromonas Infections'],
    ['Specific Disease EHP'],
    ['Specific Disease Fungi and Bacteria'],
    ['External Body Cramps'],
    ['External Tail Root'],
    ['External Vibrio'],
    ['Gills Black Gills'],
    ['Gills Brown Gills'],
    ['Hepatopancreas Shrinked'],
    ['Intestine Fluids'],
    ['Intestine White Gut'],
    ['Intestine White Fecus'],
    ['Muscle Tissue White Muscle'],
    ['Diagnosed Problem and Disease'],
  ];
  List<dynamic> resultSoilData = [
    ['Soil Type'],
    ['Soil Nature'],
    ['Soil pH'],
    ['Organic Carbon'],
    ['Available Nitrogen'],
    ['Phosphorus'],
    ['Potash'],
    ['Sulphur'],
    ['Zinc'],
    ['Iron'],
    ['Boron'],
    ['Lime Test'],
  ];
  List<dynamic> resultPCRlData = [
    ['White Spots (WSSV) '],
    ['Enterocytozoon (EHP)'],
    ['IHHNV'],
    ['EMS'],
    ['IMNV'],
    ['V.Harvey'],
    ['V.Parahaemolyticus'],
  ];
  List<dynamic> resultFeed = [
    ['Fat '],
    ['Protein'],
    ['Mositure'],
    ['Ash'],
    ['Fiber'],
  ];
  List<dynamic> resultCluter = [
    ['Yellow Colonies '],
    ['Green Colonies'],
  ];
  final List<List<String>> usefulAndHarmfulFields = [
    ["Chlorella"],
    ["Oocysts"],
    ["Scenedesmus"],
    ["Eudorina"],
    ["Tetrasolmis"],
    ["Eutreptia"],
    ["Phacus"],
    ["Spriulina"],
    ["Chaetoceros"],
    ["Skeletonema"],
    ["Cyclotella"],
    ["Thalassiosira"],
    ["Copepod"],
    ["Rotifer"],
    ["Nauplius"],
    ["Noctiluca"],
    [" Ceratium"],
    [" Dinophysis"],
    ["Zoothamnium"],
    ["Favella"],
    ["Vorticella"],
    [" Gregarina"],
    ["Anabaena"],
    [" Oscillatoria"],
    [" Microcystis"],
    [" Coscinodiscus"],
    ["Nitzschia"],
    [" Navicula"],
    ["Pleurosigma"]
  ];
  List<dynamic> result = resultdata.entries
      .map((entry) => [entry.key, entry.value.toString()])
      .toList();

  final baseColor = PdfColors.indigo700;
  final document = pw.Document();
  final reportImage = pw.MemoryImage(reportImageBytes);
  final logoImage = pw.MemoryImage(logoImageBytes);
  final header = pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Stack(children: [
          pw.Container(
            width: double.infinity,
            height: 550.0,
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: reportImage,
                fit: pw.BoxFit.fill,
              ),
            ),
          ),
          pw.Positioned(
            right: 0.0,
            top: 0.0,
            child: pw.Container(
              width: 150.0,
              height: 150.0,
              decoration: pw.BoxDecoration(
                borderRadius: pw.BorderRadius.circular(12.0),
                image: pw.DecorationImage(
                  image: logoImage,
                  fit: pw.BoxFit.fill,
                ),
              ),
            ),
          )
        ]),
        pw.Divider(thickness: 4),
        pw.SizedBox(height: 8),
        pw.Text('Farmer Name:   $farmerName',
            style: pw.TextStyle(fontSize: 18)),
        pw.SizedBox(height: 8),
        pw.Text('Tank Name:   $tankName', style: pw.TextStyle(fontSize: 18)),
        pw.SizedBox(height: 8),
        pw.Text('Culture Type:   $cultureType',
            style: pw.TextStyle(fontSize: 18)),
        pw.SizedBox(height: 8),
        pw.Text(
          'Created At:   ${DateFormat('MMM dd yyyy').format(createdAt)}',
          style: pw.TextStyle(fontSize: 18),
        ),
        pw.SizedBox(height: 30),
      ]),
    ],
  );

  document.addPage(
    pw.Page(
      pageFormat: pageFormat,
      build: (context) {
        return pw.Column(
          children: [
            header,
            pw.Divider(thickness: 4),
          ],
        );
      },
    ),
  );

  if (reportType == "water") {
    final tablew = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeadersW,
      data: List<List<dynamic>>.generate(
        resultwater.length,
        (index) => <dynamic>[
          resultwater[index][0],
          resultwater[index][1],
          result[index][1],
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );

    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                "Your Result",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.Text(
                "Results are subjective to give sample only .",
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              tablew,
              pw.SizedBox(height: 10),
            ],
          );
        },
      ),
    );

    if (plankton.value != null) {
      List<dynamic> resultp = plankton
          .toJson()['result']
          .entries
          .map((entry) => [entry.key, entry.value.toString()])
          .toList();

      final tablep = pw.TableHelper.fromTextArray(
        // border: null,
        border: pw.TableBorder.all(),
        headers: useFullFarm,
        data: List<List<dynamic>>.generate(
          15,
          (index) =>
              <dynamic>[usefulAndHarmfulFields[index][0], resultp[index][1]],
        ),
        // cellStyle: pw.GoogleFonts.notoSans(),

        headerStyle: pw.TextStyle(
          color: PdfColors.white,
          fontWeight: pw.FontWeight.normal,
          fontSize: 8,
        ),
        headerDecoration: pw.BoxDecoration(
          color: baseColor,
        ),
        rowDecoration: pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(
              color: baseColor,
              width: .3,
            ),
          ),
        ),
        cellAlignment: pw.Alignment.centerLeft,
        cellAlignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.centerLeft
        },
      );
      final tableharmfull = pw.TableHelper.fromTextArray(
        border: pw.TableBorder.all(),
        headers: harmFullFarm,
        data: List<List<dynamic>>.generate(
          usefulAndHarmfulFields.length - 15,
          (index) => <dynamic>[
            usefulAndHarmfulFields[index + 15][0],
            resultp[index + 15][1]
          ],
        ),
        // cellStyle: pw.GoogleFonts.notoSans(),

        headerStyle: pw.TextStyle(
          color: PdfColors.white,
          fontWeight: pw.FontWeight.normal,
          fontSize: 8,
        ),
        headerDecoration: pw.BoxDecoration(
          color: baseColor,
        ),
        rowDecoration: pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(
              color: baseColor,
              width: .5,
            ),
          ),
        ),
        cellAlignment: pw.Alignment.centerLeft,
        cellAlignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.centerLeft
        },
      );

      document.addPage(
        pw.Page(
          pageFormat: pageFormat,
          margin: pw.EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          build: (context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                tablep,
                tableharmfull,
              ],
            );
          },
        ),
      );
    }
  } else if (reportType == "fish") {
    final tablew = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeadersF,
      data: List<List<dynamic>>.generate(
        resultfish.length,
        (index) => <dynamic>[
          resultfish[index][0],
          result[index][1],
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );

    document.addPage(
      pw.Page(
        margin: pw.EdgeInsets.symmetric(vertical: 1.5, horizontal: 40),
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                "Your Result",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.Text(
                "Results are subjective to give sample only .",
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              tablew,
            ],
          );
        },
      ),
    );
  } else if (reportType == "shrimp") {
    final tablew = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeadersF,
      data: List<List<dynamic>>.generate(
        25,
        (index) => <dynamic>[
          shrimp[index][0],
          result[index][1],
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );
    final tablesecond = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeadersF,
      data: List<List<dynamic>>.generate(
        shrimp.length - 25,
        (index) => <dynamic>[
          shrimp[index + 25][0],
          result[index + 25][1],
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );

    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                "Your Result",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.Text(
                "Results are subjective to give sample only .",
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              tablew,
            ],
          );
        },
      ),
    );
    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              tablesecond,
              pw.SizedBox(height: 10),
              // suggetionsContainer(
              //   resultdata['suggestion'],
              // ),
              // pw.Divider(thickness: 4),
              // pw.Column(
              //     mainAxisAlignment: pw.MainAxisAlignment.start,
              //     children: [
              //       pw.Text(getRandomFarmDialog(),
              //           style: pw.TextStyle(fontSize: 18)),
              //       pw.SizedBox(height: 8),
              //       pw.Text("Thank you for your hard work!",
              //           style: pw.TextStyle(fontSize: 18)),
              //     ])
            ],
          );
        },
      ),
    );
  } else if (reportType == "culture") {
    final tablew = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeadersF,
      data: List<List<dynamic>>.generate(
        resultCluter.length,
        (index) => <dynamic>[
          resultCluter[index][0],
          double.tryParse(result[index][1].toString())?.toInt().toString() ??
              result[index][1].toString()
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );

    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                "Your Result",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.Text(
                "Results are subjective to give sample only .",
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              tablew,
              // pw.SizedBox(height: 80),
              // pw.Divider(thickness: 4),
              // pw.Column(
              //     mainAxisAlignment: pw.MainAxisAlignment.start,
              //     children: [
              //       pw.Text(getRandomFarmDialog(),
              //           style: pw.TextStyle(fontSize: 18)),
              //       pw.SizedBox(height: 8),
              //       pw.Text("Thank you for your hard work!",
              //           style: pw.TextStyle(fontSize: 18)),
              //     ])
            ],
          );
        },
      ),
    );
  } else if (reportType == "pcr") {
    final tablew = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeaderPCT,
      data: List<List<dynamic>>.generate(
        7,
        (index) => <dynamic>[
          resultPCRlData[index][0],
          result[index][1],
          result[7 + index][1],
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );

    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                "Your Result",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.Text(
                "Results are subjective to give sample only .",
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              tablew,
              pw.SizedBox(height: 15),
              pw.Divider(thickness: 4),
              resultdata['remarkText'] != null
                  ? pw.Text(
                      "Remarks: ${resultdata['remarkText']}",
                    )
                  : pw.SizedBox(),
              // pw.SizedBox(height: 10),
              // pw.Divider(thickness: 4),
              // pw.Column(
              //     mainAxisAlignment: pw.MainAxisAlignment.start,
              //     children: [
              //       pw.Text(getRandomFarmDialog(),
              //           style: pw.TextStyle(fontSize: 18)),
              //       pw.SizedBox(height: 8),
              //       pw.Text("Thank you for your hard work!",
              //           style: pw.TextStyle(fontSize: 18)),
              //     ])
            ],
          );
        },
      ),
    );
  } else if (reportType == "feed") {
    final tablew = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeadersF,
      data: List<List<dynamic>>.generate(
        resultFeed.length,
        (index) => <dynamic>[
          resultFeed[index][0],
          double.tryParse(result[index][1].toString())?.toInt().toString() ??
              result[index][1].toString()
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );

    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                "Your Result",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.Text(
                "Results are subjective to give sample only .",
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              tablew,
              // pw.SizedBox(height: 50),
              // pw.Divider(thickness: 4),
              // pw.Column(
              //     mainAxisAlignment: pw.MainAxisAlignment.start,
              //     children: [
              //       pw.Text(getRandomFarmDialog(),
              //           style: pw.TextStyle(fontSize: 18)),
              //       pw.SizedBox(height: 8),
              //       pw.Text("Thank you for your hard work!",
              //           style: pw.TextStyle(fontSize: 18)),
              //     ])
            ],
          );
        },
      ),
    );
  } else if (reportType == "soil") {
    final tableS = pw.TableHelper.fromTextArray(
      border: pw.TableBorder.all(),
      headers: tableHeadersS,
      data: List<List<dynamic>>.generate(
        resultSoilData.length,
        (index) => <dynamic>[
          resultSoilData[index][0],
          result[index][1],
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: baseColor,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: baseColor,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.centerLeft,
      cellAlignments: {0: pw.Alignment.centerLeft, 1: pw.Alignment.centerLeft},
    );

    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                "Your Result",
                style: pw.TextStyle(
                  fontSize: 18,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.Text(
                "Results are subjective to give sample only .",
                style: pw.TextStyle(
                  fontSize: 12,
                ),
              ),
              tableS,
              // pw.SizedBox(height: 50),
              // pw.Divider(thickness: 4),
              // pw.Column(
              //     mainAxisAlignment: pw.MainAxisAlignment.start,
              //     children: [
              //       pw.Text(getRandomFarmDialog(),
              //           style: pw.TextStyle(fontSize: 18)),
              //       pw.SizedBox(height: 8),
              //       pw.Text("Thank you for your hard work!",
              //           style: pw.TextStyle(fontSize: 18)),
              //])
            ],
          );
        },
      ),
    );
  }
  document.addPage(
    pw.Page(
      pageFormat: pageFormat,
      build: (context) {
        return pw.Column(children: [
          suggetionsContainer(
            resultdata['suggestion'],
          ),
          pw.SizedBox(height: 50),
          pw.Divider(thickness: 4),
          pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Text(getRandomFarmDialog(), style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 8),
            pw.Text("Thank you for your hard work!",
                style: pw.TextStyle(fontSize: 18)),
          ])
        ]);
      },
    ),
  );

  return document.save();
}

suggetionsContainer(suggeton) {
  return pw.Container(
    width: double.infinity,
    margin: const pw.EdgeInsets.only(top: 16.0),
    child: pw.Column(
      children: [
        pw.Container(
          decoration: pw.BoxDecoration(
            color: PdfColors.indigo,
            borderRadius: pw.BorderRadius.all(
              pw.Radius.circular(8),
            ),
          ),
          width: double.infinity,
          child: pw.Padding(
            padding: pw.EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: pw.Text(
              "Suggestions",
              style: pw.TextStyle(color: PdfColors.white, fontSize: 16),
            ),
          ),
        ),
        pw.SizedBox(
          height: 10,
        ),
        pw.Container(
          decoration: pw.BoxDecoration(
            color: PdfColors.white,
            borderRadius: pw.BorderRadius.all(
              pw.Radius.circular(8),
            ),
          ),
          width: double.infinity,
          child: pw.Padding(
            padding: pw.EdgeInsets.all(8),
            child: pw.Text(
              suggeton,
              style: pw.TextStyle(color: PdfColors.black, fontSize: 16),
            ),
          ),
        )
      ],
    ),
  );
}
