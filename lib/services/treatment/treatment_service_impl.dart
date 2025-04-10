import 'package:get/get.dart';
import 'package:unity_labs/model/base/base_model.dart';
import 'package:unity_labs/model/treatment/problem_list_response.dart';
import 'package:unity_labs/model/treatment/sector_list_response.dart';
import 'package:unity_labs/model/treatment/treatment_farmer_model.dart';
import 'package:unity_labs/model/treatment/treatment_list_response.dart';
import 'package:unity_labs/model/treatment/treatment_model.dart';
import 'package:unity_labs/services/treatment/treatment_service.dart';

import '../../model/treatment/create_treatment_model.dart';
import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';

class TreatmentServiceImpl extends TreatmentService {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  @override
  Future<BaseModel> creatTreatmentFramer(
      {required TreatmentFarmerModel treatFarmer}) async {
    final response = await _httpService.postRequest(
      data: treatFarmer.toJson(),
      urlPath: Apis.treatmentFarmer,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<TreatmentModel> createTreatment(
      {required CreateTreatmentModel treatment}) async {
    final response = await _httpService.postRequest(
      data: await treatment.toJson(),
      urlPath: Apis.treatment,
      headerType: HeaderType.file,
    );
    TreatmentModel parsedResponse =
        TreatmentModel.fromJson(response.data['result']);
    parsedResponse.problemId = int.parse(response.data['result']['problemId']);
    return parsedResponse;
  }

  Future<TreatmentModel> updateTreatment(
      {required CreateTreatmentModel treatment,
      required int treatmentId}) async {
    final response = await _httpService.putRequest(
      data: await treatment.toJson(),
      urlPath: '${Apis.treatment}/$treatmentId',
      headerType: HeaderType.file,
    );
    TreatmentModel parsedResponse =
        TreatmentModel.fromJson(response.data['result']);
    parsedResponse.problemId = int.parse(response.data['result']['problemId']);
    return parsedResponse;
  }

  @override
  Future<ProblemListResponse> getAllProblems({required int sectorId}) async {
    final response = await _httpService.getRequest(
      data: {},
      urlPath: '${Apis.problemBySector}$sectorId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = ProblemListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<SectorListResponse> getAllSectors() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.treatmentSector,
      headerType: HeaderType.secured,
    );
    final parsedResponse = SectorListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<TreatmentListResponse> getAllTreatments(
      {required int sectorId, required String type}) async {
    final response = await _httpService.getRequest(
      data: {},
      urlPath: type == 'global'
          ? '${Apis.treatmentBySector}$sectorId'
          : '${Apis.myTreatmentBySector}$sectorId',
      headerType: HeaderType.secured,
    );
    final parsedResponse = TreatmentListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<TreatmentListResponse> getMyTreatments() async {
    final response = await _httpService.getRequest(
      urlPath: Apis.myTreatment,
      headerType: HeaderType.secured,
    );
    final parsedResponse = TreatmentListResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<BaseModel> importTreatment({required int treatmentId}) async {
    final response = await _httpService.getRequest(
      data: {"treatmentId": treatmentId},
      urlPath: Apis.importTreatment,
      headerType: HeaderType.secured,
    );
    final parsedResponse = BaseModel.fromJson(response.data);
    return parsedResponse;
  }
}
