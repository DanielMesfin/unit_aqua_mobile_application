import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unity_labs/common/extensions/utils.dart';

import '../common/constants/constants.dart';
import '../common/enums/api_enums.dart';
import '../themes/custom_colors.dart';
import '../widgets/custom_text_widget.dart';

enum DialogAction { yes, no }

class DialogHelpers {
  static DialogHelpers? dialogHelpers;

  static DialogHelpers? getInstance() {
    dialogHelpers ??= DialogHelpers();
    return dialogHelpers;
  }

  Future<DialogAction> showAlertDialog(
      {required String title,
      String? content,
      required Function executePositiveActionFunction,
      Function? executeNegativeActionFunction,
      Widget? contentWidget,
      String? actionPositiveTitle,
      String? actionNegativeTitle,
      bool showSingleAction = false,
      bool enablePositiveActionButton = true}) async {
    if (content == null) {
      assert(contentWidget != null,
          "If you don't provide content you must provide content widget");
    }
    if (contentWidget == null) {
      assert(content != null,
          "If you didn't provide contentWidget you must provide content");
    }
    final BuildContext context = Get.context!;
    DialogAction action = DialogAction.no;

    final List<Widget> actions = [
      if (!showSingleAction)
        TextButton(
          onPressed: () {
            Navigator.of(Get.context!).pop(DialogAction.no);
          },
          child: CustomTextWidget.bodyOne_50(
            actionNegativeTitle ?? "no",
          ),
        ),
      TextButton(
        onPressed: () {
          if (!enablePositiveActionButton) return;
          Navigator.of(Get.context!).pop(DialogAction.yes);
        },
        child: CustomTextWidget.bodyPrimaryOne(
          actionPositiveTitle ?? "yes",
        ),
      ),
    ];
    if (Platform.isAndroid) {
      action = await _materialAlertDialog(
          context, title, content, actions, contentWidget);
      if (action == DialogAction.yes) {
        executePositiveActionFunction();
      } else {
        executeNegativeActionFunction == null
            ? null
            : executeNegativeActionFunction();
      }
    } else {
      action = await _cupertinoAlertDialog(
          context, title, content, actions, contentWidget);
      if (action == DialogAction.yes) {
        executePositiveActionFunction();
      } else {
        executeNegativeActionFunction == null
            ? null
            : executeNegativeActionFunction();
      }
    }
    return action;
  }

  Future<DialogAction> _materialAlertDialog(BuildContext context, String title,
      String? content, List<Widget> actions, Widget? contentWidget) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: CustomTextWidget.headlineOne(
          title,
        ),
        content: contentWidget ??
            CustomTextWidget.bodyOne(
              content!,
              maxLines: 3,
            ),
        actions: actions,
      ),
    );
  }

  Future<DialogAction> _cupertinoAlertDialog(BuildContext context, String title,
      String? content, List<Widget> actions, Widget? contentWidget) async {
    return await showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: CustomTextWidget.headlineOne(
          title,
        ),
        content: contentWidget ??
            CustomTextWidget.bodyOne(
              content!,
              maxLines: 3,
            ),
        actions: actions,
      ),
    );
  }

  static List<Widget> alertDialogYesOrNoComponents({yesAction, noAction}) {
    List<Widget> actions = [
      TextButton(
        onPressed: () {
          noAction();
        },
        child: CustomTextWidget.bodyOne_50("no"),
      ),
      TextButton(
        onPressed: () {
          yesAction();
        },
        child: CustomTextWidget.bodyOne_50("yes"),
      ),
    ];
    return actions;
  }

  showSnackBarGetx({
    required String content,
    required ResponseMessage responseMessage,
    SnackPosition position = SnackPosition.BOTTOM,
    SnackStyle style = SnackStyle.GROUNDED,
    int duration = Constants.snackBarDuration,
  }) {
    Get.snackbar(
      '',
      '',
      snackPosition: position,
      snackStyle: SnackStyle.FLOATING,
      messageText: CustomTextWidget(
        content,
        style: responseMessage.displayTextStyles,
        maxLines: 3,
      ),
      duration: Duration(seconds: duration),
      titleText: Container(),
      margin: const EdgeInsets.only(
          bottom: kBottomNavigationBarHeight, left: 8, right: 8),
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 16, right: 16),
      borderRadius: 4,
      icon: responseMessage.displayIcon,
      backgroundColor: responseMessage.displayBackgroundColor,
      colorText: CustomColors.titleColor,
    );
  }

  static showLoadingDialog(BuildContext? context,
      [Color color = CustomColors.primaryColor]) {
    context ?? Get.overlayContext!;
    showDialog(
      context: context!,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (_) => Center(
        child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator.adaptive(
              // strokeWidth: 5,
              backgroundColor: color,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            )),
      ),
    );
  }

  static Future<T> showBottomSheetDialog<T>(
    BuildContext context,
    Function builder,
  ) async {
    return await showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) => builder(),
    );
  }
}
