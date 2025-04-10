import 'package:get/get.dart';
import '../../services/auth/auth_service_impl.dart';

class HamburgerMenuController extends GetxController {
  final authService = Get.put(AuthServiceImpl());
  //final userId = authService.userData?.userId;

  String? userType;

  // if(authService.userData?.userId != null) {
  //   userType = "Assistant" ;
  // } else {
  //   userType = "User" ;
  // }
}
