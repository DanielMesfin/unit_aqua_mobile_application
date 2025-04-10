import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/theme_text.dart';
import '../../../widgets/primary_button.dart';
import 'soil_test_report_controller.dart';

class SoilTestReportView extends GetView<SoilTestReportController> {
  const SoilTestReportView({super.key});

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
        title: Text("Soil Test Form",
            style:
                ThemeText.bodyOne.copyWith(color: Colors.white, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name:",
                        style: ThemeText.bodyOne.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Size:",
                        style: ThemeText.bodyOne.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Area:",
                        style: ThemeText.bodyOne.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Culture Type:",
                        style: ThemeText.bodyOne.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.name,
                        style: ThemeText.bodyOne.copyWith(color: Colors.black),
                      ),
                      Text(
                        controller.size,
                        style: ThemeText.bodyOne.copyWith(color: Colors.black),
                      ),
                      Text(
                        controller.area,
                        style: ThemeText.bodyOne.copyWith(color: Colors.black),
                      ),
                      Text(
                        controller.cultureType,
                        style: ThemeText.bodyOne.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Soil Type',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedSoilType.toString(),
                items: controller.soilTypeOptions
                    .map((nature) => DropdownMenuItem(
                          value: nature,
                          child: Text(nature),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedSoilType.value = value ?? "";
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: 'Soil Type',
              //     border: OutlineInputBorder(),
              //     filled: true,
              //     fillColor: Colors.grey[200],
              //   ),
              //   controller: controller.soilTypeController,
              // ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Soil Nature',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedSoilNature.toString(),
                items: controller.soilNatureOptions
                    .map((nature) => DropdownMenuItem(
                          value: nature,
                          child: Text(nature),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedSoilNature.value = value ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Soil pH',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                controller: controller.soilPhController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Organic Carbon',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedOrganicCarbon.toString(),
                items: controller.organicCarbonOptions
                    .map((carbon) => DropdownMenuItem(
                          value: carbon,
                          child: Text(carbon),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedOrganicCarbon.value = value ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Available Nitrogen',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                controller: controller.availableNitrogenController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Available Properous',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedAProperous.toString(),
                items: controller.aProperousOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedAProperous.value = value ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Available Potash',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                controller: controller.aPotashController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Available Sulphur',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedASulphur.toString(),
                items: controller.aSulphurOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedASulphur.value = value ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Available Zinc',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                controller: controller.aZincController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Available Iron',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedAIron.toString(),
                items: controller.aIronOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedAIron.value = value ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Available Boran',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                controller: controller.aBoranController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Lime Test',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: controller.selectedLimeTest.toString(),
                items: controller.limeTestOptions
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedLimeTest.value = value ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: PrimaryButton(
                          isPrimaryButton: false,
                          width: Get.width * 0.9,
                          height: 60,
                          label: "Submit",
                          onPressed: () {
                            final tankId = controller.tankId;
                            final testId = controller.testId;
                            controller.soilCreateTest(
                                controller.selectedSoilType.value,
                                controller.selectedSoilNature.value,
                                controller.soilPhController.text,
                                controller.selectedOrganicCarbon.value,
                                controller.availableNitrogenController.text,
                                controller.selectedAProperous.value,
                                controller.aPotashController.text,
                                controller.selectedASulphur.value,
                                controller.aZincController.text,
                                controller.selectedAIron.value,
                                controller.aBoranController.text,
                                controller.selectedLimeTest.value,
                                tankId,
                                testId);

                            // );
                            //controller.submitForm();
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
