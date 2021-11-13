// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF91C789),
      body: Container(
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
              style: GoogleFonts.nunito(
                fontSize: 72,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.8),
            child: Text(
              'LAPETAJE',
              style: GoogleFonts.nunito(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.white54,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

//  children: Text(
//           'kcal',
//           style: GoogleFonts.nunito(
//             fontSize: 72,
//             fontWeight: FontWeight.w800,
//             color: Colors.white,
//           ),
//         ),