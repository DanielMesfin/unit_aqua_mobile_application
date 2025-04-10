import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/market/mark_data_model.dart';

import '../../model/market/market_zone_model.dart';
import '../../services/market/market_service_impl.dart';

class MarketController extends GetxController {
  late int id;
  final MarketServiceImpl _marketServiceImpl = Get.find<MarketServiceImpl>();
  List<MarketZoneModel>? marketZoneList; //market list

  final List<MarketZoneModel> marketTypeList =
      List<MarketZoneModel>.empty(growable: true).obs; // market type list
  final isLoading = false.obs;
  late Rx<MarketZoneModel>? currentZone; // current market zone
  Rx<MarketZoneModel>? currentType;
  late TextEditingController inputController;
  List<MarketTypeData> marketTypeData = [];

  Future<void> getAllMarketZone(int marketId) async {
    isLoading(true);
    try {
      final response = await _marketServiceImpl.getAllZones(marketId);
      marketZoneList = response.zoneList ?? [];
      currentZone = marketZoneList![0].obs;
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAllMarketTypes(int marketId) async {
    isLoading(true);
    try {
      final response = await _marketServiceImpl.getAllTypes(marketId);

      marketTypeList.addAll(response.zoneList ?? []);
      currentType = marketTypeList[0].obs;
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    inputController = TextEditingController();
    if (Get.arguments != null) {
      id = Get.arguments["marketId"];
      await getAllMarketZone(id);
      if (id == 1) {
        await getAllMarketTypes(id);
        await calculate();
      }
      if (id == 2) {
        await getAllMarketTypes(id);
        await calculate();
      }
    }
    super.onInit();
  }

  Future<void> calculate() async {
    if (id == 1) {
      isLoading(true);
      try {
        final response = await _marketServiceImpl.filter(
            currentType!.value.id!, currentZone!.value.id!);
        marketTypeData = response.result;
      } catch (e) {
        inspect(e);
      } finally {
        isLoading(false);
      }
    } else if (id == 2) {
      isLoading(true);
      try {
        final response =
            await _marketServiceImpl.filter(0, currentZone!.value.id!);
        marketTypeData = response.result;
      } catch (e) {
        inspect(e);
      } finally {
        isLoading(false);
      }
    } else {}
  }
}
