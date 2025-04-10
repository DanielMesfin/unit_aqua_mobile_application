import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/theme_text.dart';
import '../../themes/theme_button.dart';
import '../../widgets/primary_button.dart';
import 'login_lab_assist_controller.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class LoginLabAssistView extends GetView<LoginLabAssistController> {
  const LoginLabAssistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 35,
                  child: Text("Lab Assistant Waiting Screen",
                      style: ThemeText.bodyOne
                          .copyWith(color: Colors.grey, fontSize: 20)),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Status: ${controller.status.value}",
                    style: ThemeText.bodyOne
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                ),
              );
            }),
            Obx(() {
              return controller.showManualCheckButton.value
                  ? Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "The status check will automatically happen in",
                                textAlign: TextAlign.justify,
                                style: ThemeText.bodyOne.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          CircularCountDownTimer(
                            duration: controller.countdown * 60,
                            initialDuration: 0,
                            controller: CountDownController(),
                            width: 150,
                            height: 150,
                            ringColor: Colors.grey[300]!,
                            ringGradient: null,
                            fillColor: Colors.blue,
                            fillGradient: null,
                            backgroundColor: Colors.white,
                            backgroundGradient: null,
                            strokeWidth: 5.0,
                            strokeCap: StrokeCap.round,
                            textStyle: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textFormat: CountdownTextFormat.MM_SS,
                            isReverse: true,
                            isReverseAnimation: false,
                            isTimerTextShown: true,
                            autoStart: true,
                            onComplete: () {
                              controller.checkStatus();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildDividerWithText("or"),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Check the status manually now",
                                textAlign: TextAlign.justify,
                                style: ThemeText.bodyOne.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: PrimaryButton(
                              width: Get.width * 0.9,
                              height: 60,
                              isPrimaryButton: false,
                              buttonStyle: ThemeButton.redButtonStyle.copyWith(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.green)),
                              label: "Check Status Now",
                              onPressed: () => controller.checkStatus(),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          Text(
                            "check in progress...",
                            style: ThemeText.bodyOne
                                .copyWith(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 25,
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1.0,
          ),
        ),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }
}
