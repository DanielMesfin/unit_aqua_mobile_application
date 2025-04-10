import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';

import '../../../helpers/widget_helpers.dart';
import '../../../model/lab_assistant/lab_assistant_detail_response.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/primary_button.dart';
import 'manage_lab_assistant_controller.dart';

class EditLabAssistanceView extends GetView<ManageLabAssistantController> {
  const EditLabAssistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    final labAssistants = Get.arguments as LabAssistantDetailResponse;
    final assistant = labAssistants.result;
    controller.phoneNumberController.text = assistant.phoneNumber.toString();
    controller.nameController.text = assistant.name.toString();
    controller.pinController.text = assistant.pin.toString();

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
        title: Text(
          "Edit Assistant",
          style: ThemeText.bodyOne
              .copyWith(color: ConstantColors.appBarTextColor, fontSize: 20),
        ),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: GlobalKey<FormState>(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text("Assistant Name:", style: ThemeText.bodyOne),
                    ),
                    fieldform(
                      context,
                      "Enter Assistant Name",
                      controller.nameController,
                      placeholder: assistant.name ?? "",
                      validator: (value) =>
                          value.toString().validateField(fieldName: "Name"),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 120,
                //       child: Text("Qualification:", style: ThemeText.bodyOne),
                //     ),
                //     fieldform(
                //       context,
                //       "Enter Qualification",
                //       controller.qualificationController,
                //       placeholder: assistant.qualification ?? "",
                //       validator: (value) => value
                //           .toString()
                //           .validateField(fieldName: "Qualification"),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text("Qualification:", style: ThemeText.bodyOne),
                    ),
                    // fieldform(
                    //   context,
                    //   "Enter Qualification",
                    //   controller.qualificationController,
                    //   validator: (value) => value
                    //       .toString()
                    //       .validateField(fieldName: "Qualification"),
                    // ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Get.height * 0.02,
                        ),
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: const Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                          ),
                          hint: Text(
                            assistant.qualification ?? "Select Qualification",
                            style: ThemeText.bodyOne_50,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          isExpanded: true,
                          value: controller.selectedQualification.isEmpty
                              ? null
                              : controller.selectedQualification.value,
                          onChanged: (newValue) {
                            if (newValue != null) {
                              controller.selectedQualification.value = newValue;
                            }
                          },
                          items: controller.qualification
                              .map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(value.toString()),
                              );
                            },
                          ).toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Qualification should be selected';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text("Mobile No.:", style: ThemeText.bodyOne),
                    ),
                    fieldformPhone(
                      10,
                      context,
                      "Enter Mobile No",
                      controller.phoneNumberController,
                      placeholder: assistant.phoneNumber ?? "",
                      validator: (value) => value
                          .toString()
                          .validateField(fieldName: "Mobile No"),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(children: [
                  SizedBox(
                    width: 120,
                    child: Text("Pin:", style: ThemeText.bodyOne),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: Get.width,
                      child: CustomTextField(
                          maxLength: 8,
                          controller: controller.pinController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) => value
                              .toString()
                              .validatePinField(
                                  fieldName: "PIN", value: value.toString()),
                          labelText: assistant.pin),
                    ),
                  ),
                ]),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 120,
                //       child: Text("Pin:", style: ThemeText.bodyOne),
                //     ),
                //     fieldform(
                //       context,
                //       "Enter pin code",
                //       controller.pinController,
                //       placeholder: assistant.pin ?? "",
                //       //TextEditingController(text: assistant.pin),
                //       validator: (value) => value.toString().validatePinField(
                //           fieldName: "Pin",
                //           value: controller.pinController.text),
                //     ),
                //   ],
                // ),

                const SizedBox(height: 50),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PrimaryButton(
                          width: Get.width * 0.9,
                          isPrimaryButton: false,
                          label: "Update",
                          onPressed: () => controller.updateLabAssistant(10),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldform(
    BuildContext context,
    String hintText,
    TextEditingController controller, {
    String? Function(String?)? validator,
    String? placeholder,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder ?? hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
    );
  }
}

Widget fieldformPhone(
  int maxLength,
  BuildContext context,
  String hintText,
  TextEditingController controller, {
  String? Function(String?)? validator,
  String? placeholder,
}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLength: maxLength,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: placeholder ?? hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    ),
  );
}
