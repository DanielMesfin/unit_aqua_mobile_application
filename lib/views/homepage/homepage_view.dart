// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:unity_labs/helpers/widget_helpers.dart';
// import 'package:unity_labs/routes/app_pages.dart';
// import 'package:unity_labs/themes/custom_colors.dart';
// import 'package:unity_labs/themes/theme_text.dart';
// import 'package:unity_labs/widgets/banner_home.dart';

// import 'homepage_controller.dart';

// class HomepageView extends GetView<HomepageController> {
//   const HomepageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               SizedBox(height: 20),
//               BannerHome(),
//               SizedBox(height: 20),
//               options(
//                 title: 'Farmer Registration',
//                 onPressed: () => Get.toNamed(Routes.farmer),
//               ),
//               options(
//                 title: 'Test Pending',
//                 onPressed: () => Get.toNamed(Routes.testPending),
//               ),
//             ]),
//           ),
//           Visibility(
//               visible: controller.authService.userData?.userId == null,
//               child: Column(
//                 children: [
//                   options(
//                     title: 'Reporting',
//                     onPressed: () => Get.toNamed(Routes.reportList),
//                   ),
//                   options(
//                     title: 'Completed',
//                     onPressed: () => Get.toNamed(Routes.completed),
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     ));
//   }

//   Widget options({required String title, required Function() onPressed}) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         decoration: WidgetHelpers.allRoundedRectangle(
//           color: CustomColors.primaryColor,
//         ),
//         width: Get.width,
//         // height: 180,
//         height: 120,

//         child: Center(
//           child: Text(
//             title,
//             style: ThemeText.headlineOne.copyWith(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/widget_helpers.dart';
import 'package:unity_labs/routes/app_pages.dart';
import 'package:unity_labs/themes/custom_colors.dart';
import 'package:unity_labs/themes/theme_text.dart';
import 'package:unity_labs/widgets/banner_home.dart';
import 'homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      BannerHome(),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.edit, color: Colors.green),
                            onPressed: () => _showImagePicker(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  options(
                    title: 'Farmer Registration',
                    onPressed: () => Get.toNamed(Routes.farmer),
                  ),
                  options(
                    title: 'Test Pending',
                    onPressed: () => Get.toNamed(Routes.testPending),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.authService.userData?.userId == null,
              child: Column(
                children: [
                  options(
                    title: 'Reporting',
                    onPressed: () => Get.toNamed(Routes.reportList),
                  ),
                  options(
                    title: 'Completed',
                    onPressed: () => Get.toNamed(Routes.completed),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget options({required String title, required Function() onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: WidgetHelpers.allRoundedRectangle(
          color: CustomColors.primaryColor,
        ),
        width: Get.width,
        height: 120,
        child: Center(
          child: Text(
            title,
            style: ThemeText.headlineOne.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }


void _showImagePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, 
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () async {
                Navigator.of(context).pop();
                await controller.pickImage();
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.photo_camera),
            //   title: Text('Take a Picture'),
            //   onTap: () async {
            //     Navigator.of(context).pop();
            //     await _pickImage(ImageSource.camera);
            //   },
            // ),
          
          ],
        ),
      );
    },
  );
}


}
