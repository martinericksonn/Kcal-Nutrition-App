// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors_in_immutables
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
// import 'package:octicons_icon/octicons.dart';

class AppHome extends StatefulWidget {
  AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
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
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: BLACK,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.search,
              color: BLACK,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.camera,
              color: BLACK,
            ),
            label: 'camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.heart,
              color: BLACK,
            ),
            label: 'heart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.user,
              color: BLACK,
            ),
            label: 'user',
          ),
        ],
      ),
    );
  }
}
