// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';

final _controller = AdvancedSegmentController('foods');

@override
Widget build(BuildContext context) {
  return tabs();
}

Column tabs() {
  return Column(
    children: [
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
    height: TALL,
    child: Center(
      child: Column(
        children: [
          SizedBox(
            height: MEDIUM,
          ),
          Image.asset(
            'assets/images/$title.png',
            height: AVG,
            width: AVG,
          ),
          emptyTabTitle(title),
          SizedBox(
            height: 80,
          ),
          textButton(
            'Search',
            POP,
            LOOSE_SPACING,
          ),
        ],
      ),
    ),
  );
}

Padding emptyTabTitle(title) {
  return Padding(
    padding: const EdgeInsets.all(BALANCE),
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
          padding: const EdgeInsets.all(TIGHT),
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
  return "${word[ZERO].toUpperCase()}${word.substring(ONE)}";
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
    borderRadius: const BorderRadius.all(Radius.circular(ROUNDER)),
    itemPadding: const EdgeInsets.symmetric(
      // EdgeInsets
      horizontal: SPACE_UP_DOWN,
      vertical: SPACE_LEFT_RIGHT,
    ),
    shadow: const <BoxShadow>[
      BoxShadow(),
    ],
  );
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}
