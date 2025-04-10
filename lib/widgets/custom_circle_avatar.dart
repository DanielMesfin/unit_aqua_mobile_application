import 'dart:io';

import 'package:flutter/material.dart';
import '../common/constants/constants.dart';
import '../common/constants/size_constants.dart';
import '../themes/custom_colors.dart';

class CustomCircleAvatar extends StatefulWidget {
  final String? imageUrl;
  final File? imageFile;
  final Color bgColor, textColor;
  final String? initials;
  final double radius;
  final double fontSize;
  final bool isAssetImage;
  final bool isFileImage;
  const CustomCircleAvatar({
    this.imageUrl = "",
    this.imageFile,
    this.initials,
    this.bgColor = CustomColors.primaryColor,
    this.fontSize = Sizes.dimen_16,
    this.textColor = Colors.white,
    this.radius = 20,
    this.isAssetImage = false,
    this.isFileImage = false,
    super.key,
  });

  @override
  _CustomCircleAvatarState createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  bool _checkLoading = true;

  @override
  void initState() {
    if (widget.isAssetImage || widget.isFileImage) {
      setState(() {
        _checkLoading = false;
      });
    } else if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
      try {
        NetworkImage(widget.imageUrl!)
            .resolve(const ImageConfiguration())
            .addListener(ImageStreamListener((ImageInfo info, bool syncCall) {
          if (mounted) {
            setState(() {
              _checkLoading = false;
            });
          }
        }));
        // ignore: empty_catches
      } catch (e) {}
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_checkLoading == true &&
        !widget.isAssetImage &&
        !widget.isFileImage &&
        widget.initials!.isNotEmpty) {
      return CircleAvatar(
        radius: widget.radius,
        backgroundColor: widget.bgColor,
        child: FittedBox(
          child: Text(
            widget.initials!,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize,
            ),
          ),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundImage: !widget.isAssetImage && !widget.isFileImage
            ? NetworkImage(widget.imageUrl!)
            : !widget.isAssetImage && widget.isFileImage
                ? Image.file(widget.imageFile!).image
                : const AssetImage("${Constants.assetImage}/user.png"),
        radius: widget.radius,
        backgroundColor: widget.isAssetImage ? Colors.white : widget.bgColor,
      );
    }
  }
}
