import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/widgets/logimage.dart';
import 'package:unity_labs/widgets/powered_by_field.dart';

import '../../helpers/widget_helpers.dart';
import '../../routes/app_pages.dart';
import '../../themes/theme_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: WidgetHelpers.pagePadding(
            child: Obx(
              () => Form(
                key: controller.formKey,
                child: controller.isFirstPage.isTrue
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LogImage(),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Register',
                              style: ThemeText.headlineOne,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Cillum sunt reprehenderit esse magna proident id duis consectetur sit.',
                            style: ThemeText.bodyOne,
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            controller: controller.phoneController,
                            prefixText: "+91",
                            labelText: "Mobile Number",
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) => value
                                .toString()
                                .validatePhoneField(fieldName: "Mobile No."),
                          ),
                          CustomTextField(
                            controller: controller.pinController,
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) => value
                                .toString()
                                .validatePinField(
                                    fieldName: "PIN", value: value.toString()),
                            labelText: "PIN",
                          ),
                          CustomTextField(
                            controller: controller.nameController,
                            labelText: "Name",
                            validator: (value) => value
                                .toString()
                                .validateField(fieldName: "Name"),
                          ),
                          Container(
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
                              hint: const Text('Qualification'),
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
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: Get.height * 0.02,
                            ),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: const Color(0xfff2f2f2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Obx(() => DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle,
                                  ),
                                  hint: const Text('State'),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  isExpanded: true,
                                  value: controller.selectedState.isEmpty
                                      ? null
                                      : controller.selectedState.value,
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      controller.selectedState.value = newValue;

                                      controller.selectedDistrict.value =
                                          controller.stateDistricts[newValue]
                                                  ?.first ??
                                              '';
                                    }
                                  },
                                  items: controller.states
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'State should be selected';
                                    }
                                    return null;
                                  },
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: Get.height * 0.02,
                            ),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: const Color(0xfff2f2f2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Obx(() => DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle,
                                  ),
                                  hint: const Text('District'),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  isExpanded: true,
                                  value: controller.selectedDistrict.isEmpty
                                      ? null
                                      : controller.selectedDistrict.value,
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      controller.selectedDistrict.value =
                                          newValue;
                                    }
                                  },
                                  items: (controller.stateDistricts[
                                              controller.selectedState.value] ??
                                          [])
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'District should be selected';
                                    }
                                    return null;
                                  },
                                )),
                          ),
                          CustomTextField(
                            controller: controller.areaController,
                            labelText: "Area",
                            validator: (value) => value
                                .toString()
                                .validateField(fieldName: "Area"),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: PrimaryButton(
                              hasLoading: true,
                              isLoading: controller.isLoading,
                              width: Get.width * .8,
                              label: "Next",
                              onPressed: () {
                                final isValid =
                                    controller.formKey.currentState!.validate();
                                if (!isValid) {
                                  return;
                                }
                                controller.isFirstPage.toggle();
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 1,
                                width: Get.width * .4,
                                color: Colors.grey[300],
                              ),
                              Text(
                                'Or',
                                style: ThemeText.bodyOne,
                              ),
                              Container(
                                height: 1,
                                width: Get.width * .4,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: PrimaryButton(
                              width: Get.width * .8,
                              isPrimaryButton: false,
                              label: "Login",
                              onPressed: () => Get.offNamed(Routes.login),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      )
                    : WillPopScope(
                        onWillPop: () async {
                          controller.isFirstPage.toggle();
                          return false;
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.labNameController,
                              labelText: "Lab Name",
                              validator: (value) => value
                                  .toString()
                                  .validateField(fieldName: "Lab Name"),
                            ),
                            CustomTextField(
                              readOnly: true,
                              onTap: () => controller.pickImage(1),
                              labelText: "Logo",
                              suffixIcon: Icons.upload,
                            ),
                            if (controller.isFetched1.isTrue)
                              SizedBox(
                                width: Get.width,
                                height: Get.height * 0.15,
                                child: WidgetHelpers.clipRRect(
                                  child: Image.file(
                                    File(controller.logoImage!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            CustomTextField(
                              readOnly: true,
                              onTap: () => controller.pickImage(2),
                              labelText: "Name board Image",
                              suffixIcon: Icons.upload,
                            ),
                            if (controller.isFetched2.isTrue)
                              SizedBox(
                                width: Get.width,
                                height: Get.height * 0.15,
                                child: WidgetHelpers.clipRRect(
                                  child: Image.file(
                                    File(controller.nameBoardImage!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            CustomTextField(
                              readOnly: true,
                              onTap: () => controller.pickImage(3),
                              labelText: "Lab Report Image",
                              suffixIcon: Icons.upload,
                            ),
                            if (controller.isFetched3.isTrue)
                              SizedBox(
                                width: Get.width,
                                height: Get.height * 0.15,
                                child: WidgetHelpers.clipRRect(
                                  child: Image.file(
                                    File(controller.labReportImage!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Center(
                              child: PrimaryButton(
                                hasLoading: true,
                                isLoading: controller.isLoading,
                                width: Get.width * .8,
                                label: "Signup",
                                onPressed: () => controller.signup(),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Center(child: const PoweredByText()),
                            SizedBox(
                              height: Get.height * 0.05,
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
