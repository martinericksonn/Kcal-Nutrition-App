import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcal_nutrition/constans.dart';

TextButton textButton(String text, currentContext, destination) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        currentContext,
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    },
    child: Text(
      text,
      style: workSansWithSpacing(
        BIG_SIZE,
        MID_WEIGHT,
        WHITE,
      ),
    ),
    style: TextButton.styleFrom(
      primary: WHITE,
      backgroundColor: PINK,
      minimumSize: BUTTON_SIZE,
      shape: BUTTON_SHAPE,
    ),
  );
}

TextStyle workSans(double fontSize, FontWeight weight, Color color) {
  return GoogleFonts.workSans(
    fontSize: fontSize,
    color: color,
    fontWeight: weight,
  );
}

TextStyle workSansWithSpacing(double fontSize, FontWeight weight, Color color) {
  return GoogleFonts.workSans(
    fontSize: fontSize,
    color: color,
    fontWeight: weight,
    letterSpacing: BUTTON_DEFAULT_SPACING,
  );
}
