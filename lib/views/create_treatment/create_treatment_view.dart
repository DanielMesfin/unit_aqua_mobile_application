import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../model/treatment/problem_model.dart';
import '../../widgets/custom_carousel_slider.dart';
import '../../widgets/custom_carousel_slider_indicator.dart';
import 'create_treatment_controller.dart';

class CreateTreatmentView extends GetView<CreateTreatmentController> {
  const CreateTreatmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: WidgetHelpers.pagePadding(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          labelText: "Name",
                          controller: controller.nameController,
                          validator: (value) =>
                              value.toString().validateField(fieldName: "Name"),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: Get.height * 0.02,
                          ),
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButtonFormField<String>(
                            hint: const Text('Problem Name'),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            isExpanded: true,
                            value: controller.selectedProblem.isEmpty
                                ? null
                                : controller.selectedProblem.value,
                            onChanged: (newValue) {
                              if (newValue != null) {
                                controller.problemId =
                                    int.tryParse(newValue) ?? 0;
                                controller.selectedProblem.value = newValue;
                              }
                            },
                            items: controller.problemList
                                .map<DropdownMenuItem<String>>(
                              (ProblemModel value) {
                                return DropdownMenuItem<String>(
                                  value: value.id.toString(),
                                  child: Text(value.name.toString()),
                                );
                              },
                            ).toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Problem should be selected';
                              }
                              return null;
                            },
                          ),
                        ),
                        CustomTextField(
                          readOnly: true,
                          onTap: () => controller.pickImage(),
                          labelText: "Images",
                          suffixIcon: Icons.upload,
                        ),
                        if (controller.isFetched.isTrue)
                          Column(
                            children: <Widget>[
                              CustomCarouselSlider(
                                height: 200,
                                // height: Get.height * .'3,
                                autoPlay: true,
                                onPageChanged: (index, reason) =>
                                    controller.currentIndex.value = index,
                                itemCount: controller.images.length,
                                itemBuilder: (ctx, i, realIndex) =>
                                    WidgetHelpers.clipRRect(
                                  child: Image.file(
                                    File(controller.images[i].path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: CustomCarouselSliderIndicator(
                                  currentIndex: controller.currentIndex,
                                  itemCount: controller.images.length,
                                ),
                              ),
                            ],
                          ),
                        CustomTextField(
                          controller: controller.descriptionController,
                          labelText: "Description",
                          keyboardType: TextInputType.multiline,
                          validator: (value) => value
                              .toString()
                              .validateField(fieldName: "Description"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            PrimaryButton(
                              hasLoading: true,
                              isLoading: controller.isSaveLoading,
                              width: 150,
                              label: "Save",
                              onPressed: () =>
                                  controller.createTreatment(false),
                            ),
                            PrimaryButton(
                              hasLoading: true,
                              isLoading: controller.isSuggestLoading,
                              width: 150,
                              label: "Suggest to Global",
                              onPressed: () =>
                                  controller.suggestGlobalTreatment(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
