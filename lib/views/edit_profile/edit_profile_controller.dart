import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/routes/app_pages.dart';
import '../../model/user/user_model.dart';

import '../../services/auth/auth_service_impl.dart';

class EditProfileController extends GetxController {
  final isLoading = false.obs;
  final authServiceImpl = Get.find<AuthServiceImpl>();
  late TextEditingController nameController,
      phoneNumberController,
      areaController,
      labNameController;
  RxString selectedQualification = ''.obs;
  RxString selectedState = ''.obs;
  RxString selectedDistrict = ''.obs;

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

  Map<String, List<String>> stateDistricts = {
    "Andhra Pradesh": [
      "Alluri Sitarama Raju",
      "Anakapalli",
      "Anantapur",
      "Annamaya",
      "Bapatla",
      "Chittoor",
      "East Godavari",
      "Eluru",
      "Guntur",
      "Kadapa",
      "Kakinada",
      "Konaseema",
      "Krishna",
      "Kurnool",
      "Manyam",
      "N T Rama Rao",
      "Nandyal",
      "Nellore",
      "Palnadu",
      "Prakasam",
      "Sri Balaji",
      "Sri Satya Sai",
      "Srikakulam",
      "Visakhapatnam",
      "Vizianagaram",
      "West Godavari"
    ],
    "Gujarat": [
      "Ahmedabad",
      "Amreli",
      "Anand",
      "Aravalli",
      "Banaskantha",
      "Bharuch",
      "Bhavnagar",
      "Botad",
      "Chhota Udaipur",
      "Dahod",
      "Dang",
      "Devbhoomi Dwarka",
      "Gandhinagar",
      "Gir Somnath",
      "Jamnagar",
      "Junagadh",
      "Kheda",
      "Kutch",
      "Mahisagar",
      "Mehsana",
      "Morbi",
      "Narmada",
      "Navsari",
      "Panchmahal",
      "Patan",
      "Porbandar",
      "Rajkot",
      "Sabarkantha",
      "Surat",
      "Surendranagar",
      "Tapi",
      "Vadodara",
      "Valsad"
    ],
    "Karnataka": [
      "Bagalkot",
      "Bangalore Rural",
      "Bangalore Urban",
      "Belgaum",
      "Bellary",
      "Bidar",
      "Chamarajanagar",
      "Chikkaballapur",
      "Chikkamagaluru",
      "Chitradurga",
      "Dakshina Kannada",
      "Davanagere",
      "Dharwad",
      "Gadag",
      "Gulbarga",
      "Hassan",
      "Haveri",
      "Kodagu",
      "Kolar",
      "Koppal",
      "Mandya",
      "Mysore",
      "Raichur",
      "Ramanagara",
      "Shimoga",
      "Tumkur",
      "Udupi",
      "Uttara Kannada",
      "Vijayanagara",
      "Vijayapura",
      "Yadgir"
    ],
    "Kerala": [
      "Alappuzha",
      "Ernakulam",
      "Idukki",
      "Kannur",
      "Kasaragod",
      "Kollam",
      "Kottayam",
      "Kozhikode",
      "Malappuram",
      "Palakkad",
      "Pathanamthitta",
      "Thiruvananthapuram",
      "Thrissur",
      "Wayanad"
    ],
    "Maharashtra": [
      "Ahmednagar",
      "Akola",
      "Amravati",
      "Aurangabad",
      "Beed",
      "Bhandara",
      "Buldhana",
      "Chandrapur",
      "Dhule",
      "Gadchiroli",
      "Gondia",
      "Hingoli",
      "Jalgaon",
      "Jalna",
      "Kolhapur",
      "Latur",
      "Mumbai City",
      "Mumbai Suburban",
      "Nagpur",
      "Nanded",
      "Nandurbar",
      "Nashik",
      "Osmanabad",
      "Palghar",
      "Parbhani",
      "Pune",
      "Raigad",
      "Ratnagiri",
      "Sangli",
      "Satara",
      "Sindhudurg",
      "Solapur",
      "Thane",
      "Wardha",
      "Washim",
      "Yavatmal"
    ],
    "Odisha": [
      "Angul",
      "Balangir",
      "Balasore",
      "Bargarh",
      "Bhadrak",
      "Boudh",
      "Cuttack",
      "Debagarh",
      "Dhenkanal",
      "Gajapati",
      "Ganjam",
      "Jagatsinghpur",
      "Jajpur",
      "Jharsuguda",
      "Kalahandi",
      "Kandhamal",
      "Kendrapara",
      "Kendujhar",
      "Khordha",
      "Koraput",
      "Malkangiri",
      "Mayurbhanj",
      "Nabarangpur",
      "Nayagarh",
      "Nuapada",
      "Puri",
      "Rayagada",
      "Sambalpur",
      "Subarnapur",
      "Sundergarh"
    ],
    "Puducherry": ["Karaikal", "Mahe", "Puducherry", "Yanam"],
    "Tamil Nadu": [
      "Ariyalur",
      "Chengalpattu",
      "Chennai",
      "Coimbatore",
      "Cuddalore",
      "Dharmapuri",
      "Dindigul",
      "Erode",
      "Kallakurichi",
      "Kanchipuram",
      "Kanyakumari",
      "Karur",
      "Krishnagiri",
      "Madurai",
      "Mayiladuthurai",
      "Nagapattinam",
      "Namakkal",
      "Nilgiris",
      "Perambalur",
      "Pudukkottai",
      "Ramanathapuram",
      "Ranipet",
      "Salem",
      "Sivaganga",
      "Tenkasi",
      "Thanjavur",
      "Theni",
      "Thoothukudi",
      "Tiruchirappalli",
      "Tirunelveli",
      "Tirupattur",
      "Tiruppur",
      "Tiruvallur",
      "Tiruvannamalai",
      "Tiruvarur",
      "Vellore",
      "Viluppuram",
      "Virudhunagar"
    ],
    "Telangana": [
      "Adilabad",
      "Bhadradri Kothagudem",
      "Hanamkonda",
      "Hyderabad",
      "Jagtial",
      "Jangaon",
      "Jayashankar",
      "Jogulamba",
      "Kamareddy",
      "Karimnagar",
      "Khammam",
      "Komaram Bheem",
      "Mahabubabad",
      "Mahbubnagar",
      "Mancherial",
      "Medak",
      "Medchal",
      "Mulugu",
      "Nagarkurnool",
      "Nalgonda",
      "Narayanpet",
      "Nirmal",
      "Nizamabad",
      "Peddapalli",
      "Rajanna Sircilla",
      "Ranga Reddy",
      "Sangareddy",
      "Siddipet",
      "Suryapet",
      "Vikarabad",
      "Wanaparthy",
      "Warangal",
      "Yadadri Bhuvanagiri"
    ],
    "West Bengal": [
      "Alipurduar",
      "Bankura",
      "Birbhum",
      "Cooch Behar",
      "Dakshin Dinajpur",
      "Darjeeling",
      "Hooghly",
      "Howrah",
      "Jalpaiguri",
      "Jhargram",
      "Kalimpong",
      "Kolkata",
      "Malda",
      "Murshidabad",
      "Nadia",
      "North 24 Parganas",
      "Paschim Bardhaman",
      "Paschim Medinipur",
      "Purba Bardhaman",
      "Purba Medinipur",
      "Purulia",
      "South 24 Parganas",
      "Uttar Dinajpur"
    ]
  };

