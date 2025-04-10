import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/market/market_model.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';

import '../../services/market/market_service_impl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoController extends GetxController {
  final MarketServiceImpl _marketServiceImpl = Get.find<MarketServiceImpl>();
  final List<MarketModel> marketList =
      List<MarketModel>.empty(growable: true).obs;
  Map<String, dynamic>? weatherData;
  final List<IconData> iconsName = [
    FontAwesomeIcons.fish,
    FontAwesomeIcons.shrimp
  ];
  List<dynamic> eventsList = [];
  late Dio dio;

  Future<void> fetchEventData() async {
    String apiUrl = 'https://kbackend-zxbb.onrender.com/api/lunaevent';

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        print("Events Data");
        // print(response.data['result']);
        eventsList = response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchWeatherData(String loacation) async {
    String apiUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=45e73a0bf2ad42449bb105243233108&q=$loacation&days=7';

    try {
      final response = await dio.get(apiUrl);

      if (response.statusCode == 200) {
        weatherData = response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final isLoading = false.obs;
  @override
  void onInit() async {
    await getAllMarkets();
    await fetchEventData();

    super.onInit();
  }

  Future<void> getAllMarkets() async {
    isLoading(true);
    dio = Dio();
    final autinpel = Get.put(AuthServiceImpl());
    await fetchWeatherData(autinpel.userData!.district!);
    await fetchEventData();
    try {
      final response = await _marketServiceImpl.getAllMarkets();
      marketList.addAll(response.name ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
