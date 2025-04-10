import '../../model/farmer/farmers_list_response.dart';
import '../../model/farmer_record/farmer_records_response.dart';
import '../../model/farmer_record/tank_reports/tank_report_list_response.dart';
import '../../model/tank/tank_list_response.dart';

abstract class FarmerRecordService {
  Future<FarmerRecordsResponse> getAllFarmers({required int userId});
  Future<FarmerRecordsResponse> getAllFarmersWithFilter(
      {required String filter, required int userId});
  Future<FarmerRecordsResponse> getFarmer({required String phone});
  Future<FarmerResponse> getTank({required String phone});
  Future<TankResponse> getTankById({required int id});
  Future<TankReportListResponse> getTankReports(
      {required int id, required int userId});
}
