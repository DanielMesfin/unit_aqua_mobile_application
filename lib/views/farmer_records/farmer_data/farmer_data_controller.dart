import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/farmer/farmers_list_response.dart';
import '../../../model/tank/tank_model.dart';

class FarmerDataController extends GetxController {
  late GlobalKey<FormState> formKey;
  final isLoading = false.obs;
  String cultureType = '';
  int? farmerId;
  String? farmername;
  String? farmerarea;
  String? farmerculture;
  String? farmermobile;
  int? tankId;
  List<TankModel> tanks = List<TankModel>.empty(growable: true).obs;
  RxBool showAllTanks = false.obs;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    var arg = Get.arguments as FarmerResponse;
    farmerId = arg.farmer?.id;

    farmername = arg.farmer!.name;
    farmerarea = arg.farmer!.area;
    farmerculture = arg.farmer!.cultureType;
    farmermobile = arg.farmer!.phoneNumber;

    tanks.addAll(arg.tankList ?? []);
    super.onInit();
  }

  // void getTankById({required int tankId}) async {
  //   isLoading(true);
  //   try {
  //     final response = await _farmerServiceImpl.getTankById(id: tankId);
  //     inspect(response);

  //     if (response.message == "OK") {
  //       //Get.snackbar(response.response ?? "", response.message ?? "");

  //       Get.toNamed(Routes.tank, arguments: response);
  //     } else {}
  //   } on DioException catch (e) {
  //     inspect(e);
  //     Get.snackbar(e.response!.data["RESPONSE"] ?? "",
  //         e.response!.data["message"] ?? "");
  //   } catch (e) {
  //     inspect(e);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  void showDeleteConfirmationDialog(BuildContext context, Function onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
