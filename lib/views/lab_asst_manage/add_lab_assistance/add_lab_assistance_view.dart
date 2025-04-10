import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';

import '../../../helpers/widget_helpers.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/primary_button.dart';
import 'add_lab_assistance_controller.dart';

class AddLabAssistanceView extends GetView<AddLabAssistanceController> {
  const AddLabAssistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 5, 153),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(controller.authServiceImpl.userData!.labName ?? "",
            style:
                ThemeText.bodyOne.copyWith(color: Colors.white, fontSize: 20)),
      ),
      body: WidgetHelpers.pagePadding(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 25.0),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: SizedBox(
                //       height: 35,
                //       child: Text(
                //           controller.authServiceImpl.userData!.labName ?? "",
                //           style: ThemeText.bodyOne
                //               .copyWith(color: Colors.grey, fontSize: 20)),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text("Asst Name:", style: ThemeText.bodyOne),
                          ),
                          fieldform(
                            context,
                            "Enter Asst Name",
                            controller.asstNameController,
                            validator: (value) => value
                                .toString()
                                .validateField(fieldName: "Name"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text("Qualification:",
                                style: ThemeText.bodyOne),
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
                                  'Qualification',
                                  style: ThemeText.bodyOne_50,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                isExpanded: true,
                                value: controller.selectedQualification.isEmpty
                                    ? null
                                    : controller.selectedQualification.value,
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    controller.selectedQualification.value =
                                        newValue;
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
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child:
                                Text("Mobile No.:", style: ThemeText.bodyOne),
                          ),
                          fieldformPhone(
                            10,
                            context,
                            "Enter Mobile No",
                            controller.mobilenoController,
                            validator: (value) => value
                                .toString()
                                .validateField(fieldName: "Mobile No"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text("Pin:", style: ThemeText.bodyOne),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: Get.width,
                              child: CustomTextField(
                                controller: controller.pinController,
                                maxLength: 8,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) => value
                                    .toString()
                                    .validatePinField(
                                        fieldName: "PIN",
                                        value: value.toString()),
                                labelText: "PIN",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : PrimaryButton(
                          width: Get.width,
                          isPrimaryButton: false,
                          label: "Add",
                          onPressed: () => controller.registerLabAssistant(),
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
      BuildContext context, String hintText, TextEditingController controller,
      {String? Function(String?)? validator}) {
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
            hintText: hintText,
            hintStyle: ThemeText.bodyOne_50,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
    );
  }
}

Widget fieldformPhone(int? maximunLength, BuildContext context, String hintText,
    TextEditingController controller,
    {String? Function(String?)? validator}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLength: maximunLength,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: ThemeText.bodyOne_50,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    ),
  );
}
