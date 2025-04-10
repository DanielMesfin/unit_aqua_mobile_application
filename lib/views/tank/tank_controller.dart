import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import 'package:unity_labs/views/farmer/farmer_controller.dart';
import '../../routes/app_pages.dart';

import '../../model/tank/tank_list_response.dart';
import '../../services/test/test_service_impl.dart';

class TankController extends GetxController {
  late TextEditingController tankSizeController, areaController;

  late TextEditingController depthController,
      biomassController,
      weightController;

  late TextEditingController docController,
      avgBodyWitController,
      totalbioController,
      totalfeedingperdayController;

  late TextEditingController plakfatController,
      plankProteinController,
      plankMoistureController,
      plankAshController,
      fiberController;

  RxString selectedFishType = ''.obs;

  final RxString type = "Water".obs;

  var selectedButtonIndex = 7.obs;
  var isWaterSectionVisible = true.obs;
  var isFishSectionVisible = false.obs;
  var isShrimpSectionVisible = false.obs;

  RxInt yesNoButtonIndex = 0.obs;

  late GlobalKey<FormState> formKeyTestk;
  // final _farmerServiceImpl = Get.find<FarmerServiceImpl>();
  final _testServiceImpl = Get.put(TestServiceImpl());
  final isLoading = false.obs;
  String cultureType = '';
  String tankName = '';
  int tankId = 0;
  //int selectedButtonIndex = 0;
  // List<TankModel> tanks = List<TankModel>.empty(growable: true).obs;

  @override
  void onInit() {
    formKeyTestk = GlobalKey<FormState>();
    tankSizeController = TextEditingController();
    areaController = TextEditingController();
    var arg = Get.arguments as TankResponse;
    //var arg = Get.arguments as TankFindResponse;
    tankName = arg.tank!.name!;
    tankId = arg.tank!.id!;

    depthController = TextEditingController();
    biomassController = TextEditingController();
    weightController = TextEditingController();

    docController = TextEditingController();
    avgBodyWitController = TextEditingController();
    totalbioController = TextEditingController();
    totalfeedingperdayController = TextEditingController();

    plakfatController = TextEditingController();
    plankProteinController = TextEditingController();
    plankMoistureController = TextEditingController();
    plankAshController = TextEditingController();
    fiberController = TextEditingController();
    super.onInit();
  }

  Future<void> createTest(String type, String depth, String biomass,
      String weight, String planktonTest) async {
    final isValid = formKeyTestk.currentState!.validate();
    if (!isValid) {
      return;
    }

    if (type.isEmpty) {
      Get.snackbar('Missing input', 'type needs to be selected.');
      return;
    }

    isLoading(true);
    final authServiceImpl = Get.find<AuthServiceImpl>();
    final farmerSerive = Get.find<FarmerController>();
    try {
      final response = await _testServiceImpl.createTest(
          type: type,
          weight: double.tryParse(weight) ?? 0.0,
          depth: double.tryParse(depth) ?? 0.0,
          biomass: double.tryParse(biomass) ?? 0.0,
          planktonTest: planktonTest,
          tankId: tankId,
          user_id: authServiceImpl.userData!.id,
          farmerid: farmerSerive.farmerId);
      inspect(response);

      if (response.message == 'OK') {
        Get.snackbar(
          response.response ?? "",
          "Test Created Successfully",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 80),
        );
        Get.offAllNamed(
          Routes.home,
        );
      } else {
        Get.snackbar(
          response.response ?? "",
          "Test with this Tank  already exist or wait 12 hours" ?? "",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.only(bottom: 80),
        );
      }
    } on DioException catch (e) {
      inspect(e);

      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    depthController.dispose();
    biomassController.dispose();
    weightController.dispose();
    super.onClose();
  }

  //fish type dropdown
  List<DropdownMenuItem<String>> getFishDropdownItems() {
    return [
      const DropdownMenuItem(
        value: "Rohu",
        child: Text("Rohu"),
      ),
      const DropdownMenuItem(
        value: "Pangus",
        child: Text("Pangus"),
      ),
      const DropdownMenuItem(
        value: "Katla",
        child: Text("Katla"),
      ),
      const DropdownMenuItem(
        value: "Roopchand",
        child: Text("Roopchand"),
      ),
      const DropdownMenuItem(
        value: "Others",
        child: Text("Others"),
      ),
    ];
  }

  void onFishTypeChanged(String? value) {
    if (value != null) {
      selectedFishType(value);
    }
  }

  void setYesNoButtonIndex(int index) {
    yesNoButtonIndex.value = index;
  }
}
