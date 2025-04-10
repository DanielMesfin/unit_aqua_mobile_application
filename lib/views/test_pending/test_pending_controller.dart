import 'package:get/get.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';

import '../../model/test/test_pending/test_pending.dart';
import '../../services/test/test_service_impl.dart';

import 'dart:developer';

class TestPendingController extends GetxController {
  final TestServiceImpl _testService = Get.put(TestServiceImpl());
  final _authServiceImpl = Get.find<AuthServiceImpl>();
  //final testPending = TestPending().obs;
  final testPending = Rx<TestPending?>(null);
  final isLoading = false.obs;
  late String testId;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      testId = Get.arguments['testId'];
    }
    getAllPendingTest().then((response) {
      if (response != null) {
        setTestPending(response);
        print(response);
        print("###########################");
      }
    });
  }

  Future<TestPending?> getAllPendingTest() async {
    final userId = _authServiceImpl.userData!.id;
    isLoading(true);
    try {
      final response = await _testService.pendingTests(userId: userId!);
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

  Future<void> deleteTest(String testId) async {
    isLoading(true);
    try {
      final response = await _testService.deleteTest(testId: testId);
      print("#############################delete");
      if (response.statusCode != 200) {
        Get.back();
      }
    } catch (e) {
      inspect(e);
    } finally {
      getAllPendingTest().then((response) {
        if (response != null) {
          setTestPending(response);
          print(response);
          print("########################### returning");
        }
      });
      isLoading(false);
    }
  }

  void setTestPending(TestPending? data) {
    testPending.value = data;
  }

  int getWaterTypeCount(TestPending? testPending) {
    if (testPending != null) {
      return testPending.result.water.length;
    }
    return 0;
  }

  int getFishTypeCount(TestPending? testPending) {
    if (testPending != null) {
      return testPending.result.fish.length;
    }
    return 0;
  }

  int getShrimpTypeCount(TestPending? testPending) {
    if (testPending != null) {
      return testPending.result.shrimp.length;
    }
    return 0;
  }

  int getSoilTypeCount(TestPending? testPending) {
    if (testPending != null) {
      return testPending.result.soil.length;
    }
    return 0;
  }

  int getPCRTypeCount(TestPending? testPending) {
    if (testPending != null) {
      return testPending.result.pcr.length;
    }
    return 0;
  }

  int getFeedTypeCount(TestPending? testPending) {
    if (testPending != null) {
      return testPending.result.feed.length;
    }
    return 0;
  }

  int getCultureTypeCount(TestPending? testPending) {
    if (testPending != null) {
      return testPending.result.culture.length;
    }
    return 0;
  }
}
