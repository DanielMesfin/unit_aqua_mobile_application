import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/constants/size_constants.dart';
import 'custom_colors.dart';

class ThemeText {
  static TextStyle headlineOne = GoogleFonts.poppins(
    fontSize: Sizes.dimen_20,
    fontWeight: FontWeight.w600,
    // color: Colors.black,
  );
  static TextStyle headlineTwo = GoogleFonts.poppins(
    fontSize: Sizes.dimen_20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle headlineThree = GoogleFonts.poppins(
    fontSize: Sizes.dimen_16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle headlineWhiteThree = GoogleFonts.poppins(
    fontSize: Sizes.dimen_16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle headlineFour = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static TextStyle headlinePrimaryOne = GoogleFonts.poppins(
    fontSize: Sizes.dimen_20,
    fontWeight: FontWeight.w500,
    color: CustomColors.primaryColor,
  );

  static TextStyle bodyBoldOne = GoogleFonts.poppins(
    fontSize: Sizes.dimen_15,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle bodyBoldTwo = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle bodyBoldWhiteTwo = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle bodyOne = GoogleFonts.poppins(
    fontSize: Sizes.dimen_15,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontStyle: FontStyle.normal,

  );
  static TextStyle bodyTwo = GoogleFonts.poppins(
    fontSize: Sizes.dimen_13,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static TextStyle bodyThreeItalic = GoogleFonts.poppins(
    fontSize: Sizes.dimen_11,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: Colors.black.withOpacity(.5),
  );
  static TextStyle bodyThree = GoogleFonts.poppins(
    fontSize: Sizes.dimen_11,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(.5),
  );
  static TextStyle bodyWhiteOne = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  static TextStyle bodyGreyLineThrough = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle bodyPrimaryColorLineThrough = GoogleFonts.poppins(
    fontSize: Sizes.dimen_16,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle bodyOne_50 = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(.5),
  );
  static TextStyle bodyPrimaryOne = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor,
  );
  static TextStyle bodyPrimaryAccentOne = GoogleFonts.poppins(
    fontSize: Sizes.dimen_14,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor.withOpacity(.5),
  );
  static TextStyle bodyPrimaryTwo = GoogleFonts.poppins(
    fontSize: Sizes.dimen_13,
    fontWeight: FontWeight.normal,
    color: CustomColors.primaryColor,
  );

  static TextStyle errorWhiteText = TextStyle(
    fontSize: Sizes.dimen_16,
    color: Colors.white,
    fontFamily: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
    ).fontFamily,
  );

  static TextStyle warningTextStyle = TextStyle(
    fontSize: Sizes.dimen_16,
    color: Colors.black,
    fontFamily: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
    ).fontFamily,
  );

  static TextStyle successTextStyle = TextStyle(
    fontSize: Sizes.dimen_16,
    color: Colors.white,
    fontFamily: GoogleFonts.poppins(
      fontWeight: FontWeight.normal,
    ).fontFamily,
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: CustomColors.primaryColor,
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: CustomColors.primaryColor,
    colorScheme: const ColorScheme.light(),
  );
}
