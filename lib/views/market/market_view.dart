import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/model/market/market_zone_model.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import '../../themes/theme_text.dart';
import 'market_controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${Get.arguments["name"]} Market",
          style: ThemeText.headlineOne.copyWith(color: Colors.black),
        ),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Container(
                    decoration: WidgetHelpers.allRoundedRectangle(
                      color: CustomColors.primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width * .6,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<MarketZoneModel>(
                        value: controller.currentZone!.value,
                        dropdownColor: CustomColors.primaryColor,
                        iconEnabledColor: Colors.white,
                        items: controller.marketZoneList!
                            .map(
                              (zone) => DropdownMenuItem<MarketZoneModel>(
                                value: zone,
                                child: Text(
                                  zone.name ?? "",
                                  style: ThemeText.bodyOne
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (zone) async {
                          controller.currentZone!.value = zone!;
                          await controller.calculate();
                        },
                      ),
                    ),
                  ),
                  if (controller.id == 1)
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Center(
                          child: Container(
                            decoration: WidgetHelpers.allRoundedRectangle(
                              color: CustomColors.primaryColor,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: Get.width * .6,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<MarketZoneModel>(
                                value: controller.currentType?.value,
                                dropdownColor: CustomColors.primaryColor,
                                iconEnabledColor: Colors.white,
                                items: controller.marketTypeList
                                    .map(
                                      (type) =>
                                          DropdownMenuItem<MarketZoneModel>(
                                        value: type,
                                        child: Text(
                                          type.name ?? "",
                                          style: ThemeText.bodyOne
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (type) async {
                                  controller.currentType?.value = type!;
                                  await controller.calculate();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                          children: [
                            Text(controller.id == 1 ? "Size" : "Count",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Rate',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        ...controller.marketTypeData.map((data) => TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data.count.toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data.rate.toString()),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
