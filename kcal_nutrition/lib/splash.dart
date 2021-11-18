// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kcal_nutrition/constans.dart';
import 'onboarding/welcome.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var data = 5;
  TextStyle appTitle = GoogleFonts.nunito(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  TextStyle developerTitle = GoogleFonts.nunito(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: Colors.white54,
  );

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => OnBoarding(
                  title: 'Welcome',
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GREEN,
      body: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 3500),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgStickers.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'kcal',
                style: appTitle,
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.8),
              child: Text(
                'LAPETAJE',
                style: developerTitle,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
