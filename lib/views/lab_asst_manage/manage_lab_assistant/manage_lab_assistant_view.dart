import 'package:flutter/material.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:get/get.dart';

import '../../../model/lab_assistant/lab_assistant_list_response.dart';
import 'manage_lab_assistant_controller.dart';

class ManageLabAssistantView extends GetView<ManageLabAssistantController> {
  const ManageLabAssistantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 5, 153),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30.0, // Set the icon size
          onPressed: () {
            Navigator.pop(context); // Handle back action
          },
        ),
        title: Text("Manage Assistant",
            style:
                ThemeText.bodyOne.copyWith(color: Colors.white, fontSize: 20)),
      ),
      body: FutureBuilder<LabAssistantListResponse>(
        future: controller.getAllLabAssistants(),
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
                return buildAssistantRow(context, labAssistants[index].name,
                    labAssistants[index].id.toString());
              },
            );
          }
        },
      ),
    );
  }

  Widget buildAssistantRow(
      BuildContext context, String assistantName, String assistantId) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
              ),
              SizedBox(width: 8),
              Text(
                assistantName.length > 12
                    ? '${assistantName.substring(0, 10)}...'
                    : assistantName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: ThemeText.bodyOne.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    controller.viewAssistantDetails(context, assistantId);
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    controller.editAssistant(context, assistantId);
                  },
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteAssistantPopUp(context, assistantId, () {
                      controller.deleteAssistant(assistantId.toString());
                      Get.snackbar(
                        "Done",
                        "Deleted Successfully",
                        backgroundColor: Colors.green,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      Get.back();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
