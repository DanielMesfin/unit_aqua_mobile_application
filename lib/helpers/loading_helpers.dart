import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constants/constants.dart';
import '../themes/custom_colors.dart';

class LoadingHelper {
  static Widget showLoading(
      {color = CustomColors.primaryColor,
      scale = Constants.defaultCircularProgressIndicatorScale,
      bool isCenter = true}) {
    return isCenter
        ? _buildCenterProgress(scale, color)
        : _buildProgress(scale, color);
  }

  static Widget _buildCenterProgress(scale, color) {
    return Platform.isAndroid
        ? Center(
            child: Transform.scale(
              scale: scale,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          )
        : const Center(
            child: CupertinoActivityIndicator(
              color: Colors.white,
            ),
          );
  }

  static Widget _buildProgress(scale, color) {
    return Platform.isAndroid
        ? Transform.scale(
            scale: scale,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          )
        : const CupertinoActivityIndicator(
            color: Colors.white,
          );
  }
}
