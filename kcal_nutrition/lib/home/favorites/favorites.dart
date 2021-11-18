// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';

import 'package:kcal_nutrition/home/favorites/tabs.dart';

class AppHome extends StatefulWidget {
  AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _selectedIndex = ZERO;
  Color selectedIcon = BLACK;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      selectedIcon = PINK;
    });
  }

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
    favorite(),
    Text('Index 1: Business')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        toolbarHeight: APP_BAR_HEIGHT,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: workSans(
            MID_SIZE,
            MID_WEIGHT,
            SUPER_BLACK,
            TIGHT_SPACING,
          ),
        ),
        elevation: NONE,
      ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: NAV_BAR_HEIGHT,
        child: navBarHolder(),
      ),
    );
  }

  static Align favorite() {
    return Align(
      alignment: Alignment.topCenter,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            tabs(),
          ],
        ),
      ),
    );
  }

  Container navBarHolder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: NAV_SHAPE,
        boxShadow: [
          BoxShadow(
            color: SHADOW,
            spreadRadius: NONE,
            blurRadius: MINIMAL,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: CIRCULAR,
          topRight: CIRCULAR,
        ),
        child: navBar(),
      ),
    );
  }

  BottomNavigationBar navBar() {
    return BottomNavigationBar(
      backgroundColor: WHITE,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      selectedItemColor: PINK,
      unselectedItemColor: BLACK,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        navBarItem(Feather.home, 'home'),
        navBarItem(Feather.search, 'search'),
        navBarCamera(),
        navBarItem(Feather.heart, 'heart'),
        navBarItem(Feather.user, 'user'),
      ],
    );
  }

  BottomNavigationBarItem navBarCamera() {
    return BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: AVATAR_RADIUS,
          backgroundColor: GREEN,
          child: Icon(Feather.camera),
        ),
        label: 'camera');
  }

  BottomNavigationBarItem navBarItem(iconItem, text) {
    return BottomNavigationBarItem(
      icon: Icon(iconItem),
      label: text,
    );
  }
}
