// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';
import 'package:kcal_nutrition/screens/favorites/foodsAndRecipes.dart';

class ContentButton extends StatefulWidget {
  const ContentButton({Key? key}) : super(key: key);

  @override
  _ContentButtonState createState() => _ContentButtonState();
}

class _ContentButtonState extends State<ContentButton> {
  String title = (hasFavorites) ? 'Add Contents' : 'Remove Contents';
  void _onItemTapped() {
    setState(() {
      hasFavorites = hasFavorites ? false : true;
      title = (hasFavorites) ? 'Add Contents' : 'Remove Contents';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: modifiedtextButton(title),
    );
  }

  TextButton modifiedtextButton(
    String text, [
    currentContext,
    destination,
    choice,
    spacing,
  ]) {
    return TextButton(
      onPressed: () {
        _onItemTapped();
        print(hasFavorites);
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
}
