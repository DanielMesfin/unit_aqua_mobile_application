import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/theme_button.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/primary_button.dart';
import 'login_requests_controller.dart';

class LoginRequestCard extends GetView<LoginRequestsController> {
  final String labAssistantName;
  final String labAssistantId;
  final String labAssistantphone;

  const LoginRequestCard(
      {required this.labAssistantName,
      required this.labAssistantId,
      required this.labAssistantphone,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0).add(
                  const EdgeInsets.only(right: 10.0, left: 10),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          labAssistantName.length > 14
                              ? '${("Name: $labAssistantName").substring(0, 14)}...'
                              : "Name: $labAssistantName",
                          style: ThemeText.bodyBoldOne),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(labAssistantphone,
                          overflow: TextOverflow.fade,
                          style: ThemeText.bodyBoldOne),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    height: 40,
                    width: 80,
                    label: "Accept",
                    onPressed: () {
                      print("Accept $labAssistantId");
                      int? userAssistantId = int.tryParse(labAssistantId);
                      controller.updateLabAssistant(
                          userAssistantId!, "Approved");
                    },
                  ),
                  PrimaryButton(
                    height: 40,
                    width: 80,
                    buttonStyle: ThemeButton.redButtonStyle,
                    label: "Reject",
                    onPressed: () {
                      print("Reject $labAssistantId");
                      int? userAssistantId = int.tryParse(labAssistantId);
                      controller.updateLabAssistant(
                          userAssistantId!, "Rejected");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
