import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/constants/colors.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/edit_treatment/edit_treatment_controller.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

import '../../model/treatment/problem_model.dart';
import '../../widgets/custom_carousel_slider.dart';
import '../../widgets/custom_carousel_slider_indicator.dart';

class EditTreatmentView extends GetView<EditTreatmentController> {
  const EditTreatmentView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.descriptionController.text =
        controller.treatment.description ?? '';
    controller.nameController.text = controller.treatment.name ?? '';
    controller.problemId = controller.treatment.problemId!;
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
          "Edit Treatment",
          style: ThemeText.headlineTwo
              .copyWith(color: ConstantColors.appBarTextColor),
        ),
      ),
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
                            hint: Text(controller.treatment.problem!.name ??
                                "Problem"),
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
                                  value:
                                      controller.treatment.problem!.name ?? value.id.toString(),
                                  child: Text(value.name.toString()),
                                );
                              },
                            ).toList(),
                            // validator: (value) {
                            //   if (value == null) {
                            //     return 'Problem should be selected';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        CustomTextField(
                          readOnly: true,
                          onTap: () => controller.pickImage(),
                          labelText: "Images",
                          suffixIcon: Icons.upload,
                        ),
                        Column(
                          children: <Widget>[
                            CustomCarouselSlider(
                              height: 200,
                              // height: Get.height * .'3,
                              autoPlay: true,
                              onPageChanged: (index, reason) =>
                                  controller.currentIndex.value = index,
                              itemCount: controller.treatment.imgUrls.length,
                              itemBuilder: (ctx, i, realIndex) =>
                                  WidgetHelpers.clipRRect(
                                child: Image(
                                  image: NetworkImage(
                                      controller.treatment.imgUrls[i]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: CustomCarouselSliderIndicator(
                                currentIndex: controller.currentIndex,
                                itemCount:
                                    controller.treatment.imgUrls.length,
                              ),
                            ),
                          ],
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
                          // initialValue: controller.treatment.description,
                          validator: (value) => value
                              .toString()
                              .validateField(fieldName: "Description"),
                        ),
                        SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            hasLoading: true,
                            isLoading: controller.isSaveLoading,
                            width: 150,
                            label: "Update Treatment",
                            onPressed: () => controller.updateTreatment(
                                false, controller.treatment.id),
                          ),
                        ),
                        // PrimaryButton(
                        //   hasLoading: true,
                        //   isLoading: controller.isSuggestLoading,
                        //   width: 150,
                        //   label: "Suggest to Global",
                        //   onPressed: () =>
                        //       controller.suggestGlobalTreatment(),
                        // ),
                        //   ],
                        // )
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
