import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcal_nutrition/constans.dart';

void navigator(
  currentContext,
  destination,
  choice,
) {
  switch (choice) {
    case PUSH:
      pushPage(currentContext, destination);
      break;
    case POP:
      popPage(currentContext, destination);
      break;
    default:
  }
}

void pushPage(currentContext, destination) {
  Navigator.push(
    currentContext,
    MaterialPageRoute(
      builder: (context) => destination,
    ),
  );
}

void popPage(currentContext, destination) {
  Navigator.pushReplacement(
    currentContext,
    MaterialPageRoute(
      builder: (context) => destination,
    ),
  );
}

TextButton textButton(
  String text,
  currentContext,
  destination,
  choice, [
  spacing,
]) {
  return TextButton(
    onPressed: () {
      navigator(currentContext, destination, choice);
    },
    child: Text(
      text,
      style: workSans(
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

TextStyle workSans(
  fontSize,
  weight,
  color, [
  space = DEFAULT_SPACING,
]) {
  return GoogleFonts.workSans(
    fontSize: fontSize,
    color: color,
    fontWeight: weight,
    letterSpacing: space,
  );
}
