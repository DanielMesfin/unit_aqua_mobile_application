import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/helpers/utils.dart';
import 'package:unity_labs/widgets/full_screen_image.dart';

import '../common/config/http_config.dart';
import '../common/constants/constants.dart';
import '../common/constants/size_constants.dart';
import '../themes/custom_colors.dart';
import '../widgets/custom_text_widget.dart';

class WidgetHelpers {
  static Widget clipRRectWithImage({
    required String imageUrl,
    double borderRadius = Constants.defaultBorderRadius,
    double? imageWidth,
    double? imageHeight,
    bool useBottomShader = false,
    bool useElevation = false,
    double elevation = 5.0,
    bool isAssetImage = false,
    bool useShader = false,
    List<Color>? colors,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap ?? () => Get.to(() => FullScreenImage(imageUrl: imageUrl)),
      child: useShader && !useElevation
          ? _buildImageWithShader(
              imageUrl: imageUrl,
              borderRadius: borderRadius,
              imageHeight: imageHeight,
              imageWidth: imageWidth,
              isAsset: isAssetImage,
              colors: colors,
            )
          : useBottomShader && !useElevation
              ? _buildImageWithBottomShader(
                  borderRadius: borderRadius,
                  imageUrl: imageUrl,
                  imageHeight: imageHeight,
                  imageWidth: imageWidth,
                  isAsset: isAssetImage,
                )
              : !useBottomShader && !useElevation
                  ? _buildImageWithOutBottomShader(
                      borderRadius: borderRadius,
                      imageUrl: imageUrl,
                      imageHeight: imageHeight,
                      imageWidth: imageWidth,
                      isAsset: isAssetImage,
                    )
                  : useBottomShader && useElevation
                      ? _buildImageWithBottomShaderWithElevation(
                          imageUrl: imageUrl,
                          borderRadius: borderRadius,
                          imageHeight: imageHeight,
                          imageWidth: imageWidth,
                          elevation: elevation,
                          isAsset: isAssetImage,
                        )
                      : _buildImageWithOutBottomShaderWithElevation(
                          imageUrl: imageUrl,
                          borderRadius: borderRadius,
                          imageHeight: imageHeight,
                          imageWidth: imageWidth,
                          elevation: elevation,
                          isAsset: isAssetImage,
                        ),
    );
  }

