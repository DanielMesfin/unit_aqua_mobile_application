import 'package:get/get.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';

import '../../model/report/complete_report/complete_report_model.dart';
import '../../model/report/complete_report/complete_report_response.dart';
import '../../model/report/culture/culture_report_response.dart';
import '../../model/report/feed_report/feed_report_response.dart';
import '../../model/report/fish_report/fish_report_response.dart';
import '../../model/report/pcr_report/pcr_report_response.dart';
import '../../model/report/shrimp_report/shrimp_report_response.dart';
import '../../model/report/soil/soil_report_response.dart';
import '../../model/report/water_report/water_report_response.dart';
import '../apis.dart';
import '../http/http_service.dart';
import '../http/http_service_impl.dart';
import 'report_service.dart';

class ReportServiceImpl extends ReportServices {
  final HttpService _httpService = Get.find<HttpServiceImpl>();
  final _authServiceImpl = Get.find<AuthServiceImpl>();

  @override
  Future<WaterReportResponse> waterReportList() async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.waterreport}/${_authServiceImpl.userData!.id}',
      headerType: HeaderType.secured,
    );
    final parsedResponse = WaterReportResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<FishReportResponse> fishReportList() async {
    final response = await _httpService.getRequest(
      urlPath: '${Apis.fishreport}/${_authServiceImpl.userData!.id}',
      headerType: HeaderType.secured,
    );
    final parsedResponse = FishReportResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<FeedReportResponse> feedReportList() async {
    final response = await _httpService.getRequest(
      // urlPath: Apis.feedreport,
      urlPath: '${Apis.feedreport}/${_authServiceImpl.userData!.id}',

      headerType: HeaderType.secured,
    );
    final parsedResponse = FeedReportResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<ShrimpReportResponse> shrimpReportList() async {
    final response = await _httpService.getRequest(
      // urlPath: Apis.shrimpreport,
      urlPath: '${Apis.shrimpreport}/${_authServiceImpl.userData!.id}',

      headerType: HeaderType.secured,
    );
    final parsedResponse = ShrimpReportResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<CultureReportResponse> cultureReportList() async {
    final response = await _httpService.getRequest(
      // urlPath: Apis.culturereport,
      urlPath: '${Apis.culturereport}/${_authServiceImpl.userData!.id}',

      headerType: HeaderType.secured,
    );
    final parsedResponse = CultureReportResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<PcrReportResponse> pcrReportList() async {
    final response = await _httpService.getRequest(
      // urlPath: Apis.pcrreport,
      urlPath: '${Apis.pcrreport}/${_authServiceImpl.userData!.id}',

      headerType: HeaderType.secured,
    );
    final parsedResponse = PcrReportResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<SoilReportResponse> soilReportList() async {
    final response = await _httpService.getRequest(
      // urlPath: Apis.soilreport,
      urlPath: '${Apis.soilreport}/${_authServiceImpl.userData!.id}',

      headerType: HeaderType.secured,
    );
    final parsedResponse = SoilReportResponse.fromJson(response.data);
    return parsedResponse;
  }

  @override
  Future<CompleteReportResponse> addSuggestionToReport(
      {required int reportId,
      required String reportType,
      required CompleteReportModel suggestionmodel}) async {
    final response = await _httpService.putRequest(
      urlPath: '$reportType/${Apis.addSuggestionToReport}/$reportId',
      data: suggestionmodel.toJson(),
      headerType: HeaderType.secured,
    );
    final parsedResponse = CompleteReportResponse.fromJson(response.data);
    return parsedResponse;
  }
}
