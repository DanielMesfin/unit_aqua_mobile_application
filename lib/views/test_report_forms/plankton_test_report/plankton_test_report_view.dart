import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/primary_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:photo_view/photo_view.dart';

import '../../../themes/theme_button.dart';
import '../../../themes/theme_text.dart';
import 'plankton_test_report_controller.dart';

class PlanktonTestReportView extends GetView<PlanktonTestReportController> {
  PlanktonTestReportView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 5, 153),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30.0, // Set the icon size
          onPressed: () {
            Navigator.pop(context); // Handle back action
          },
        ),
        title: Text("Plankton Test Report",
            style:
                ThemeText.bodyOne.copyWith(color: Colors.white, fontSize: 20)),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),

                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.deepOrange[400],
                  child: Center(
                    child: Text(
                      "Useful Plankton",
                      style:
                          ThemeText.headlineTwo.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[850],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'Green Algae',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 300,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "Chlorella",
                                controller:
                                    controller.usefulChlorellaController,
                                imageAssetPath:
                                    'assets/images/useful/chlorella-2.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "oocysts",
                                controller: controller.usefulOocystsController,
                                imageAssetPath:
                                    'assets/images/useful/oocysts.jpeg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Scenedesmus",
                                controller:
                                    controller.usefulScenedesmusController,
                                imageAssetPath:
                                    'assets/images/useful/Scenedesmus.png',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Eudorina",
                                controller: controller.usefulEudorinaController,
                                imageAssetPath:
                                    'assets/images/useful/eudorina.jpeg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Tetraselmis",
                                controller:
                                    controller.usefulTetraselmisController,
                                imageAssetPath:
                                    'assets/images/useful/Tetraselmis.png',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Eutreptia",
                                controller:
                                    controller.usefulEutreptiaController,
                                imageAssetPath:
                                    'assets/images/useful/eutreptia.jpeg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "phacus",
                                controller: controller.usefulPhacusController,
                                imageAssetPath:
                                    'assets/images/useful/phacus.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //BG algae
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    color: Colors.deepOrange[400],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'BG Algae',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        //height: 80,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "SpIrulina",
                                controller:
                                    controller.usefulSpIrulinaController,
                                imageAssetPath:
                                    'assets/images/useful/SpIrulina.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //diatoms
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    color: Colors.grey[850],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'Diatoms',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        //height: 80,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "Chaetoceros",
                                controller:
                                    controller.usefulChaetocerosController,
                                imageAssetPath:
                                    'assets/images/useful/chaetoceros.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Skeletonema",
                                controller:
                                    controller.usefulSkeletonemaController,
                                imageAssetPath:
                                    'assets/images/useful/Skeletonema.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Cyclotella",
                                controller:
                                    controller.usefulCyclotellaController,
                                imageAssetPath:
                                    'assets/images/useful/cyclotella.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Thalassiosira",
                                controller:
                                    controller.usefulThalassiosiraController,
                                imageAssetPath:
                                    'assets/images/useful/thalassiosira.jpeg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Rhizosolenia",
                                controller:
                                    controller.usefulRhizosoleniaController,
                                imageAssetPath:
                                    'assets/images/useful/Rhizosolenia.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //Zooplankton
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    color: Colors.deepOrange[400],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'Zooplankton',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        //height: 80,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "Copepod",
                                controller: controller.usefulCopepodController,
                                imageAssetPath:
                                    'assets/images/useful/copepod.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "rotifer",
                                controller: controller.usefulRotiferController,
                                imageAssetPath:
                                    'assets/images/useful/rotifer.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Nauplius",
                                controller: controller.usefulNaupliusController,
                                imageAssetPath:
                                    'assets/images/useful/nauplius.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                //harmful
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.grey[850],
                  child: Center(
                    child: Text(
                      "Harmful Plankton",
                      style:
                          ThemeText.headlineTwo.copyWith(color: Colors.white),
                    ),
                  ),
                ),

                //Dinoflagallate
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    color: Colors.deepOrange[400],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'Dinoflagallate',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        //height: 80,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "Noctiluca",
                                controller:
                                    controller.harmfulNoctilucaController,
                                imageAssetPath:
                                    'assets/images/harmful/Noctiluca.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "ceratium",
                                controller:
                                    controller.harmfulCeratiumController,
                                imageAssetPath:
                                    'assets/images/harmful/ceratium.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Dinophysis",
                                controller:
                                    controller.harmfulDinophysisController,
                                imageAssetPath:
                                    'assets/images/harmful/dinophysis.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Protoperidinium",
                                controller:
                                    controller.harmfulProtoperidiniumController,
                                imageAssetPath:
                                    'assets/images/harmful/protoperidinium.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Protozoa
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    color: Colors.grey[850],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'Protozoa',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        //height: 80,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "Zoothamnium",
                                controller:
                                    controller.harmfulZoothamniumController,
                                imageAssetPath:
                                    'assets/images/harmful/zoothamnium.jpeg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Favella",
                                controller: controller.harmfulFavellaController,
                                imageAssetPath:
                                    'assets/images/harmful/flagella.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Vorticella",
                                controller:
                                    controller.harmfulVorticellaController,
                                imageAssetPath:
                                    'assets/images/harmful/vorticella.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Gregarina",
                                controller:
                                    controller.harmfulGregarinaController,
                                imageAssetPath:
                                    'assets/images/harmful/Gregarina.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Blue Green Algea
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    color: Colors.deepOrange[400],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'Blue Green Algea',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        //height: 80,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "anabaena",
                                controller:
                                    controller.harmfulAnabaenaController,
                                imageAssetPath:
                                    'assets/images/harmful/anabaena.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Oscillatoria",
                                controller:
                                    controller.harmfulOscillatoriaController,
                                imageAssetPath:
                                    'assets/images/harmful/oscillatoria.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Microcystis",
                                controller:
                                    controller.harmfulMicrocystisController,
                                imageAssetPath:
                                    'assets/images/harmful/microcystis.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "coscinodiscus",
                                controller:
                                    controller.harmfulCoscinodiscusController,
                                imageAssetPath:
                                    'assets/images/harmful/coscinodiscus.jpeg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Diatoms
                Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                    ),
                    color: Colors.grey[850],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 44.4,
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Center(
                            child: Text(
                              'Diatoms',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        //height: 80,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              buildFormContainer(
                                context: context,
                                labelText: "Nitzschia",
                                controller:
                                    controller.harmfulNitzschiaController,
                                imageAssetPath:
                                    'assets/images/harmful/nitzschia.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Navicula",
                                controller:
                                    controller.harmfulNaviculaController,
                                imageAssetPath:
                                    'assets/images/harmful/Navicula.jpg',
                              ),
                              buildFormContainer(
                                context: context,
                                labelText: "Pleurosigma",
                                controller:
                                    controller.harmfulPleurosigmaController,
                                imageAssetPath:
                                    'assets/images/harmful/Pleurosigma.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Center(
                  child: Obx(() {
                    if (controller.isLoading.isTrue) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return PrimaryButton(
                        isPrimaryButton: false,
                        width: Get.width * 0.9,
                        height: 60,
                        label: "Submit",
                        buttonStyle: ThemeButton.secondaryButtonStyle,
                        onPressed: () {
                          final tankId = Get.arguments['tankId'];
                          final testId = Get.arguments['testId'];

                          controller.createPlanktonTest(
                            tankId,
                            testId,
                          );

                          // final rating_test = double.tryParse(
                          //         controller.usefulChlorellaController.text) ??
                          //     "";
                          // print("################3");
                          // print(rating_test);
                        },
                      );
                    }
                  }),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(vertical: 35),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: const TextStyle(color: Colors.red),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $labelText';
        }
        return null; // Validation passed
      },
    );
  }

  Widget buildFormContainer({
    required BuildContext context,
    required String labelText,
    required TextEditingController controller,
    required String imageAssetPath,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: PhotoView(
                        imageProvider: AssetImage(imageAssetPath),
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 2,
                      ),
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    imageAssetPath,
                    width: 75,
                    height: 75,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    width: 1,
                    height: 75,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 120,
                    child: Text(
                      labelText,
                      style: const TextStyle(
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 1,
                    height: 75,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: Center(
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 21.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.circle,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          int intValue = rating.toInt();
                          controller.text = intValue.toString();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
