// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_field, file_names
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';
import 'package:kcal_nutrition/screens/favorites/tabs.dart';
import 'package:kcal_nutrition/screens/home/home.dart';

// ignore: must_be_immutable
bool hasFavorites = false;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppHome extends StatefulWidget {
  AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List title = <String>['Home', 'Search', 'Camera', 'Favorites', 'User'];
  int _selectedIndex = FAVORITES;
  Color selectedIcon = BLACK;
  // ignore: prefer_typing_uninitialized_variables
  static var widgetToDisplay;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      selectedIcon = PINK;
      hasFavorites = hasFavorites ? false : true;
      widgetToDisplay = hasFavorites ? favorite : emptyFavorites;
    });
  }

  static var textTyle = workSans(
    MID_SIZE,
    MID_WEIGHT,
    BLACK,
    DEFAULT_SPACING,
    LOOSE_HEIGHT,
  );
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[
    ContentButton(),
    Text(
      'Searching...',
      textAlign: TextAlign.center,
      style: textTyle,
    ),
    Text('Click*', style: textTyle),
    favorite(),
    Text('Developed by\nMartin Erickson Lapetake\nBSCS-3 | USJ-R\nMobile Dev',
        textAlign: TextAlign.center, style: textTyle)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        toolbarHeight: APP_BAR_HEIGHT,
        centerTitle: true,
        title: Text(
          title[_selectedIndex],
          style: workSans(
            MID_SIZE,
            MID_PLUS_WEIGHT,
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
            tabOptions(),
            emptyFavorites(),
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
          child: Icon(
            Icons.photo_camera_rounded,
          ),
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
