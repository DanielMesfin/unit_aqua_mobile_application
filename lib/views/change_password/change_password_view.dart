import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';

import '../../helpers/widget_helpers.dart';
import '../../themes/theme_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WidgetHelpers.pagePadding(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Change PIN Code',
                  style: ThemeText.headlineOne,
                ),
                Text(
                  'Cillum sunt reprehenderit esse magna proident id duis consectetur sit.',
                  style: ThemeText.bodyOne,
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: controller.pinController,
                  keyboardType: TextInputType.number,
                  labelText: "PIN",
                  validator: (value) =>
                      value.toString().validateField(fieldName: "PIN"),
                ),
                const SizedBox(height: 40),
                Center(
                  child: PrimaryButton(
                    hasLoading: true,
                    isLoading: controller.isLoading,
                    label: "Submit",
                    onPressed: () => controller.changePassword(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
