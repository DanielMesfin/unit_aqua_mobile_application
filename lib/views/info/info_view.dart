import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/widgets/telugan_luna_calander.dart';
import 'package:unity_labs/widgets/weater_card.dart';
import 'package:unity_labs/widgets/weather_card.dart';
import 'info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    const weatherAssets = {
      'clear': {
        'video': 'assets/video/wind.mp4',
        'sound': 'assets/video/raina.mp3'
      },
      'rain': {
        'video': 'assets/videos/rainy.mp4',
        'sound': 'assets/sounds/rain.mp3'
      },
      'storm': {
        'video': 'assets/videos/stormy.mp4',
        'sound': 'assets/sounds/storm.mp3'
      },
    };
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: VideoWidget(
                    videoPath: 'assets/video/wind.mp4',
                    audioPath: 'assets/video/raina.mp3'),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.isTrue
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: <Widget>[
                      const SizedBox(height: 60),
                      controller.weatherData != null
                          // ? WeatherNewCard(weatherData: controller.weatherData!)
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: WeatherCard(
                                  weatherData: controller.weatherData!),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      // VideoWidget(
                      //   'assets/video/wind.mp4',
                      // ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: LunarCalendarScreen(),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      color:
                                          const Color.fromARGB(255, 40, 3, 161),
                                    ),
                                  ),
                                  Text(
                                    'Calculators',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      color:
                                          const Color.fromARGB(255, 40, 3, 161),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 130,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, i) =>
                                      calcluatorWidget("Calculator ${i + 1}"),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: 30),
                                  itemCount: 3,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      color:
                                          const Color.fromARGB(255, 40, 3, 161),
                                      // width: 80,
                                    ),
                                  ),
                                  Text(
                                    'Markets',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 2,
                                      color:
                                          const Color.fromARGB(255, 40, 3, 161),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 50,
                                width: Get.width,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, i) => InkWell(
                                    onTap: () =>
                                        Get.toNamed(Routes.market, arguments: {
                                      "name": controller.marketList[i].name,
                                      "marketId": controller.marketList[i].id,
                                    }),
                                    child: Container(
                                      width: Get.width * 0.32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color.fromARGB(
                                            255, 40, 3, 161),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(controller.iconsName[i],
                                                size: 25, color: Colors.white),
                                            SizedBox(width: 20),
                                            Text(
                                              controller.marketList[i].name
                                                  .toString(),
                                              style:
                                                  ThemeText.headlineWhiteThree,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: 20),
                                  itemCount: controller.marketList.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget calcluatorWidget(String name) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.calculator, arguments: name),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: WidgetHelpers.allRoundedRectangle(
              color: Color(0xFF3b4c68),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: ThemeText.bodyOne_50,
          ),
        ],
      ),
    );
  }
}
