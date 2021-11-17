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
                case 'foods':
                  return SizedBox(
                    height: 240,
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset('assets/images/salad.jpg'),
                          emptyTabTitle('No Food Found'),
                        ],
                      ),
                    ),
                  );

                case 'recipes':
                  return SizedBox(
                    height: 240,
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset('assets/images/vegetable.jpg'),
                          emptyTabTitle('No Recipes Found'),
                        ],
                      ),
                    ),
                  );

                default:
                  return const SizedBox();
              }
            })
      ],
    );
  }

  Text emptyTabTitle(title) {
    return Text(title,
        style: workSans(
          BIG_SIZE,
          MID_WEIGHT,
          BLACK,
        ));
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
      sliderOffset: 0.0,
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

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
