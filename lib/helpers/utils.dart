
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static Utils? utils;

  static Utils? getInstance() {
    utils ??= Utils();
    return utils;
  }

  static String currencyFormatter(
      {required double price, BuildContext? context, Locale? locale}) {
    late Locale localeSymbol;
    // if (locale == null) {
    //   localeSymbol = Localizations.localeOf(context!);
    // } else {
    //   localeSymbol = locale;
    // }
    var format = NumberFormat.simpleCurrency(locale: "am");
    final formatter = NumberFormat.currency(
        name: format.currencyName, symbol: '${format.currencySymbol} ');
    return formatter.format(double.parse(price.toStringAsFixed(2)));
  }

  ///Concatenate Strings with
  static String concatenateString(List<String> strings,
      [String pattern = " "]) {
    var data = "";
    for (var str in strings) {
      data += str + pattern;
    }
    if (data.endsWith(", ")) {
      data = data.substring(0, data.length - 2);
    }
    return data.trimRight();
  }

  static String concatenateStringWithPrefix(
      List<String> strings, String prefix) {
    var data = "";
    for (var str in strings) {
      data += "$str ";
    }

    return '$prefix${data.trimRight()}';
  }

  static String formatDateToString(DateTime date, [bool withDay = false]) {
    return withDay
        ? DateFormat.yMMMEd().add_jm().format(date.toUtc())
        : DateFormat.yMMMd().format(date.toUtc());
  }

  static String formatScheduleDateToString(DateTime date) {
    return DateFormat.jm().format(date.toLocal());
  }

  static DateTime formatScheduleStringToDate(String date) {
    return DateFormat.Hms().parse(date);
  }

  static String? trimJsonKey(String? value) => value?.trim();

  // Future<bool> launchWeb({required String url}) async {
  //   final uri = Uri.parse(url);
  //   try {
  //     if (await canLaunchUrl(uri)) {
  //       return await launchUrl(
  //         uri,
  //       );
  //     }
  //     return DialogHelpers().showSnackBarGetx(
  //       content: "Something went wrong",
  //       responseMessage: ResponseMessage.error,
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return false;
  // }

  // Future<bool> launch({required String url, String scheme = "https"}) async {
  //   final uri = Uri(scheme: scheme, path: url);
  //   try {
  //     if (await canLaunchUrl(uri)) {
  //       return await launchUrl(
  //         uri,
  //       );
  //     }
  //     return DialogHelpers().showSnackBarGetx(
  //       content: "Invalid URL",
  //       responseMessage: ResponseMessage.error,
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return false;
  // }

  // Future<bool> callPhoneNumber({required String phone}) async {
  //   final scheme = Platform.isIOS ? "tel://" : "tel:";
  //   final uri = Uri.parse("$scheme$phone");
  //   try {
  //     if (await canLaunchUrl(uri)) {
  //       return await launchUrl(
  //         uri,
  //       );
  //     }
  //     DialogHelpers().showSnackBarGetx(
  //       content: "Invalid Phone Number",
  //       responseMessage: ResponseMessage.error,
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return false;
  // }

  fieldOnSubmitted(BuildContext context, FocusNode currentFocus) {
    currentFocus.unfocus();
  }

  double itemPriceWithDiscount(
      {required double itemAmount, required int discount}) {
    if (discount == 0) {
      return discount.toDouble();
    }
    return (itemAmount - discount);
  }

  double itemPriceWithDiscountAndQuantity({
    required double itemAmount,
    required int discount,
    required int quantity,
  }) {
    final amount = itemPriceWithDiscount(
      itemAmount: itemAmount,
      discount: discount,
    );
    if (amount == 0) {
      return itemAmount * quantity;
    }
    return itemPriceWithDiscount(
          itemAmount: itemAmount,
          discount: discount,
        ) *
        quantity;
  }

  double itemPriceWithQuantity({
    required double itemAmount,
    required int quantity,
  }) {
    return itemAmount * quantity;
  }

  // String getImageUrl(String folderName, String imageFile) =>
  //     '${HttpConfig.imageUrl}$folderName/$imageFile';
}
