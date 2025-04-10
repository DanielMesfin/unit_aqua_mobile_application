import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/edit_profile/edit_profile_controller.dart';
import 'package:unity_labs/widgets/custom_circle_avatar.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/powered_by_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => controller.authServiceImpl
                .logout(uiserId: controller.authServiceImpl.userData!.id!),
            icon: const Icon(
              Iconsax.logout,
              color: CustomColors.primaryColor,
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: WidgetHelpers.pagePadding(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                          child: CustomCircleAvatar(
                            initials: controller.authServiceImpl.userData?.name
                                    ?.substring(0, 2)
                                    .toUpperCase() ??
                                '',
                            fontSize: 40,
                            radius: 50,
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    controller.authServiceImpl.userData?.name ?? "",
                    style: ThemeText.headlineTwo.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: controller.nameController,
                  labelText: "Name",
                  validator: (value) =>
                      value.toString().validateField(fieldName: "Name"),
                ),
                CustomTextField(
                  controller: controller.phoneNumberController,
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
                    items:
                        controller.qualification.map<DropdownMenuItem<String>>(
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
                        hint: Text(
                            controller.authServiceImpl.userData?.state ?? ''),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        isExpanded: true,
                        value: controller.selectedState.isEmpty
                            ? null
                            : controller.selectedState.value,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedState.value = newValue;

                            controller.selectedDistrict.value =
                                controller.stateDistricts[newValue]?.first ??
                                    '';
                          }
                        },
                        items: controller.states.map<DropdownMenuItem<String>>(
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
                        hint: Text(
                            controller.authServiceImpl.userData?.district ??
                                ''),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        isExpanded: true,
                        value: controller.selectedDistrict.isEmpty
                            ? null
                            : controller.selectedDistrict.value,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.selectedDistrict.value = newValue;
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
                  validator: (value) =>
                      value.toString().validateField(fieldName: "Area"),
                ),
                CustomTextField(
                  controller: controller.labNameController,
                  labelText: "Lab Name",
                  validator: (value) =>
                      value.toString().validateField(fieldName: "Lab Name"),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                          child: PrimaryButton(
                            //hasLoading: true,
                            //isLoading: controller.isLoading,
                            isPrimaryButton: false,
                            width: Get.width * .9,
                            height: 60,
                            label: "Update Profile",
                            onPressed: () => {
                              controller.updateProfile(),
                            },
                          ),
                        ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(child: const PoweredByText()),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEditableField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: ThemeText.bodyThree.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          style: ThemeText.bodyBoldOne,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
