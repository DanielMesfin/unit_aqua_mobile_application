import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/custom_colors.dart';
import '../../themes/theme_text.dart';
import '/common/enums/api_enums.dart';

extension SnackBarTextStyles on ResponseMessage {
  String get message => describeEnum(this);
  TextStyle? get displayTextStyles {
    switch (this) {
      case ResponseMessage.error:
        return ThemeText.errorWhiteText;

      case ResponseMessage.warning:
        return ThemeText.warningTextStyle;

      case ResponseMessage.success:
        return ThemeText.successTextStyle;

      default:
        return null;
    }
  }
}

extension DateTimeFormatExtension on DateTime {
  DateTime toLocalDateTime({String format = "yyyy-MM-dd HH:mm:ss"}) {
    var dateTime = DateFormat(format).parse(toString(), true);
    return dateTime;
  }
}

extension HomeCategoryTitle on int {
  String get getHomeCategoryTitle {
    switch (this) {
      case 1:
        return "Restaurants";
      case 4:
        return "Essentials";
      case 2:
        return "Liquor";
      case 3:
        return "Gifts";
      default:
        return "Restaurants";
    }
  }
}

extension SnackBarIcons on ResponseMessage {
  String get message => describeEnum(this);
  Icon? get displayIcon {
    switch (this) {
      case ResponseMessage.error:
        return const Icon(Icons.error, color: Colors.white);

      case ResponseMessage.warning:
        return const Icon(
          Icons.warning,
          color: Colors.black,
        );

      case ResponseMessage.success:
        return const Icon(Icons.check, color: Colors.white);

      default:
        return null;
    }
  }
}

extension SnackBarBackgroundColors on ResponseMessage {
  String get message => describeEnum(this);
  Color? get displayBackgroundColor {
    switch (this) {
      case ResponseMessage.error:
        return CustomColors.errorColor;

      case ResponseMessage.warning:
        return CustomColors.warningColor;

      case ResponseMessage.success:
        return Colors.green.shade700;

      default:
        return null;
    }
  }
}

extension StringUtils on String {
  String? getLettersFromSingleWord({int characterLength = 1}) {
    return this[0];
  }

  String? getLettersFromMultipleWords(
      {Pattern splitPattern = " ",
      required int splitIndex,
      int characterLength = 0}) {
    String str = this;
    return str.split(splitPattern)[splitIndex][characterLength];
  }

  String get getStringInSideQuotes => allMatches(r'[^\w\s]+').first.input;
}

extension TimeOfDayExtensions on TimeOfDay {
  String format12Hour(BuildContext context) {
    TimeOfDay time = replacing(hour: hourOfPeriod);
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final StringBuffer buffer = StringBuffer();

    buffer.write(time.format(context));

    return '$buffer';
  }
}

extension DateTimeExtension on DateTime {
  DateTime setTimeOfDay(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  DateTime setTime(
      {int hours = 0,
      int minutes = 0,
      int seconds = 0,
      int milliSeconds = 0,
      int microSeconds = 0}) {
    return DateTime(year, month, day, hours, minutes, seconds,
        milliSeconds, microSeconds);
  }

  DateTime clearTime() {
    return DateTime(year, month, day, 0, 0, 0, 0, 0);
  }
}
