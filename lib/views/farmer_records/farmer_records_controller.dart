import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';

import '../../model/farmer_record/farmer_records_response.dart';
import '../../model/farmer_record/farmer_search_response.dart';
import '../../routes/app_pages.dart';
import '../../services/farmer_record/farmer_record_service_impl.dart';

class FarmerRecordsController extends GetxController {
  late TextEditingController searchController;
  late GlobalKey<FormState> formKey;
  final _farmerRecordServiceImpl = Get.put(FarmerRecordServiceImpl());
  final _authServiceImpl = Get.find<AuthServiceImpl>();

  // final List<FarmerRecordsResponse> allFarmers = List<FarmerRecordsResponse>.empty(growable: true).obs;
  final allFarmers = Rx<FarmerRecordsResponse?>(null);
  final searchFarmerResult = Rx<FarmerSearchResponse?>(null);
  final isLoading = false.obs;
  int userId = 3;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    searchController = TextEditingController();
    super.onInit();
    userId = 3;
    getAllFarmers().then((response) {
      if (response != null) {
        allFarmers.value = response;
      }
    });
  }

  Future<FarmerRecordsResponse?> getAllFarmers() async {
    isLoading(true);
    final int? userIdInfo = _authServiceImpl.userData?.id;
    try {
      final response =
          await _farmerRecordServiceImpl.getAllFarmers(userId: userIdInfo!);
      inspect(response);

      if (response.message == "OK") {
        allFarmers.value = response;
        return response;
      } else {
        return null;
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      isLoading(false);
    }
    return null;
  }

  void getTank(String phoneNumber) async {
    isLoading(true);
    try {
      final response =
          await _farmerRecordServiceImpl.getTank(phone: phoneNumber);
      inspect(response);

      if (response.isFailure) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        Get.toNamed(Routes.farmerdatacontent, arguments: response);
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

  Future<FarmerRecordsResponse?> searchFarmer() async {
    // upate seercing
    isLoading(true);
    try {
      final response = await _farmerRecordServiceImpl.getFarmer(
          phone: searchController.text.trim());
      inspect(response);
      if (response.result!.isEmpty) {
        allFarmers.value = null;
      } else {
        allFarmers.value = response;
      }
      return response;
    } on DioException catch (e) {
      inspect(e);
      // Get.snackbar(e.response!.data["RESPONSE"] ?? "",
      //     e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
    return null;
  }

  // Future<void> searchResult() async {
  //   var response = await searchFarmer();
  //   if (response != null) {
  //     // setSearchResultData(response);
  //   }
  // }

  Future<FarmerRecordsResponse?> getAllFarmersWithFilter(String filter) async {
    final int? userIdInfo = _authServiceImpl.userData?.id;
    isLoading(true);
    try {
      if (filter == 'all') {
        return getAllFarmers();
      }
      final response = await _farmerRecordServiceImpl.getAllFarmersWithFilter(
          userId: userIdInfo!, filter: filter);
      inspect(response);

      if (response.message == "OK") {
        //Get.snackbar(response.response ?? "", response.message ?? "");
        // setSearchResultData(response as FarmerSearchResponse);
        allFarmers.value = response;
              //Get.toNamed(Routes.tank, arguments: response);
        return response;
      } else {
        return null;
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      isLoading(false);
    }
    return null;
  }
}
