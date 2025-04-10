// import 'package:get/get.dart';
// import 'dart:developer';
// import 'package:unity_labs/model/completed/completed_list.dart';
// import 'package:unity_labs/services/completed/completed_service_impl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'chart_data.dart';

// class MyWorkRecordsController extends GetxController {
//   final CompletedServiceImpl _completedService =
//       Get.put(CompletedServiceImpl());
//   final completedList = Rx<CompletedList?>(null);
//   final isLoading = false.obs;
//   late String testId;
//   final RxString selectedFilter = "today".obs;

//   final List<RxString> filters = [
//     'today'.obs,
//     'yesterday'.obs,
//     'thisWeek'.obs,
//     'thisMonth'.obs,
//     'dateRange'.obs
//   ];
//   @override
//   void onInit() {
//     super.onInit();

//     getAllCompletedList().then((response) {
//       if (response != null) {
//         completedList.value = response;
//       }
//     });
//     if (Get.arguments != null) {
//       testId = Get.arguments['testId'];
//     }
//   }

//   void onFilterChanged(String? newValue) async {
//     if (newValue != null) {
//       selectedFilter.value = newValue;
//       await getAllCompletedList().then((response) {
//         if (response != null) {
//           completedList.value = response;
//         }
//       });
//     }
//   }

//   Future<CompletedList?> getAllCompletedList() async {
//     isLoading(true);
//     try {
//       final response =
//           await _completedService.completedList(dateTime: selectedFilter.value);
//       inspect(response);
//       if (response.response == "SUCCESS") {
//         return response;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       inspect(e);
//       return null;
//     } finally {
//       isLoading(false);
//     }
//   }

//   // void setCompletedList(CompletedList? data) {
//   //   completedList.value = data;
//   // }

//   int getWaterTypeCount(CompletedList? completedList) {
//     if (completedList != null && completedList.result != null) {
//       return completedList.result!.water!.length;
//     }
//     return 0;
//   }

//   int getFishTypeCount(CompletedList? completedList) {
//     if (completedList != null && completedList.result != null) {
//       return completedList.result!.fish!.length;
//     }
//     return 0;
//   }

//   int getShrimpTypeCount(CompletedList? completedList) {
//     if (completedList != null && completedList.result != null) {
//       return completedList.result!.shrimp!.length;
//     }
//     return 0;
//   }

//   int getSoilTypeCount(CompletedList? completedList) {
//     if (completedList != null && completedList.result != null) {
//       return completedList.result!.soil!.length;
//     }
//     return 0;
//   }

//   int getPCRTypeCount(CompletedList? completedList) {
//     if (completedList != null && completedList.result != null) {
//       return completedList.result!.pcr!.length;
//     }
//     return 0;
//   }

//   int getFeedTypeCount(CompletedList? completedList) {
//     if (completedList != null && completedList.result != null) {
//       return completedList.result!.feed!.length;
//     }
//     return 0;
//   }

//   int getCultureTypeCount(CompletedList? completedList) {
//     if (completedList != null && completedList.result != null) {
//       return completedList.result!.culture!.length;
//     }
//     return 0;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:developer';

import 'package:unity_labs/model/completed/completed_list.dart';
import 'package:unity_labs/services/completed/completed_service_impl.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/views/my_work_records/chart_data.dart';
import 'package:unity_labs/widgets/primary_button.dart';

class MyWorkRecordsController extends GetxController {
  final CompletedServiceImpl _completedService =
      Get.put(CompletedServiceImpl());
  final completedList = Rx<CompletedList?>(null);
  final isLoading = false.obs;
  // late List<ChartData> data;
  var data = <ChartData>[].obs;
  late TooltipBehavior tooltip;
  late String testId;
  final RxString selectedFilter = "today".obs;
  final List<String> filters = [
    'today',
    'yesterday',
    'thisWeek',
    'thisMonth',
    'dateRange'
  ];
  @override
  void onInit() {
    tooltip = TooltipBehavior(enable: true);

    super.onInit();

    getAllCompletedList("").then((response) {
      if (response != null) {
        completedList.value = response;
        data = [
          ChartData('Water', getWaterTypeCount(completedList.value)),
          ChartData('Fish', getFishTypeCount(completedList.value)),
          ChartData('Shrimp', getShrimpTypeCount(completedList.value)),
          ChartData('Soil', getSoilTypeCount(completedList.value)),
          ChartData('PCR', getPCRTypeCount(completedList.value)),
          ChartData('Feed', getFeedTypeCount(completedList.value)),
          ChartData('Culture', getCultureTypeCount(completedList.value)),
        ].obs;
      }
    });
    if (Get.arguments != null) {
      testId = Get.arguments['testId'];
    }
  }

