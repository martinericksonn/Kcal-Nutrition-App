// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Hello World"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: BLACK,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: BLACK,
            ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera_rounded,
              color: BLACK,
            ),
            label: 'null',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
              color: BLACK,
            ),
            label: 'null',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              color: BLACK,
            ),
            label: 'null',
          ),
        ],
      ),
    );
  }
}
