import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/tank/tank_model.dart';

import '../../model/farmer/farmers_list_response.dart';
import '../../routes/app_pages.dart';
import '../../services/famer/farmer_service_impl.dart';

class FarmerController extends GetxController {
  late TextEditingController tankSizeController, areaController;
  late GlobalKey<FormState> formKeyF;
  final _farmerServiceImpl = Get.find<FarmerServiceImpl>();
  final isLoading = false.obs;
  String cultureType = '';
  String? farmernameForheader;
  String? farmerareaForheader;

  int? farmerId;
  int? tankId;
  List<TankModel> tanks = List<TankModel>.empty(growable: true).obs;
  RxBool showAllTanks = false.obs;
  @override
  void onInit() {
    formKeyF = GlobalKey<FormState>();
    tankSizeController = TextEditingController();
    areaController = TextEditingController();
    var arg = Get.arguments as FarmerResponse;
    farmerId = arg.farmer?.id;
    farmernameForheader = arg.farmer?.name;
    farmerareaForheader = arg.farmer?.area;
    tanks.addAll(arg.tankList ?? []);
    super.onInit();
  }

  void registerTank() async {
    final isValid = formKeyF.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (cultureType.isEmpty) {
      Get.snackbar('Missing input', 'Culture type needs to be selected.');
      return;
    }
    isLoading(true);
    try {
      TankModel request = TankModel(
        size: tankSizeController.text.trim(),
        area: areaController.text.trim(),
        cultureType: cultureType,
        farmerId: farmerId,
      );
      final response = await _farmerServiceImpl.addTank(tank: request);
      inspect(response);
      if (response.isFailure) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        Get.toNamed(Routes.tank, arguments: response);
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

  void getTankById({required int tankId}) async {
    isLoading(true);
    try {
      final response = await _farmerServiceImpl.getTankById(id: tankId);
      inspect(response);

      if (response.message == "OK") {
        Get.toNamed(Routes.tank, arguments: response);
      } else {}
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
}
