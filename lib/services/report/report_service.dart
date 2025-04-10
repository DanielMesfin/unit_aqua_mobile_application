import 'package:unity_labs/model/report/fish_report/fish_report_response.dart';
import 'package:unity_labs/model/report/water_report/water_report_response.dart';

import '../../model/report/complete_report/complete_report_model.dart';
import '../../model/report/complete_report/complete_report_response.dart';
import '../../model/report/culture/culture_report_response.dart';
import '../../model/report/feed_report/feed_report_response.dart';
import '../../model/report/pcr_report/pcr_report_response.dart';
import '../../model/report/shrimp_report/shrimp_report_response.dart';
import '../../model/report/soil/soil_report_response.dart';

abstract class ReportServices {
  Future<WaterReportResponse> waterReportList();
  Future<FishReportResponse> fishReportList();
  Future<FeedReportResponse> feedReportList();
  Future<ShrimpReportResponse> shrimpReportList();
  Future<CultureReportResponse> cultureReportList();
  Future<PcrReportResponse> pcrReportList();
  Future<SoilReportResponse> soilReportList();
  Future<CompleteReportResponse> addSuggestionToReport(
      {required int reportId,
      required String reportType,
      required CompleteReportModel suggestionmodel});
}
