import 'package:get/get.dart';
import 'package:unity_labs/model/farmer/farmers_list_response.dart';
import 'package:unity_labs/model/farmer/farmers_model.dart';
import 'package:unity_labs/model/tank/tank_list_response.dart';
import 'package:unity_labs/model/tank/tank_model.dart';
import 'package:unity_labs/services/famer/farmer_service.dart';

import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';

class FarmerServiceImpl extends FarmerService {
  final HttpService _httpService = Get.find<HttpServiceImpl>();

  @override
  Future<FarmerResponse> getTank({required String phone}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.tank}/$phone',
      headerType: HeaderType.secured,
    );

    final parsedResponse = FarmerResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<FarmerResponse> addFarmer({required FarmersModel farmer}) async {
    final response = await _httpService.postRequest(
      data: farmer.toJson(),
      urlPath: Apis.farmer,
      headerType: HeaderType.secured,
    );
    final parsedResponse = FarmerResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<TankResponse> addTank({required TankModel tank}) async {
    final response = await _httpService.postRequest(
      data: tank.toJson(),
      urlPath: Apis.tank,
      headerType: HeaderType.secured,
    );
    final parsedResponse = TankResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<TankResponse> getTankById({required int id}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.tank}/find/$id',
      headerType: HeaderType.secured,
    );
    final parsedResponse = TankResponse.fromJson(response.data);
    return parsedResponse;
  }
}
