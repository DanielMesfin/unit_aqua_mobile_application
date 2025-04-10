import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/widgets/custom_circle_avatar.dart';
import 'package:unity_labs/widgets/powered_by_field.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authServiceImpl = Get.find<AuthServiceImpl>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          SizedBox(
            width: 50,
          ),
          // Row(
          //   children: [
          //     IconButton(
          //       onPressed: () => Get.toNamed(Routes.editProfile),
          //       icon: const Icon(
          //         Iconsax.edit,
          //         color: CustomColors.primaryColor,
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         Get.toNamed(Routes.editProfile);
          //       },
          //       child: const Text("Edit Profile",
          //           style: TextStyle(color: CustomColors.primaryColor)),
          //     ),
          //   ],
          // ),
          Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () => authServiceImpl.logout(
                    uiserId: authServiceImpl.userData!.id!),
                icon: const Icon(
                  Iconsax.logout,
                  color: CustomColors.primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  authServiceImpl.logout(
                      uiserId: authServiceImpl.userData!.id!);
                },
                child: const Text("Logout",
                    style: TextStyle(color: CustomColors.primaryColor)),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Center(
              child: CustomCircleAvatar(
                initials: authServiceImpl.userData!.name!
                    .substring(0, 2)
                    .toUpperCase(),
                fontSize: 40,
                radius: 50,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                authServiceImpl.userData!.name ?? "",
                style: ThemeText.headlineTwo.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              "Phone Number",
              style: ThemeText.bodyThree.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              authServiceImpl.userData!.phoneNumber != null
                  ? "+91 ${authServiceImpl.userData!.phoneNumber}" ""
                  : "",
              style: ThemeText.bodyBoldOne,
            ),
            const SizedBox(height: 10),
            Text(
              "Qualification",
              style: ThemeText.bodyThree.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              authServiceImpl.userData!.qualification ?? "",
              style: ThemeText.bodyBoldOne,
            ),
            const SizedBox(height: 10),
            Text(
              "District",
              style: ThemeText.bodyThree.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              authServiceImpl.userData!.district ?? "",
              style: ThemeText.bodyBoldOne,
            ),
            const SizedBox(height: 10),
            Text(
              "State",
              style: ThemeText.bodyThree.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              authServiceImpl.userData!.state ?? "",
              style: ThemeText.bodyBoldOne,
            ),
            const SizedBox(height: 10),
            Text(
              "Area",
              style: ThemeText.bodyThree.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              authServiceImpl.userData!.area ?? "",
              style: ThemeText.bodyBoldOne,
            ),
            const SizedBox(height: 10),
            Text(
              "Lab Name",
              style: ThemeText.bodyThree.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              authServiceImpl.userData!.labName ?? "",
              style: ThemeText.bodyBoldOne,
            ),
            SizedBox(
              height: 25,
            ),
            Center(child: const PoweredByText()),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
