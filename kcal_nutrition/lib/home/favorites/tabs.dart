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
  final _controller = AdvancedSegmentController('all');
  @override
  Widget build(BuildContext context) {
    return tabs();
  }

  AdvancedSegment tabs() {
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
      sliderOffset: 0.0,
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
