import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:unity_labs/widgets/primary_button.dart';

class CalculatorController extends GetxController {
  late String name;
  late TextEditingController inputOneController, inputTwoController;
  late GlobalKey<FormState> formKey;
  final isLoading = false.obs;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    inputOneController = TextEditingController();
    inputTwoController = TextEditingController();

    if (Get.arguments != null) {
      name = Get.arguments;
    }
    super.onInit();
  }

  void onSumbit() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading(true);
    final sum = int.parse(inputOneController.text.trim()) +
        int.parse(inputTwoController.text.trim());
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isLoading(false);
      showRegistrationBottomSheet(Get.context!, sum);
      // Get.snackbar("Result", "The Result is $sum");
    });
  }
  //bottom navigation bar

  void showRegistrationBottomSheet(BuildContext context, dynamic resulst) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animated Congratulations
              Lottie.asset(
                'assets/result.json', // Download a Lottie animation and add to your assets
                width: 150,
                height: 150,
                repeat: false,
              ),
              // SizedBox(height: 10),
              // Logo Image
              // Image.asset(
              //   'assets/unit_lab_logo.jpg',
              //   width: 100,
              //   height: 100,
              // ),
              SizedBox(height: 10),
              // Registration Text
              Text(
                'Result : $resulst',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Crunching Numbers: Here's What We Found!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: "Go Back",
                  onPressed: () {
                    Get.back();
                  },
                  // onPressed: () => Get.offAllNamed(Routes.login),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
