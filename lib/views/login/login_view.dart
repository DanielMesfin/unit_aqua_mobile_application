import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/validators.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/views/login/login_controller.dart';
import 'package:unity_labs/widgets/custom_text_field.dart';
import 'package:unity_labs/widgets/logimage.dart';
import 'package:unity_labs/widgets/powered_by_field.dart';
import 'package:unity_labs/widgets/primary_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WidgetHelpers.pagePadding(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LogImage(),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Welcome to Unity Labs',
                      style: ThemeText.headlineOne,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Cillum sunt reprehenderit esse magna proident id duis consectetur sit.',
                      style: ThemeText.bodyOne,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    prefixText: "+91",
                    labelText: "Mobile Number",
                    maxLength: 10,
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
                    labelText: "PIN",
                    validator: (value) => value.toString().validatePinField(
                        fieldName: "PIN", value: value.toString()),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    suffix: TextButton(
                      child: Text(
                        'Forgot?',
                        style: ThemeText.bodyBoldOne
                            .copyWith(color: CustomColors.errorColor),
                      ),
                      onPressed: () => Get.toNamed(Routes.forgotPassword),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: PrimaryButton(
                      hasLoading: true,
                      isLoading: controller.isLoading,
                      width: Get.width * .8,
                      label: "Login",
                      onPressed: () => controller.login(),
                      //onPressed: () => controller.authServiceImpl.logout(),
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
                      label: "Signup",
                      onPressed: () => Get.offNamed(Routes.signUp),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
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
    );
  }
}
