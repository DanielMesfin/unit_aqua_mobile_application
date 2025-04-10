import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/themes/custom_colors.dart';

class CustomCarouselSliderIndicator extends StatelessWidget {
  const CustomCarouselSliderIndicator(
      {super.key,
      required this.currentIndex,
      required this.itemCount,
      this.indicatorWidth = 30});

  final RxInt currentIndex;
  final int itemCount;
  final double indicatorWidth;
  @override
  Widget build(BuildContext context) {
    return itemCount > 1
        ? SizedBox(
            height: 10,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(
                  () => CircleAvatar(
                    radius: 5,
                    backgroundColor: index != currentIndex.value
                        ? CustomColors.greyScale4
                        : CustomColors.primaryColor,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5,
                );
              },
            ),
          )
        : const SizedBox();
  }
}
