import 'dart:developer';

import 'package:get/get.dart';
import 'package:unity_labs/common/enums/api_enums.dart';
import 'package:unity_labs/helpers/dialog_helpers.dart';
import 'package:unity_labs/model/treatment/treatment_model.dart';

import '../../services/treatment/treatment_service_impl.dart';

class TreatmentDetailController extends GetxController {
  final TreatmentServiceImpl _treatmentServiceImpl =
      Get.find<TreatmentServiceImpl>();
  final List<TreatmentModel> treatmenList =
      List<TreatmentModel>.empty(growable: true).obs;
  final isLoading = true.obs;
  final isButtonLoading = false.obs;
  late int problemId;
  late TreatmentModel treatment;
  String type = '';
  Future<void> getAllTreatments(int sectorId) async {
    isLoading(true);
    try {
      treatmenList.clear();
      final response = await _treatmentServiceImpl.getAllTreatments(
        sectorId: sectorId,
        type: type,
      );
      treatmenList.addAll(response.treatments ?? []);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> importTreatment() async {
    isButtonLoading(true);
    try {
      final response = await _treatmentServiceImpl.importTreatment(
        treatmentId: treatment.id!,
      );

      if (!response.isFailure) {
        DialogHelpers().showSnackBarGetx(
          content: "Imported",
          responseMessage: ResponseMessage.success,
        );
      } else {
        getAllTreatments(treatment.problemId!);
      }
    } catch (e) {
      DialogHelpers().showSnackBarGetx(
        content: 'Unable to import',
        responseMessage: ResponseMessage.warning,
      );
      inspect(e);
    } finally {
      getAllTreatments(treatment.problemId!);
      isButtonLoading(false);
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      treatment = Get.arguments['treatment'];
      type = Get.arguments['type'];
      getAllTreatments(treatment.problemId!);
    }
    super.onInit();
  }
}
