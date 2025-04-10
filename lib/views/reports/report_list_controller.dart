import 'package:get/get.dart';

import '../../model/report/culture/culture_report_response.dart';
import '../../model/report/feed_report/feed_report_response.dart';
import '../../model/report/fish_report/fish_report_response.dart';
import '../../model/report/pcr_report/pcr_report_response.dart';
import '../../model/report/shrimp_report/shrimp_report_response.dart';
import '../../model/report/soil/soil_report_response.dart';
import '../../model/report/water_report/water_report_response.dart';
import '../../services/report/report_service_impl.dart';

import 'dart:developer';

class ReportListController extends GetxController {
  final ReportServiceImpl _reportService = Get.put(ReportServiceImpl());
  final waterReport = Rx<WaterReportResponse?>(null);
  final fishReport = Rx<FishReportResponse?>(null);
  final feedReport = Rx<FeedReportResponse?>(null);
  final shrimpReport = Rx<ShrimpReportResponse?>(null);
  final cultureReport = Rx<CultureReportResponse?>(null);
  final pcrReport = Rx<PcrReportResponse?>(null);
  final soilReport = Rx<SoilReportResponse?>(null);
  final isLoading = false.obs;

  //@override
  @override
  void onInit() {
    super.onInit();
    getAllWaterReport().then((response) {
      if (response != null) {
        setWaterReportList(response);
      }
    });
    getAllFeedReport().then((response) {
      if (response != null) {
        setFeedReportList(response);
      }
    });
    getAllShrimpReport().then((response) {
      if (response != null) {
        setShrimpReportList(response);
      }
    });
    getAllCultureReport().then((response) {
      if (response != null) {
        setCultureReportList(response);
      }
    });
    getAllPcrReport().then((response) {
      if (response != null) {
        setPcrReportList(response);
      }
    });
    getAllSoilReport().then((response) {
      if (response != null) {
        setSoilReportList(response);
      }
    });
    getAllFishReport().then((response) {
      if (response != null) {
        setFishReportList(response);
      }
    });
  }

  //water
  Future<WaterReportResponse?> getAllWaterReport() async {
    isLoading(true);
    try {
      final response = await _reportService.waterReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response ?? "", response.message ?? "");
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      //Get.snackbar(e.response!.data["RESPONSE"] ?? "", e.response!.data["message"] ?? "");
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setWaterReportList(WaterReportResponse? data) {
    waterReport.value = data;
  }

  int getWaterTypeCount(WaterReportResponse? waterReport) {
    if (waterReport != null) {
      var reportsWithStatusOne =
          waterReport.result.where((report) => report.alltest?.status == "2");
      return reportsWithStatusOne.length;
    }
    return 0;
  }

  //fish
  Future<FishReportResponse?> getAllFishReport() async {
    isLoading(true);
    try {
      final response = await _reportService.fishReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response ?? "", response.message ?? "");
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      //Get.snackbar(e.response!.data["RESPONSE"] ?? "", e.response!.data["message"] ?? "");
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setFishReportList(FishReportResponse? data) {
    fishReport.value = data;
  }

  int getFishTypeCount(FishReportResponse? fishReport) {
    if (fishReport != null) {
      var reportsWithStatusOne =
          fishReport.result.where((report) => report.alltest?.status == "2");
      return reportsWithStatusOne.length ?? 0;
    }
    return 0;
  }

  //feed
  Future<FeedReportResponse?> getAllFeedReport() async {
    isLoading(true);
    try {
      final response = await _reportService.feedReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response ?? "", response.message ?? "");
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      //Get.snackbar(e.response!.data["RESPONSE"] ?? "", e.response!.data["message"] ?? "");
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setFeedReportList(FeedReportResponse? data) {
    feedReport.value = data;
  }

  int getFeedTypeCount(FeedReportResponse? feedReport) {
    if (feedReport != null) {
      //return feedReport.result.length;

      var reportsWithStatusOne =
          feedReport.result.where((report) => report.alltest.status == "2");

      return reportsWithStatusOne.length;
    }
    return 0;
  }

  //shrimp
  Future<ShrimpReportResponse?> getAllShrimpReport() async {
    isLoading(true);
    try {
      final response = await _reportService.shrimpReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        // Get.snackbar(response.response ?? "", response.message ?? "");
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      //Get.snackbar(e.response!.data["RESPONSE"] ?? "", e.response!.data["message"] ?? "");
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setShrimpReportList(ShrimpReportResponse? data) {
    shrimpReport.value = data;
  }

  int getShrimpTypeCount(ShrimpReportResponse? shrimpReport) {
    if (shrimpReport != null && shrimpReport.result != null) {
      var reportsWithStatusOne =
          shrimpReport.result!.where((report) => report.alltest?.status == "2");
      return reportsWithStatusOne.length;
    }
    return 0;
  }

  //culture
  Future<CultureReportResponse?> getAllCultureReport() async {
    isLoading(true);
    try {
      final response = await _reportService.cultureReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response ?? "", response.message ?? "");
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      //Get.snackbar(e.response!.data["RESPONSE"] ?? "", e.response!.data["message"] ?? "");
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setCultureReportList(CultureReportResponse? data) {
    cultureReport.value = data;
  }

  int getCultureTypeCount(CultureReportResponse? cultureReport) {
    if (cultureReport != null) {
      //return cultureReport.result.length;

      var reportsWithStatusOne =
          cultureReport.result.where((report) => report.alltest.status == "2");

      return reportsWithStatusOne.length;
    }
    return 0;
  }

  //pcr
  Future<PcrReportResponse?> getAllPcrReport() async {
    isLoading(true);
    try {
      final response = await _reportService.pcrReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        // Get.snackbar(response.response ?? "", response.message ?? "");
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      //Get.snackbar(e.response!.data["RESPONSE"] ?? "", e.response!.data["message"] ?? "");
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setPcrReportList(PcrReportResponse? data) {
    pcrReport.value = data;
  }

  int getPcrTypeCount(PcrReportResponse? pcrReport) {
    if (pcrReport != null) {
      //return pcrReport.result.length;

      var reportsWithStatusOne =
          pcrReport.result!.where((report) => report.alltest?.status == "2");

      return reportsWithStatusOne.length;
    }
    return 0;
  }

  //soil
  Future<SoilReportResponse?> getAllSoilReport() async {
    isLoading(true);
    try {
      final response = await _reportService.soilReportList();
      inspect(response);

      if (response.response == "SUCCESS") {
        //Get.snackbar(response.response ?? "", response.message ?? "");
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      //Get.snackbar(e.response!.data["RESPONSE"] ?? "", e.response!.data["message"] ?? "");
      return null;
    } finally {
      isLoading(false);
    }
  }

  void setSoilReportList(SoilReportResponse? data) {
    soilReport.value = data;
  }

  int getSoilTypeCount(SoilReportResponse? soilReport) {
    if (soilReport != null) {
      //return soilReport.result.length;

      var reportsWithStatusOne =
          soilReport.result.where((report) => report.alltest.status == "2");

      return reportsWithStatusOne.length;
    }
    return 0;
  }
}
