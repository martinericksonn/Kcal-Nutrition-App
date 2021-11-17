// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final _controller = AdvancedSegmentController('foods');
  @override
  Widget build(BuildContext context) {
    return tabs();
  }

  Column tabs() {
    return Column(
      children: [
        tabOptions(),
        ValueListenableBuilder<String>(
            valueListenable: _controller,
            builder: (_, key, __) {
              switch (key) {
                case FOODS:
                  return tabContents(FOODS);
                case RECIPES:
                  return tabContents(RECIPES);
                default:
                  return const SizedBox();
              }
            })
      ],
    );
  }

  SizedBox tabContents(title) {
    return SizedBox(
      height: 500,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Image.asset(
              'assets/images/$title.png',
              height: 100,
              width: 100,
            ),
            emptyTabTitle(title),
          ],
        ),
      ),
    );
  }

  Padding emptyTabTitle(title) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Text(
            'No ${capitalize(title)} Found',
            style: workSans(
              BIG_SIZE,
              MID_WEIGHT,
              BLACK,
              TIGHT_SPACING,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "You don't save any $title. Go ahead,\nsearch and save your favorite $title.",
              textAlign: TextAlign.center,
              style: workSans(
                MID_SIZE,
                MID_WEIGHT,
                BLACK,
                TIGHT_SPACING,
                LOOSE_HEIGHT,
              ),
            ),
          )
        ],
      ),
    );
  }

  String capitalize(word) {
    return "${word[0].toUpperCase()}${word.substring(1)}";
  }

  AdvancedSegment tabOptions() {
    return AdvancedSegment(
      controller: _controller, // AdvancedSegmentController
      // ignore: prefer_const_literals_to_create_immutables
      segments: {
        'foods': 'Foods',
        'recipes': 'Recipes',
      },
      activeStyle: workSans(
        MID_PLUS_SIZE,
        MID_PLUS_WEIGHT,
        WHITE,
      ),
      inactiveStyle: workSans(
        MID_PLUS_SIZE,
        MID_PLUS_WEIGHT,
        GREEN,
      ),
      backgroundColor: LIGHT_GREEN,
      sliderColor: GREEN,
      sliderOffset: NONE,
      animationDuration: Duration(milliseconds: 100),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      itemPadding: const EdgeInsets.symmetric(
        // EdgeInsets
        horizontal: 44,
        vertical: 18,
      ),
      shadow: const <BoxShadow>[
        BoxShadow(),
      ],
    );
  }
}
