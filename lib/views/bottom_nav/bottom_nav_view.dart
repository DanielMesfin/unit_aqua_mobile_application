import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../helpers/widget_helpers.dart';
import '../../routes/app_pages.dart';
import '../../themes/custom_colors.dart';
import '../humburgermenu/humburgermenu_view.dart';
import 'bottom_nav_controller.dart';

// ignore: must_be_immutable
class BottomNavView extends GetView<BottomNavController> {
  final VoidCallback openDrawerCallback;

  GlobalKey<ScaffoldState> scaffoldKey;

  BottomNavView({
    required this.openDrawerCallback,
    required this.scaffoldKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        // onWillPop: () async => controller.onBackPressed(),
        onWillPop: () async {
          // Handle back button logic
          return true;
        },
        child: Scaffold(
          key: scaffoldKey,
          drawer: const Drawer(
            child: HamburgerMenuView(),
          ),
          body: SafeArea(
            child: WidgetHelpers.pagePadding(
              child: Navigator(
                key: Get.nestedKey(1),
                initialRoute: Routes.product,
                onGenerateRoute: controller.onGenerateRoute,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            selectedItemColor: CustomColors.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              if (index == 5) {
                openDrawerCallback();
                print('here');
              } else {
                controller.changePage(index);
              }
            },
            items: [
              BottomNavigationBarItem(
                  // icon: ImageIcon(AssetImage('assets/footer/1 my lab.png')),
                  icon: Image.asset(
                    'assets/footer/1 my lab.png',
                    width: 30,
                    height: 30,
                  ),
                  label: "My Lab"),
              BottomNavigationBarItem(
                // icon: ImageIcon(AssetImage('assets/footer/2 treatments.png')),
                icon: Image.asset(
                  'assets/footer/2 treatments.png',
                  width: 30,
                  height: 30,
                ),
                label: "Treatments",
              ),
              BottomNavigationBarItem(
                  // icon:
                  //     ImageIcon(AssetImage('assets/footer/3 info & tools.png')),
                  icon: Image.asset(
                    'assets/footer/3 info & tools.png',
                    width: 30,
                    height: 30,
                  ),
                  label: "Info & Tools"),
              BottomNavigationBarItem(
                  // icon: ImageIcon(
                  //   AssetImage('assets/footer/4 knowledge2.png'),
                  // ),
                  icon: Image.asset(
                    'assets/footer/4 knowledge2.png',
                    width: 30,
                    height: 30,
                  ),
                  label: "Knowledge Center"),
              BottomNavigationBarItem(
                  // icon: ImageIcon(
                  //     AssetImage('assets/footer/5 farmer records.png')),
                  icon: Image.asset(
                    'assets/footer/5 farmer records.png',
                    width: 30,
                    height: 30,
                  ),
                  label: "Farmer Records "),
              const BottomNavigationBarItem(
                  icon: Icon(Iconsax.menu), label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
