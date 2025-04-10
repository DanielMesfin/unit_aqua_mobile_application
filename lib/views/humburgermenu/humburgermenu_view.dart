import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/common/constants/size_constants.dart';

import 'humburgermenu_controller.dart';

class HamburgerMenuView extends GetView<HamburgerMenuController> {
  const HamburgerMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HamburgerMenuController());
    final authServiceImpl = Get.find<AuthServiceImpl>();

    return Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            // Container(
            //   padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Container(
            //         width: 40,
            //         height: 40,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.3),
            //               spreadRadius: 2,
            //               blurRadius: 3,
            //               offset: const Offset(0, 2),
            //             ),
            //           ],
            //         ),
            //         child: const Center(
            //           child: Icon(
            //             Icons.more_horiz,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.black),
                  image: DecorationImage(
                    image: NetworkImage(authServiceImpl
                        .userData!.labLogo!.path), // Replace with `labLogo`
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: Sizes.dimen_10,
            ),
            ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.black,
              ),
              title: Text(authServiceImpl.userData?.labName ?? "Lab Name",
                  style: ThemeText.bodyOne),
              onTap: () {},
            ),
            const SizedBox(
              height: Sizes.dimen_5,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text('Profile', style: ThemeText.bodyOne),
              onTap: () {
                Get.toNamed(Routes.profile);
              },
            ),
            // const SizedBox(
            //   height: Sizes.dimen_5,
            // ),
            // ListTile(
            //   title:
            //       Text('Change Report Orientation', style: ThemeText.bodyOne),
            //   onTap: () {
            //     Get.toNamed(Routes.bannerForReport);
            //   },
            // ),
            const SizedBox(
              height: Sizes.dimen_5,
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: Text('My Work Records', style: ThemeText.bodyOne),
              onTap: () {
                Get.toNamed(Routes.myworkrecords);
              },
            ),
            const SizedBox(
              height: Sizes.dimen_5,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.black,
              ),
              title: Text('Share', style: ThemeText.bodyOne),
              onTap: () {},
            ),
            const SizedBox(
              height: Sizes.dimen_5,
            ),
            ListTile(
              leading: Icon(
                Icons.rate_review,
                color: Colors.black,
              ),
              title: Text('Rate', style: ThemeText.bodyOne),
              onTap: () {},
            ),
            const SizedBox(
              height: Sizes.dimen_5,
            ),
            ListTile(
              leading: Icon(
                Icons.change_circle,
                color: Colors.black,
              ),
              title: Text('Change Pass/PIN', style: ThemeText.bodyOne),
              onTap: () {
                Get.toNamed(Routes.forgotPassword);
              },
            ),
            const SizedBox(
              height: Sizes.dimen_5,
            ),
            Visibility(
              visible: controller.authService.userData?.userId == null,
              child: ExpansionTile(
                leading: Icon(
                  Icons.group,
                  color: Colors.black,
                ),
                title: Text('Lab Ass. Manage', style: ThemeText.bodyOne),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      title:
                          Text('Add Lab Assistant', style: ThemeText.bodyOne),
                      onTap: () {
                        Get.toNamed(Routes.addlabassistance);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.manage_accounts,
                        color: Colors.black,
                      ),
                      title: Text('Manage Lab Assistant',
                          style: ThemeText.bodyOne),
                      onTap: () {
                        Get.toNamed(Routes.managelabassistant);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                      title: Text('Login Requests', style: ThemeText.bodyOne),
                      onTap: () {
                        Get.toNamed(Routes.loginrequests);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
