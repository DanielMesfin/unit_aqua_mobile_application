import 'package:flutter/material.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:get/get.dart';
import 'package:unity_labs/views/lab_asst_manage/login_requests/requests_card.dart';

import '../../../model/lab_assistant/lab_assistant_pending.dart';
import 'login_requests_controller.dart';

class LoginRequestsView extends GetView<LoginRequestsController> {
  const LoginRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          "Login Requests",
          style: ThemeText.headlineTwo
              .copyWith(color: ConstantColors.appBarTextColor),
        ),
      ),
      body: FutureBuilder<LabAssistantPending>(
        future: controller.getPendingLabAssistants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            final labAssistants = snapshot.data?.result ?? [];
            return ListView.builder(
              itemCount: labAssistants.length,
              itemBuilder: (context, index) {
                return LoginRequestCard(
                  labAssistantName: labAssistants[index].name,
                  labAssistantId: labAssistants[index].id.toString(),
                  labAssistantphone: labAssistants[index].phoneNumber,
                );
              },
            );
          }
        },
      ),
    );
  }
}
