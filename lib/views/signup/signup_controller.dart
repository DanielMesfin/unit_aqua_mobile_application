import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:unity_labs/widgets/primary_button.dart';
import '../../model/user/user_model.dart';
import '../../routes/app_pages.dart';
import '../../services/auth/auth_service_impl.dart';

class SignupController extends GetxController {
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

  // List<String> state = [
  //   "Andhra Pradesh",
  //   "Arunachal Pradesh",
  //   "Assam",
  //   "Bihar",
  //   "Chhattisgarh",
  //   "Goa",
  //   "Gujarat",
  //   "Haryana",
  //   "Himachal Prade",
  //   "Jharkhand",
  //   "Karnataka",
  //   "Kerala",
  //   "Madhya Pradesh",
  //   "Maharashtra",
  //   "Manipur",
  //   "Mizoram",
  //   "Meghalaya",
  //   "Nagaland",
  //   "Odisha",
  //   "Punjab",
  //   "Sikkim",
  //   "Rajasthan",
  //   "Tamil Nadu",
  //   "Telangana",
  //   "Tripura",
  //   "Uttarakhand",
  //   "West Bengal",
  //   "Una",
  //   "Bagalkat",
  //   "North Delhi",
  //   "East Delhi",
  //   "West Delhi",
  //   "South Delhi",
  //   "South West Delhi",
  //   "New Delhi",
  // ];
  // List<String> district = [
  //   "Mumbai",
  //   "Delhi",
  //   "Kolkata",
  //   "Chennai",
  //   "Bengaluru",
  //   "Hyderabad",
  //   "Pune",
  //   "Jaipur",
  //   "Lucknow",
  //   "Ahmedabad",
  //   "Chandigarh",
  //   "Bhopal",
  //   "Kanpur",
  //   "Nagpur",
  //   "Patna",
  //   "Kochi",
  //   "Indore",
  //   "Thiruvananthapuram",
  //   "Coimbatore",
  //   "Guwahati",
  //   "Varanasi",
  //   "Visakhapatnam",
  //   "Agra",
  //   "Nashik",
  //   "Amritsar"
  // ];

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
        labReportImage:
            labReportImage != null ? File(labReportImage!.path) : null,
        labReport: "Potrait",
      );

      final response = await _authServiceImpl.signup(user: request);
      inspect(response);

      if (response.isFailure) {
        Get.snackbar(response.response ?? "", response.message ?? "");
      } else {
        // TODO: Save auth token in secure storage
        showRegistrationBottomSheet(Get.context!);
      }
      // await _secureServiceImpl.write(
      //     key: 'authToken', value: response.authUser!.authToken!);
    } catch (e) {
      inspect(e);
    } finally {
      isLoading(false);
    }
  }

  void showRegistrationBottomSheet(BuildContext context) {
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
                'assets/congratulations.json',
                width: 150,
                height: 150,
                repeat: false,
              ),

              SizedBox(height: 20),
              // Registration Text
              Text(
                'Congratulations!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Your Profile was Sent for Review We will Approve it in 12- 24 Hours.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: "Come Back to Later",
                  onPressed: () => Get.offAllNamed(Routes.login),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
