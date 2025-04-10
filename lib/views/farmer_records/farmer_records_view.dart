import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/theme_text.dart';
import '../../widgets/powered_by_field.dart';
import 'farmer_card.dart';
import 'farmer_records_controller.dart';

class FarmerRecordsView extends GetView<FarmerRecordsController> {
  const FarmerRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search with phone number",
                        hintStyle: ThemeText.bodyOne,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      controller: controller.searchController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) async {
                        await controller.searchFarmer();
                        // await controller.searchResult();
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.grey[300],
                //     borderRadius: BorderRadius.circular(12.0),
                //   ),
                //   child: IconButton(
                //     icon: const Icon(Icons.tune),
                //     onPressed: () {
                //       //  filter functionality here
                //       // controller.filterFarmer();
                //     },
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.tune),
                    onSelected: controller.getAllFarmersWithFilter,
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: "all",
                          child: Text("All"),
                        ),
                        PopupMenuItem<String>(
                          value: "fish",
                          child: Text("Fish"),
                        ),
                        PopupMenuItem<String>(
                          value: "shrimp",
                          child: Text("Shrimp"),
                        ),
                        PopupMenuItem<String>(
                          value: "poly",
                          child: Text("Poly"),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () {
              return controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: controller.searchController.text.isEmpty
                          ? ListView.builder(
                              itemCount:
                                  controller.allFarmers.value?.result?.length,
                              itemBuilder: (context, index) {
                                var farmer =
                                    controller.allFarmers.value?.result?[index];
                                return FarmerCard(
                                  farmerName: farmer?.name ?? "",
                                  area: farmer?.area ?? "",
                                  farmerPhone: farmer?.phoneNumber,
                                );
                              },
                            )
                          : controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.allFarmers.value == null
                                  ? ListView.builder(
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return FarmerCard(
                                          farmerName:
                                              "No Farmer with this phone",
                                          area: "Create a new farmer",
                                          farmerPhone: " THANK",
                                        );
                                      })
                                  : ListView.builder(
                                      itemCount: controller
                                          .allFarmers.value?.result?.length,
                                      itemBuilder: (context, index) {
                                        var farmer = controller
                                            .allFarmers.value?.result?[index];
                                        return FarmerCard(
                                          farmerName: farmer!.name!,
                                          area: farmer.area!,
                                          farmerPhone: farmer.phoneNumber!,
                                        );
                                      },
                                    ));
            },
          ),
          const PoweredByText(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
