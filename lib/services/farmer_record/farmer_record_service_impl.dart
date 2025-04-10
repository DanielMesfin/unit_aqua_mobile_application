import 'package:get/get.dart';
import 'package:unity_labs/model/farmer/farmers_list_response.dart';
import 'package:unity_labs/model/tank/tank_list_response.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import '../../model/farmer_record/farmer_records_response.dart';
import '../../model/farmer_record/tank_reports/tank_report_list_response.dart';
import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';
import 'farmer_record_service.dart';

class FarmerRecordServiceImpl extends FarmerRecordService {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  final _authServiceImpl = Get.find<AuthServiceImpl>();

  @override
  Future<FarmerRecordsResponse> getAllFarmers({required int userId}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.farmer}/myfarm/$userId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = FarmerRecordsResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<FarmerRecordsResponse> getAllFarmersWithFilter(
      {required String filter, required int userId}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.farmer}/filter/myfarm/$userId/$filter',
      headerType: HeaderType.secured,
    );
    final parsedResponse = FarmerRecordsResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<FarmerResponse> getTank({required String phone}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.tank}/${_authServiceImpl.userData!.id}/$phone',
      // urlPath: '${Apis.tank}/$phone',

      headerType: HeaderType.secured,
    );
    final parsedResponse = FarmerResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<FarmerRecordsResponse> getFarmer({required String phone}) async {
    final response = await _httpService.getRequest(
      // urlPath: '${Apis.farmer}/${_authServiceImpl.userData!.id}/$phone',
      urlPath: '${Apis.farmer}/myfarm/${_authServiceImpl.userData!.id}/$phone',

      headerType: HeaderType.secured,
    );
    final parsedResponse = FarmerRecordsResponse.fromJson(response.data);
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

  @override
  Future<TankReportListResponse> getTankReports(
      {required int id, required int userId}) async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.tank}/report/$id/$userId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = TankReportListResponse.fromJson(response.data);
    return parsedResponse;
  }
}
