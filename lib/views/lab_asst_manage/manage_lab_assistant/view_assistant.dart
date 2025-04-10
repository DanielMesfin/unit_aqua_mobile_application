import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/common/constants/colors.dart';

import '../../../helpers/widget_helpers.dart';
import '../../../model/lab_assistant/lab_assistant_detail_response.dart';
import '../../../themes/theme_text.dart';
import 'manage_lab_assistant_controller.dart';

class ViewLabAssistanceView extends GetView<ManageLabAssistantController> {
  const ViewLabAssistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final labAssistants = Get.arguments as LabAssistantDetailResponse;
    final assistant = labAssistants.result;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ConstantColors.appBarIconColor,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ConstantColors.appBarBackgroundColor,
        elevation: 0,
        title: Text(
          "Assistant Detail",
          style:
              ThemeText.bodyThree.copyWith(color: Colors.white, fontSize: 18),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: _buildPersonIcon(assistant.name),
                ),
                const SizedBox(height: 20),
                _buildField("Assistant Name", assistant.name),
                const SizedBox(height: 8),
                _buildField("Qualification", assistant.qualification),
                const SizedBox(height: 8),
                _buildField("Mobile No.", assistant.phoneNumber),
                const SizedBox(height: 8),
                _buildField("Pin", assistant.pin),
                const SizedBox(height: 8),
                _buildField("Lab Name", assistant.labName),
                const SizedBox(height: 8),
                _buildField(
                  "Created Date",
                  _formattedDate(assistant.createdAt),
                ),
                const SizedBox(height: 8),
                _buildField(
                  "Last Updated Date",
                  _formattedDate(assistant.updatedAt),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonIcon(String assistantName) {
    return Column(
      children: [
        const Icon(
          Icons.contact_page,
          size: 75,
          color: Colors.blue,
        ),
        const SizedBox(height: 8),
        Text(
          assistantName,
          style: ThemeText.bodyTwo.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildField(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: ThemeText.bodyOne.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: ThemeText.bodyOne.copyWith(color: Colors.black87),
          ),
        ],
      ),
    );
  }

  String _formattedDate(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    return DateFormat("MMM dd yyyy").format(dateTime);
  }
}
