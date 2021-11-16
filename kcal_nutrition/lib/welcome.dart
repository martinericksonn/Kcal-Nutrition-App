// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  "https://i.ibb.co/dWQzmK3/cooking.png",
  "https://i.ibb.co/s3mHTLD/eating.png",
  "https://i.ibb.co/MVZrB5z/health.png",
  "https://i.ibb.co/02XqsbJ/track.png",
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: EdgeInsets.all(15.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 2500.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        child: Column(
                          children: [
                            Text(
                              onboardingMessage(imgList.indexOf(item), 0),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              onboardingMessage(imgList.indexOf(item), 1),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.workSans(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 18,
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
  var message = getOnboardingMessage(index);

  switch (choices) {
    case 0:
      return message[0];
    case 1:
      return message[1];
    default:
      return "null";
  }
}

List<String> getOnboardingMessage(int index) {
  List<String> message = [];

  switch (index) {
    case 0:
      message.add('Eat Healthy');
      message.add(
          'Maintaining good health should be the primary focus of everyone');
      break;
    case 1:
      message.add('Healthy Recipes');
      message
          .add('Browse thousands of healthy\nrecipes from all over the world.');
      break;
    case 2:
      message.add('Track Your Health');
      message.add('With amazing inbuild tools you\ncan track you progess.');
      break;
    case 3:
      message.add('Live Healthy');
      message.add(
          'Healthy foods to look up that will\nsurely give you healty lifestyle.');
      break;
    default:
  }

  return message;
}

class _MyHomePageState extends State<MyHomePage> {
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
            Align(
              alignment: Alignment(0.0, -0.85),
              child: Text(
                'kcal',
                style: appName,
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.3),
              child: CarouselSlider(
                options: CarouselOptions(
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
            Align(
              alignment: Alignment(0.0, 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    // onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: _current == entry.key ? 20.0 : 12,
                      height: _current == entry.key ? 12.0 : 8,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.5),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(140, 100)),
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Color(0xFFFF9386))
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),
            Align(
              alignment: Alignment(0, .75),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Get Started',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(280, 68),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFFF9386),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment(0.0, .87),
                child: RichText(
                  text: TextSpan(
                    text: 'Already Have An Account? ',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Color(0xFF91C789),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
