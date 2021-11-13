import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'kcal',
          style: GoogleFonts.workSans(
            fontSize: 48,
          ),
        ),
      ),
    );
  }
}