  static Widget _buildImageWithBottomShader({
    required String imageUrl,
    double? imageWidth,
    double? imageHeight,
    required double borderRadius,
    required bool isAsset,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [
            Colors.black.withOpacity(Sizes.dimen_0_5),
            Colors.transparent,
          ],
        ).createShader(rect),
        blendMode: BlendMode.darken,
        child: _buildCachedImage(
          imageUrl: imageUrl,
          borderRadius: borderRadius,
          imageHeight: imageHeight,
          imageWidth: imageWidth,
          isAsset: isAsset,
        ),
      ),
    );
  }

  static Widget _buildImageWithShader({
    required String imageUrl,
    double? imageWidth,
    double? imageHeight,
    required double borderRadius,
    required bool isAsset,
    List<Color>? colors,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors ??
              [
                Colors.black.withOpacity(Sizes.dimen_0_7),
                Colors.transparent,
              ],
        ).createShader(rect),
        blendMode: BlendMode.darken,
        child: _buildCachedImage(
          imageUrl: imageUrl,
          borderRadius: borderRadius,
          imageHeight: imageHeight,
          imageWidth: imageWidth,
          isAsset: isAsset,
        ),
      ),
    );
  }

  static Widget _buildImageWithBottomShaderWithElevation({
    required String imageUrl,
    double? imageWidth,
    double? imageHeight,
    required double borderRadius,
    required double elevation,
    required bool isAsset,
  }) {
    return Material(
      elevation: elevation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [
              Colors.black.withOpacity(Sizes.dimen_0_5),
              Colors.transparent,
            ],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: _buildCachedImage(
            imageUrl: imageUrl,
            borderRadius: borderRadius,
            imageHeight: imageHeight,
            imageWidth: imageWidth,
            isAsset: isAsset,
          ),
        ),
      ),
    );
  }

  static Widget _buildImageWithOutBottomShader({
    required String imageUrl,
    double? imageWidth,
    double? imageHeight,
    required double borderRadius,
    required bool isAsset,
  }) {
    return _buildCachedImageWithClipRect(
      imageUrl: imageUrl,
      borderRadius: borderRadius,
      imageHeight: imageHeight,
      imageWidth: imageWidth,
      isAsset: isAsset,
    );
  }

  static Widget _buildImageWithOutBottomShaderWithElevation({
    required String imageUrl,
    double? imageWidth,
    double? imageHeight,
    required double borderRadius,
    required double elevation,
    required bool isAsset,
  }) {
    return Material(
      elevation: elevation,
      child: _buildCachedImageWithClipRect(
        imageUrl: imageUrl,
        borderRadius: borderRadius,
        imageHeight: imageHeight,
        imageWidth: imageWidth,
        isAsset: isAsset,
      ),
    );
  }

  static Widget _buildCachedImage({
    required String imageUrl,
    double? imageWidth,
    double? imageHeight,
    required double borderRadius,
    required bool isAsset,
  }) {
    return isAsset
        ? Image.asset(
            imageUrl,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.cover,
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          );
  }

  static Widget _buildCachedImageWithClipRect({
    required String imageUrl,
    double? imageWidth,
    double? imageHeight,
    required double borderRadius,
    required bool isAsset,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: _buildCachedImage(
        imageUrl: imageUrl,
        borderRadius: borderRadius,
        imageHeight: imageHeight,
        imageWidth: imageWidth,
        isAsset: isAsset,
      ),
    );
  }

  static Widget pagePadding({
    required Widget child,
    double padding = Sizes.dimen_15,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: child,
    );
  }

  static Widget customCircleAvatar({
    Color backgroundColor = CustomColors.primaryColor,
    IconData icons = Icons.arrow_back,
    double size = Sizes.dimen_10,
    Function()? onTap,
  }) {
    return InkResponse(
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.black12,
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: size,
        child: Icon(
          icons,
          color: Colors.black,
        ),
      ),
    );
  }

  static Widget clipRRectImage({
    String imageUrl = "",
    double borderRadius = Constants.defaultBorderRadius,
    double? imageWidth,
    double? imageHeight,
    bool isOnlyTop = false,
    bool isAsset = false,
    Widget? child,
  }) {
    return ClipRRect(
      borderRadius: isOnlyTop
          ? BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            )
          : BorderRadius.circular(borderRadius),
      child: child ??
          (isAsset
              ? Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: imageWidth,
                  height: imageHeight,
                )
              : showImage(
                  imageUrl,
                  // "https://via.placeholder.com/150",
                  width: imageWidth,
                  height: imageHeight,
                )),
    );
  }

  static Widget showImage(
    String imageUrl, {
    BoxFit fit = BoxFit.cover,
    double? width,
    double? height,
    Widget? errorWidget,
  }) {
    try {
      return CachedNetworkImage(
        fit: fit,
        width: width,
        height: height,
        imageUrl: GetUtils.isURL(imageUrl)
            ? imageUrl
            : Utils.concatenateString([HttpConfig.baseUrl, imageUrl], "/"),
        // imageUrl: "https://via.placeholder.com/150",
        // imageUrl:
        //     "https://images.unsplash.com/photo-1653856114603-d67a3735c376?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        errorWidget: (context, url, error) =>
            errorWidget ?? const Icon(Icons.error),
      );
    } catch (e) {
      return const Icon(Icons.error);
    }
  }

  static Widget fieldNotice({required String noticeTitle}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.info,
          size: Sizes.dimen_20,
          color: Colors.black.withOpacity(.5),
        ),
        SizedBox(width: Sizes.dimen_10),
        Expanded(
          child: CustomTextWidget.bodyOne_50(
            noticeTitle,
          ),
        )
      ],
    );
  }

  static Widget circleIconButton({
    required IconData icon,
    Function()? onPressed,
    String? imgUrl,
    bool isImage = false,
    double scale = .8,
    Color color = Colors.white,
    Color iconColor = Colors.black,
    double elevation = 3,
    double padding = Sizes.dimen_0,
    bool hasBorder = false,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Transform.scale(
        scale: scale,
        child: Material(
          elevation: elevation,
          shape: const CircleBorder(),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(
                    color: hasBorder ? Colors.black : Colors.transparent,
                  )),
              child: isImage
                  ? Padding(
                      padding: const EdgeInsets.all(Sizes.dimen_8),
                      child: Image.asset(
                        imgUrl!,
                        height: Sizes.dimen_25,
                      ),
                    )
                  : IconButton(
                      color: color,
                      alignment: Alignment.center,
                      icon: Icon(
                        icon,
                        color: iconColor,
                      ),
                      onPressed: onPressed),
            ),
          ),
        ),
      ),
    );
  }

  static Widget ratingTag({required double rating}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.dimen_8,
        vertical: Sizes.dimen_2,
      ),
      decoration: allRoundedRectangle(),
      child: Column(
        children: <Widget>[
          CustomTextWidget.bodyOne(
            rating.toString(),
          ),
          const Icon(
            Icons.star_rounded,
            color: CustomColors.primaryColor,
          ),
        ],
      ),
    );
  }

  // static Widget showShimmer(
  //     {required Widget child,
  //     required BuildContext context,
  //     int itemCount = 5,
  //     scrollDirection = Axis.horizontal}) {
  //   return Shimmer.fromColors(
  //     child: child,
  //     baseColor: CustomColors.greyScale4,
  //     highlightColor: CustomColors.greyScale5,
  //   );
  // }

  // static Widget showShimmerList(
  //     {required Widget child,
  //     required BuildContext context,
  //     int? itemCount,
  //     scrollDirection = Axis.horizontal}) {
  //   return Shimmer.fromColors(
  //     child: ListView.separated(
  //       shrinkWrap: true,
  //       scrollDirection: scrollDirection,
  //       separatorBuilder: (context, index) => scrollDirection == Axis.horizontal
  //           ? SizedBox(width: Sizes.dimen_24.w)
  //           : SizedBox(height: Sizes.dimen_24.h),
  //       itemCount: itemCount ?? 5,
  //       itemBuilder: (context, index) => child,
  //     ),
  //     baseColor: CustomColors.greyScale4,
  //     highlightColor: CustomColors.greyScale5,
  //   );
  // }

  static BoxDecoration topRoundedRectangle(
      {Color color = Colors.white,
      double borderRadius = Constants.defaultBorderRadius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
      color: color,
    );
  }

  static BoxDecoration allRoundedRectangle(
      {Color color = Colors.white,
      double borderRadius = Constants.defaultBorderRadius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
    );
  }

  static Widget clipRRect(
      {required Widget child,
      double borderRadius = Constants.defaultBorderRadius}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
    );
  }

  static Widget clipRRectWithMaterial(
      {required Widget child,
      double borderRadius = Constants.defaultBorderRadius,
      double elevation = 5}) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: clipRRect(
        child: child,
      ),
    );
  }

  static Widget countDown(RxBool timeOut) {
    return TweenAnimationBuilder<Duration>(
        duration: const Duration(seconds: 20),
        tween: Tween(begin: const Duration(seconds: 20), end: Duration.zero),
        onEnd: () {
          timeOut(true);
        },
        builder: (BuildContext context, Duration value, Widget? child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds;
          String time =
              '${((minutes) ~/ 60).toString().padLeft(2, '0')}: ${((seconds) % 60).toString().padLeft(2, '0')}';
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomTextWidget.bodyOne(
                time,
                textAlign: TextAlign.center,
              ));
        });
  }

  static Widget curvedBottomNav({required Widget child}) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(
              Sizes.dimen_20,
            ),
            topLeft: Radius.circular(
              Sizes.dimen_20,
            ),
          ),
        ),
        padding: const EdgeInsets.all(Sizes.dimen_9),
        child: child,
      ),
    );
  }
}
