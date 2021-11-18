// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcal_nutrition/constans.dart';

final List<String> imgList = [
  "https://i.ibb.co/s3mHTLD/eating.png",
  "https://i.ibb.co/dWQzmK3/cooking.png",
  "https://i.ibb.co/MVZrB5z/health.png",
];

String onboardingMessage(int index, int choices) {
  List<String> displayText = [];
  String header = '', body = '';

  switch (index) {
    case IMAGE_ONE:
      header = 'Eat Healthy';
      body = 'Maintaining good health\nshould be the focus of all ';
      break;
    case IMAGE_TWO:
      header = 'Healthy Recipes';
      body = 'Browse a tons of healthy\nrecipes from all over world.';
      break;
    case IMAGE_THREE:
      header = 'Track Your Health';
      body = 'With amazing inbuild tools\nyou can track you progess.';
      break;

    default:
  }

  displayText.add(header);
  displayText.add(body);

  switch (choices) {
    case HEADER:
      return displayText[HEADER];
    case BODY:
      return displayText[BODY];
    default:
      return "null";
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: EdgeInsets.all(20.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: 2500.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                        width: 2500.0,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        child: Column(
                          children: [
                            Text(
                              onboardingMessage(imgList.indexOf(item), 0),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                onboardingMessage(imgList.indexOf(item), 1),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                softWrap: false,
                                style: GoogleFonts.workSans(
                                  height: 1.5,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              )),
        ))
    .toList();
