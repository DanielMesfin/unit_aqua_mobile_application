import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unity_labs/model/user/user_model.dart';

import '../../services/auth/auth_service_impl.dart';

class HomepageController extends GetxController {
  //String userType = Get.arguments['userType'];
    final isLoading = false.obs;
    final currentBannerImage = ''.obs;
    final authService = Get.put(AuthServiceImpl());

     @override
  void onInit() {
    // currentBannerImage.value = authService.userData!.labReportImage!.path;
    super.onInit();
  }
  
  pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? selectedImages = await picker.pickImage(source: ImageSource.gallery);
    if (selectedImages != null) {
      // if (selectedImages.length > 3) {
      //   return DialogHelpers().showSnackBarGetx(
      //     content: "Please select only 3 images",
      //     responseMessage: ResponseMessage.warning,
      //   );
      // }
      await  updateProfile(selectedImages);
      
    }
  }

Future<void> updateProfile( XFile newLabReportImage) async {
    final userId = authService.userData?.id;
    isLoading(true);
    try {
      final response = await authService.updateProfile(
        userId: userId!,
        user: UserModel(
          labReportImage:
            newLabReportImage != null ? File(newLabReportImage.path) : null,
        ),
      );

      inspect(response);
      
      if (response.statusCode == 200) {
          currentBannerImage.value = response.userModel!.labReportImage!.path;
         update();
         Get.snackbar(
          backgroundColor: Colors.green,
          "Update",
          "Profile Updated Successfully",
        );
      } else {}
    } on DioException catch (e) {
      inspect(e);
      print(e.toString());
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

}
