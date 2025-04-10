import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unity_labs/services/auth/auth_service_impl.dart';
import 'package:unity_labs/views/homepage/homepage_controller.dart';

class BannerHome extends StatelessWidget {
  final authServiceImpl = Get.find<AuthServiceImpl>();
  final homeScreenController= Get.find<HomepageController>();
   BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('E, MMM d, y - hh:mm a').format(DateTime.now());

    return Container(
      child: Stack(
        children: [
          Obx((){
            if(homeScreenController.currentBannerImage.value.isNotEmpty){
            return Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              image: DecorationImage(
                image: NetworkImage(            homeScreenController.currentBannerImage.value,
),
                fit: BoxFit.fill,
              ),
            ),
          );
            }else{
              return
Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0.0)),
              image: DecorationImage(
                image: NetworkImage(            authServiceImpl.userData!.labReportImage!.path,
),
                fit: BoxFit.fill,
              ),
            ),
          );
          
            }
          
          }),
          
          Positioned(
            left: 16.0,
            bottom: 16.0,
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
          Positioned(
            right: 16.0,
            bottom: 16.0,
            child: Text(
              formattedDate,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                shadows: [
                  Shadow(
                    blurRadius: 3.0,
                    color: Colors.blue,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