  List<String> get states => stateDistricts.keys.toList();

  List<String> get districtsForSelectedState =>
      stateDistricts[selectedState.value] ?? [];

  void onStateSelected(String newValue) {
    selectedState.value = newValue;
    selectedDistrict.value = districtsForSelectedState.first;
  }

  void onDistrictSelected(String newValue) {
    selectedDistrict.value = newValue;
  }

  @override
  void onInit() {
    selectedQualification.value = authServiceImpl.userData?.qualification ?? "";
    nameController =
        TextEditingController(text: authServiceImpl.userData?.name);
    phoneNumberController =
        TextEditingController(text: authServiceImpl.userData?.phoneNumber);
    areaController =
        TextEditingController(text: authServiceImpl.userData?.area);
    labNameController =
        TextEditingController(text: authServiceImpl.userData?.labName);

    super.onInit();
  }

  Future<void> updateProfile() async {
    final userId = authServiceImpl.userData?.id;
    final name = nameController.text;
    final phoneNumber = phoneNumberController.text;
    final area = areaController.text;
    final labName = labNameController.text;

    isLoading(true);

    try {
      final response = await authServiceImpl.updateProfile(
        userId: userId!,
        user: UserModel(
          name: name,
          phoneNumber: phoneNumber,
          qualification: selectedQualification.value,
          district: selectedDistrict.value,
          state: selectedState.value,
          area: area,
          labName: labName,
        ),
      );

      inspect(response);
      print(response);

      if (response.statusCode == 200) {
        final authServiceImplUpdeted = Get.find<AuthServiceImpl>();
        final response = await authServiceImplUpdeted.getProfile();
        authServiceImplUpdeted.userData = response.userModel!;
        nameController =
            TextEditingController(text: authServiceImplUpdeted.userData?.name);
        phoneNumberController = TextEditingController(
            text: authServiceImplUpdeted.userData?.phoneNumber);
        // qualificationController = TextEditingController(
        //     text: authServiceImplUpdeted.userData?.qualification);
        // districtController = TextEditingController(
        //     text: authServiceImplUpdeted.userData?.district);
        // stateController =
        //     TextEditingController(text: authServiceImplUpdeted.userData?.state);
        areaController =
            TextEditingController(text: authServiceImplUpdeted.userData?.area);
        labNameController = TextEditingController(
            text: authServiceImplUpdeted.userData?.labName);

        Get.snackbar(
          backgroundColor: Colors.green,
          "Update",
          "Profile Updated Successfully",
        );
        Get.offAllNamed(
          Routes.profile,
        );
      } else {}
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(
        e.response!.data["RESPONSE"] ?? "",
        e.response!.data["message"] ?? "",
      );
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
