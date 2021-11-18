// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';
import 'package:kcal_nutrition/screens/favorites/foods.dart';
import 'package:kcal_nutrition/onboarding/sliders.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _current = ZERO;
  TextStyle appName() {
    return GoogleFonts.nunito(
      fontSize: BIGGER_SIZE,
      fontWeight: EXTRA_BOLD_WEIGHT,
      color: GREEN,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: WHITE,
      body: SafeArea(
        child: Stack(
          children: [
            appLogo(),
            onboardingContent(),
            onboardingIndicator(context),
            homeButton(AppHome()),
            registerFooter()
          ],
        ),
      ),
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
          LOOSE_SPACING,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: 'Log In',
            style: TextStyle(
              color: GREEN,
              fontWeight: BOLD_WEIGHT,
            ),
          ),
        ]);
  }

  Align homeButton(nav) {
    return Align(
      alignment: BTN_ALIGN,
      child: textButton(
        'Get Started',
        context,
        nav,
        POP,
        LOOSE_SPACING,
      ),
    );
  }

  Align onboardingIndicator(BuildContext context) {
    return Align(
      alignment: IND_ALIGN,
      child: indicatorSwitcher(context),
    );
  }

  Row indicatorSwitcher(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          child: indicatorContents(entry, context),
        );
      }).toList(),
    );
  }

  Container indicatorContents(
      MapEntry<int, String> entry, BuildContext context) {
    return Container(
      width: _current == entry.key ? WIDTH_BIG : WIDTH_SMALL,
      height: _current == entry.key ? HEIGHT_BIG : HEIGHT_SMALL,
      margin: EdgeInsets.symmetric(
        vertical: IND_X,
        horizontal: IND_Y,
      ),
      decoration: indicatorDesign(context, entry),
    );
  }

  BoxDecoration indicatorDesign(
      BuildContext context, MapEntry<int, String> entry) {
    return BoxDecoration(
      borderRadius: INDICATOR_SHAPE,
      color: (Theme.of(context).brightness == Brightness.dark
          ? WHITE
          : PINK.withOpacity(_current == entry.key ? DARKEN : LIGHTEN)),
    );
  }

  Align onboardingContent() {
    return Align(
      alignment: OBG_ALIGN,
      child: SizedBox(
        child: sliderContent(),
      ),
    );
  }

  CarouselSlider sliderContent() {
    return CarouselSlider(
      options: CarouselOptions(
          height: SLIDER_HEIGHT,
          aspectRatio: SLIDER_RATIO,
          enlargeCenterPage: true,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      items: imageSliders,
    );
  }

  Align appLogo() {
    return Align(
      alignment: LOGO_ALIGN,
      child: Text(
        'kcal',
        style: appName(),
      ),
    );
  }
}
