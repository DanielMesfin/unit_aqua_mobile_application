import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unity_labs/common/config/http_config.dart';
import 'dart:convert';

import 'package:unity_labs/model/report/plankton_report/plankton_report.dart';

class PlanktonController extends GetxController {
  Rx<ResponseModel?> responseModel = Rx<ResponseModel?>(null);
  RxBool isLoading = false.obs;
  final String baseUrl = HttpConfig.platformUrl;
  Future<void> fetchPlanktonData(int id) async {
    isLoading.value = true;
    try {
      final url = Uri.parse(
          'https://kbackend-zxbb.onrender.com/api/plankton/completed/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        responseModel.value = ResponseModel.fromJson(jsonData);
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void faching(int id) async {
    await fetchPlanktonData(id);
  }

  // Method to clear data if needed
  void clearData() {
    responseModel.value = null;
  }
}
