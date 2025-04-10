import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/model/farmer/farmers_model.dart';

import '../../routes/app_pages.dart';
import '../../services/famer/farmer_service_impl.dart';

class FarmerRegistrationController extends GetxController {
  late TextEditingController phoneNumberController,
      famerNameController,
      //stateController,
      // districtController,
      areaController;
  late GlobalKey<FormState> formKeyR;
  final _farmerServiceImpl = Get.find<FarmerServiceImpl>();
  final isLoading = false.obs;
  String cultureType = '';
  RxString selectedState = ''.obs;
  RxString selectedDistrict = ''.obs;

  @override
  void onInit() {
    formKeyR = GlobalKey<FormState>();
    phoneNumberController = TextEditingController();
    famerNameController = TextEditingController();
    //stateController = TextEditingController();
    //districtController = TextEditingController();
    areaController = TextEditingController();
    super.onInit();
  }

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

  void registerFarmer() async {
    final isValid = formKeyR.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (cultureType.isEmpty) {
      Get.snackbar('Missing input', 'Culture type needs to be selected.');
      return;
    }
    isLoading(true);
    try {
      FarmersModel request = FarmersModel(
        phoneNumber: phoneNumberController.text.trim(),
        name: famerNameController.text.trim(),
        state: selectedState.value,
        district: selectedDistrict.value,
        area: areaController.text.trim(),
        cultureType: cultureType,
      );
      final response = await _farmerServiceImpl.addFarmer(farmer: request);
      inspect(response);

      if (response.isFailure) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        if (response.message != "OK") {
          Get.snackbar(
              backgroundColor: Colors.green,
              duration: Duration(seconds: 10),
              "",
              "Farmer with these phone number already exists.");
          // update
          final response = await _farmerServiceImpl.getTank(
              phone: phoneNumberController.text.trim());
          inspect(response);

          if (response.isFailure) {
            Get.snackbar(response.response ?? "", response.message ?? "");
          } else {
            Get.toNamed(Routes.farmerData, arguments: response);
          }
          //laster
        } else {
          Get.toNamed(Routes.farmerData, arguments: response);
        }
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void getTank() async {
    isLoading(true);
    try {
      final response = await _farmerServiceImpl.getTank(
          phone: phoneNumberController.text.trim());
      inspect(response);

      if (response.isFailure) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        Get.toNamed(Routes.farmerData, arguments: response);
      }
    } on DioException catch (e) {
      inspect(e);
      Get.snackbar(e.response!.data["RESPONSE"] ?? "",
          e.response!.data["message"] ?? "");
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }
}
