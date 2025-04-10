import '../../model/farmer/farmers_list_response.dart';
import '../../model/farmer/farmers_model.dart';
import '../../model/tank/tank_list_response.dart';
import '../../model/tank/tank_model.dart';

abstract class FarmerService {
  Future<FarmerResponse> getTank({required String phone});
  Future<FarmerResponse> addFarmer({required FarmersModel farmer});
  Future<TankResponse> addTank({required TankModel tank});
  Future<TankResponse> getTankById({required int id});
}
