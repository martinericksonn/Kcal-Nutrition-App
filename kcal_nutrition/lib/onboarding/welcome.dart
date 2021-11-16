// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kcal_nutrition/onboarding/constans.dart';

final List<String> imgList = [
  "https://i.ibb.co/s3mHTLD/eating.png",
  "https://i.ibb.co/dWQzmK3/cooking.png",
  "https://i.ibb.co/MVZrB5z/health.png",
  "https://i.ibb.co/02XqsbJ/track.png",
];

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OnBoarding> createState() => _OnBoardingState();
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

String onboardingMessage(int index, int choices) {
  List<String> displayText = [];
  String header = '', body = '';

  switch (index) {
    case 0:
      header = 'Eat Healthy';
      body = 'Maintaining good health\nshould be the focus of all ';
      break;
    case 1:
      header = 'Healthy Recipes';
      body = 'Browse a tons of healthy\nrecipes from all over world.';
      break;
    case 2:
      header = 'Track Your Health';
      body = 'With amazing inbuild tools\nyou can track you progess.';
      break;
    case 3:
      header = 'Live Healthy';
      body = 'Healthy foods will surely\ngive you healty lifestyle.';
      break;
    default:
  }

  displayText.add(header);
  displayText.add(body);

  switch (choices) {
    case 0:
      return displayText[0];
    case 1:
      return displayText[1];
    default:
      return "null";
  }
}

class _OnBoardingState extends State<OnBoarding> {
  int _current = 0;
  TextStyle appName = GoogleFonts.nunito(
    fontSize: 38,
    fontWeight: FontWeight.w800,
    color: Color(0xFF91C789),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            appLogo(),
            onboardingContent(),
            onboardingIndicator(context),
            homeButton(),
            registerFooter()
          ],
        ),
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

  TextStyle workSansSpacing(double fontSize, FontWeight weight, Color color) {
    return GoogleFonts.workSans(
      fontSize: fontSize,
      color: color,
      fontWeight: weight,
      letterSpacing: 1.0,
    );
  }

  Align registerFooter() {
    return Align(
      alignment: REG_ALIGN,
      child: RichText(
        text: registerText(),
      ),
    );
  }

  TextSpan registerText() {
    return TextSpan(
        text: 'Already Have An Account? ',
        style: workSans(
          MID_SIZE,
          MID_WEIGHT,
          BLACK,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: 'Log In',
            style: TextStyle(
              color: GREEN,
              fontWeight: MID_WEIGHT,
            ),
          ),
        ]);
  }

  Align homeButton() {
    return Align(
      alignment: BTN_ALIGN,
      child: textButton('Get Started'),
    );
  }

  TextButton textButton(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: workSansSpacing(
          HUGE_SIZE,
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

  Align onboardingIndicator(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, 0.43),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            // onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 20.0 : 12,
              height: _current == entry.key ? 12.0 : 8,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(140, 100)),
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xFFFF9386))
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Align onboardingContent() {
    return Align(
      alignment: Alignment(0.0, -0.3),
      child: SizedBox(
        child: CarouselSlider(
          options: CarouselOptions(
              height: 400,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: imageSliders,
        ),
      ),
    );
  }

  Align appLogo() {
    return Align(
      alignment: Alignment(0.0, -0.85),
      child: Text(
        'kcal',
        style: appName,
      ),
    );
  }
}
