import 'package:flutter/material.dart';
import '../common/constants/size_constants.dart';
import 'custom_colors.dart';

class ThemeButton {
  static ButtonStyle primaryButtonStyle = ButtonStyle(
    backgroundColor:
        WidgetStateProperty.all<Color>(CustomColors.primaryColor),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_12),
      ),
    ),
  );
  static ButtonStyle secondaryButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_12),
      ),
    ),
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(
        color: CustomColors.greyScale4,
      ),
    ),
  );
  static ButtonStyle redButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_12),
      ),
    ),
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(
        color: CustomColors.greyScale4,
      ),
    ),
  );
  static ButtonStyle disabledButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.grey),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_12),
      ),
    ),
  );
  static ButtonStyle borderedButtonStyle = ButtonStyle(
    side: WidgetStateProperty.all<BorderSide>(BorderSide(
      width: 1,
      color: Colors.white,
    )),
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_12),
      ),
    ),
  );

  static ButtonStyle greenButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dimen_12),
      ),
    ),
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(
        color: CustomColors.greyScale4,
      ),
    ),
  );
}
