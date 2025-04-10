import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../model/user/user_model.dart';
import '../../routes/app_pages.dart';
import '../../services/auth/auth_service_impl.dart';
import '../../services/secure_storage/secure_storage_service_impl.dart';

class BannerForReportController extends GetxController {
  late TextEditingController phoneController,
      pinController,
      nameController,
      // qualificationController,
      // stateController,
      // districtController,
      areaController,
      labNameController;
  late GlobalKey<FormState> formKey;
  final _authServiceImpl = Get.find<AuthServiceImpl>();
  final _secureServiceImpl = Get.find<SecureStorageServiceImpl>();
  final isLoading = false.obs;
  final isFirstPage = true.obs;
  final isFetched1 = false.obs;
  final isFetched2 = false.obs;
  final isFetched3 = false.obs;
  XFile? logoImage;
  XFile? nameBoardImage;
  XFile? labReportImage;
  RxString labReport = 'Potrait'.obs;
  RxString selectedQualification = ''.obs;
  RxString selectedState = ''.obs;
  RxString selectedDistrict = ''.obs;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    pinController = TextEditingController();
    nameController = TextEditingController();
    // qualificationController = TextEditingController();
    // stateController = TextEditingController();
    // districtController = TextEditingController();
    areaController = TextEditingController();
    labNameController = TextEditingController();
    super.onInit();
  }

  List<String> qualification = [
    "BSc",
    "MSc",
    "Diploma",
    "Phd",
    "BA",
    "MA",
    "MBA",
    "High School",
    "No"
  ];
  List<String> state = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Prade",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Mizoram",
    "Meghalaya",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Sikkim",
    "Rajasthan",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "West Bengal",
    "Una",
    "Bagalkat",
    "North Delhi",
    "East Delhi",
    "West Delhi",
    "South Delhi",
    "South West Delhi",
    "New Delhi",
  ];
  List<String> district = [
    "Mumbai",
    "Delhi",
    "Kolkata",
    "Chennai",
    "Bengaluru",
    "Hyderabad",
    "Pune",
    "Jaipur",
    "Lucknow",
    "Ahmedabad",
    "Chandigarh",
    "Bhopal",
    "Kanpur",
    "Nagpur",
    "Patna",
    "Kochi",
    "Indore",
    "Thiruvananthapuram",
    "Coimbatore",
    "Guwahati",
    "Varanasi",
    "Visakhapatnam",
    "Agra",
    "Nashik",
    "Amritsar"
  ];

  pickImage(int type) async {
    final ImagePicker picker = ImagePicker();
    XFile? selectedImages = await picker.pickImage(source: ImageSource.gallery);
    if (selectedImages != null) {
      // if (selectedImages.length > 3) {
      //   return DialogHelpers().showSnackBarGetx(
      //     content: "Please select only 3 images",
      //     responseMessage: ResponseMessage.warning,
      //   );
      // }
      if (type == 1) {
        logoImage = selectedImages;
        isFetched1(true);
      }
      if (type == 2) {
        nameBoardImage = selectedImages;
        isFetched2(true);
      }
      if (type == 3) {
        labReportImage = selectedImages;
        isFetched3(true);
      }
    }
  }

  void signup() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (logoImage == null) {
      Get.snackbar('Missing input', 'Logo should be added.');
      return;
    }
    if (nameBoardImage == null) {
      Get.snackbar('Missing input', 'Name board image should be added.');
      return;
    }
    if (labReportImage == null) {
      Get.snackbar('Missing input', 'Lab report image should be added.');
      return;
    }
    isLoading(true);
    try {
      UserModel request = UserModel(
        phoneNumber: phoneController.text.trim(),
        pin: int.parse(pinController.text.trim()),
        name: nameController.text.trim(),
        qualification: selectedQualification.value,
        state: selectedState.value,
        district: selectedDistrict.value,
        area: areaController.text.trim(),
        labName: labNameController.text.trim(),
        labLogo: logoImage != null ? File(logoImage!.path) : null,
        labImage: nameBoardImage != null ? File(nameBoardImage!.path) : null,
        labReportImage: logoImage != null ? File(labReportImage!.path) : null,
        labReport: labReport.value,
      );
      final response = await _authServiceImpl.signup(user: request);
      inspect(response);

      if (response.isFailure) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        await _secureServiceImpl.write(
            key: 'authToken', value: response.authUser!.authToken!);
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