  void onFilterChanged(String? newValue) async {
    if (newValue == "dateRange") {
      showDateRangePicker(Get.context!);
    } else if (newValue != null) {
      selectedFilter.value = newValue;
      await getAllCompletedList("").then((response) {
        if (response != null) {
          completedList.value = response;
          data = [
            ChartData('Water', getWaterTypeCount(completedList.value)),
            ChartData('Fish', getFishTypeCount(completedList.value)),
            ChartData('Shrimp', getShrimpTypeCount(completedList.value)),
            ChartData('Soil', getSoilTypeCount(completedList.value)),
            ChartData('PCR', getPCRTypeCount(completedList.value)),
            ChartData('Feed', getFeedTypeCount(completedList.value)),
            ChartData('Culture', getCultureTypeCount(completedList.value)),
          ].obs;
        }
      });
    } else {
      print("No Filter Selected");
    }
  }

  void showDateRangePicker(BuildContext context) async {
    DateTime? startDate;
    DateTime? endDate;
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Date Range',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    color: CustomColors.primaryAccentColor,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Date'),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: startDate ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              setState(() {
                                startDate = pickedDate;
                              });
                                                        },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                startDate != null
                                    ? dateFormat.format(startDate!)
                                    : 'Select Start Date',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('End Date'),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: endDate ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              setState(() {
                                endDate = pickedDate;
                              });
                                                        },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                endDate != null
                                    ? dateFormat.format(endDate!)
                                    : 'Select End Date',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: "Confirm",
                      onPressed: () async {
                        if (startDate != null && endDate != null) {
                          String datevalue = '$startDate&$endDate';
                          print(
                              "these is the selected filter: $selectedFilter");
                          Navigator.pop(context);
                          await getAllCompletedList(datevalue).then((response) {
                            if (response != null) {
                              completedList.value = response;
                              data = [
                                ChartData('Water',
                                    getWaterTypeCount(completedList.value)),
                                ChartData('Fish',
                                    getFishTypeCount(completedList.value)),
                                ChartData('Shrimp',
                                    getShrimpTypeCount(completedList.value)),
                                ChartData('Soil',
                                    getSoilTypeCount(completedList.value)),
                                ChartData('PCR',
                                    getPCRTypeCount(completedList.value)),
                                ChartData('Feed',
                                    getFeedTypeCount(completedList.value)),
                                ChartData('Culture',
                                    getCultureTypeCount(completedList.value)),
                              ].obs;
                            }
                          });

                          // Process your selected date range here
                          print(
                              'Selected Start Date: ${dateFormat.format(startDate!)}');
                          print(
                              'Selected End Date: ${dateFormat.format(endDate!)}');
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<CompletedList?> getAllCompletedList(String? dateTimeC) async {
    isLoading(true);
    try {
      final response = await _completedService.completedList(
          dateTime: dateTimeC != "" ? dateTimeC : selectedFilter.value);
      inspect(response);
      if (response.response == "SUCCESS") {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      inspect(e);
      return null;
    } finally {
      dateTimeC = null;
      isLoading(false);
    }
  }

  // void setCompletedList(CompletedList? data) {
  //   completedList.value = data;
  // }

  int getWaterTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.water!.length;
    }
    return 0;
  }

  int getFishTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.fish!.length;
    }
    return 0;
  }

  int getShrimpTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.shrimp!.length;
    }
    return 0;
  }

  int getSoilTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.soil!.length;
    }
    return 0;
  }

  int getPCRTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.pcr!.length;
    }
    return 0;
  }

  int getFeedTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.feed!.length;
    }
    return 0;
  }

  int getCultureTypeCount(CompletedList? completedList) {
    if (completedList != null && completedList.result != null) {
      return completedList.result!.culture!.length;
    }
    return 0;
  }
}
