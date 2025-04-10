import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/widgets/logimage.dart';
import 'package:unity_labs/widgets/powered_by_field.dart';

import '../../helpers/widget_helpers.dart';
import '../../themes/theme_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: WidgetHelpers.pagePadding(
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    LogImage(),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Welcome to Unity Labs',
                        style: ThemeText.headlineOne,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cillum sunt reprehenderit esse magna proident id duis consectetur sit.',
                      style: ThemeText.bodyOne,
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      prefixText: "+91",
                      labelText: "Mobile Number",
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      suffix: controller.isOtpLoading.isTrue
                          ? Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                ". . . . .",
                                style: ThemeText.bodyBoldOne,
                              ),
                            )
                          : IconButton(
                              onPressed: () => controller.sendCode(),
                              icon: const Icon(Iconsax.send1),
                            ),
                      validator: (value) => value
                          .toString()
                          .validateField(fieldName: "Mobile No."),
                    ),
                    CustomTextField(
                      controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      labelText: "Code",
                      validator: (value) =>
                          value.toString().validateField(fieldName: "Code"),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: PrimaryButton(
                        hasLoading: true,
                        isLoading: controller.isLoading,
                        width: Get.width * .8,
                        label: "Submit",
                        onPressed: () => controller.startVerification(),
                      ),
                    ),
                    const SizedBox(
                      height: 215,
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
        ),
      ),
    );
  }
}
