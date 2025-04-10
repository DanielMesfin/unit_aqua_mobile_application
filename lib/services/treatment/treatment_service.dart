import 'package:unity_labs/model/base/base_model.dart';

import '../../model/treatment/create_treatment_model.dart';
import '../../model/treatment/problem_list_response.dart';
import '../../model/treatment/sector_list_response.dart';
import '../../model/treatment/treatment_farmer_model.dart';
import '../../model/treatment/treatment_list_response.dart';
import '../../model/treatment/treatment_model.dart';

abstract class TreatmentService {
  Future<SectorListResponse> getAllSectors();
  Future<ProblemListResponse> getAllProblems({required int sectorId});
  Future<TreatmentModel> createTreatment(
      {required CreateTreatmentModel treatment});
  Future<TreatmentListResponse> getAllTreatments(
      {required int sectorId, required String type});
  Future<BaseModel> importTreatment({required int treatmentId});
  Future<BaseModel> creatTreatmentFramer(
      {required TreatmentFarmerModel treatFarmer});
  Future<TreatmentListResponse> getMyTreatments();
}
