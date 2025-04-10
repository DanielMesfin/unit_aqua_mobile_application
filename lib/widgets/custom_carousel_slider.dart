import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    this.onPageChanged,
    required this.autoPlay,
    this.autoPlayIntervalDuration = const Duration(seconds: 5),
    required this.itemCount,
    required this.itemBuilder,
    this.viewportFraction = 1,
    this.infiniteScroll = false,
    this.padEnds = true,
    this.height = 200,
  });
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final int itemCount;
  final bool autoPlay;
  final Duration autoPlayIntervalDuration;
  final Widget Function(BuildContext context, int index, int realIndex)?
      itemBuilder;
  final bool infiniteScroll;
  final double viewportFraction;
  final bool padEnds;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        // aspectRatio: 16 / 3,
        enableInfiniteScroll: infiniteScroll,
        height: height,
        viewportFraction: viewportFraction,
        onPageChanged: onPageChanged,
        autoPlayInterval: autoPlayIntervalDuration,
        disableCenter: true,
        enlargeCenterPage: true,
        padEnds: padEnds,
        autoPlay: autoPlay,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
