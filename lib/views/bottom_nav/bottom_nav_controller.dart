import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/views/info/info_binding.dart';
import 'package:unity_labs/views/info/info_view.dart';
import 'package:unity_labs/views/knowlege_center/knowledge_center_binding.dart';
import 'package:unity_labs/views/knowlege_center/knowledge_center_view.dart';
import 'package:unity_labs/views/treatment/treatment_binding.dart';
import 'package:unity_labs/views/treatment/treatment_view.dart';

import '../../routes/app_pages.dart';
import '../../themes/theme_text.dart';
import '../farmer_records/farmer_records_binding.dart';
import '../farmer_records/farmer_records_view.dart';
import '../homepage/homepage_binding.dart';
import '../homepage/homepage_view.dart';
import '../humburgermenu/humburgermenu_binding.dart';
import '../humburgermenu/humburgermenu_view.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;
  final RxBool isDrawerOpen = false.obs;

  // List<Widget> pages = [
  //   const HomepageView(),
  //   const SearchView(),
  //   const AccountView(),
  // ];

  final GlobalKey<ScaffoldState> scaffoldKeytwo = GlobalKey<ScaffoldState>();

  void openDrawer() {
    print("invoked");
    isDrawerOpen.value = !isDrawerOpen.value; // Toggle the value
    if (isDrawerOpen.value) {
      scaffoldKeytwo.currentState?.openDrawer();
      print("open invoked");
    } else {
      scaffoldKeytwo.currentState?.openEndDrawer();
      print("end invoked");
    }

    isDrawerOpen.value = !isDrawerOpen.value;
    print(isDrawerOpen.value);
  }

  final pages = <String>[
    Routes.product,
    Routes.treatment,
    Routes.info,
    Routes.knowledgeCenter,
    Routes.farmerrecords,
    Routes.profile,
    Routes.hamburgermenu,
  ];

  void changePage(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
    Get.offNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.product:
        return GetPageRoute(
          settings: settings,
          page: () => const HomepageView(),
          binding: HomepageBinding(),
        );
      case Routes.info:
        return GetPageRoute(
          settings: settings,
          page: () => const InfoView(),
          binding: InfoBinding(),
        );
      case Routes.knowledgeCenter:
        return GetPageRoute(
          settings: settings,
          page: () => const KnowledgeCenterView(),
          binding: KnowledgeCenterBinding(),
        );
      case Routes.treatment:
        return GetPageRoute(
          settings: settings,
          page: () => const TreatmentView(),
          binding: TreatmentBinding(),
        );
      case Routes.farmerrecords:
        return GetPageRoute(
          settings: settings,
          page: () => const FarmerRecordsView(),
          binding: FarmerRecordsBinding(),
        );
      case Routes.hamburgermenu:
        return GetPageRoute(
          settings: settings,
          page: () => HamburgerMenuView(),
          binding: HamburgerMenuBinding(),
        );
      // case Routes.profile:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => const ProfileView(),
      //     binding: ProfileBinding(),
      //   );
      // case Routes.profile:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => const AccountView(),
      //     binding: AccountBinding(),
      //   );
      default:
    }
    if (settings.name == Routes.home) {}

    return null;
  }

  Future<bool> onBackPressed() async {
    bool willPope = false;
    await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure you want to quit the app?',
          style: ThemeText.bodyBoldOne,
        ),
        actions: [
          TextButton(
            onPressed: () {
              willPope = false;
              Navigator.pop(context);
            },
            child: Text(
              'No',
              style: ThemeText.bodyBoldOne.copyWith(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              willPope = true;
              Navigator.pop(context);
            },
            child: Text(
              'Yes',
              style: ThemeText.bodyBoldOne.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
    print(willPope);
    return willPope;
  }
}
