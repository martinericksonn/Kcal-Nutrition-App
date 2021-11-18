// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/screens/favorites/tabs.dart';

import '../../essentials.dart';

class Foods extends StatelessWidget {
  final title;
  const Foods({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        toolbarHeight: APP_BAR_HEIGHT,
        centerTitle: true,
        title: Text(
          'Foods',
          style: workSans(
            MID_SIZE,
            MID_PLUS_WEIGHT,
            SUPER_BLACK,
            TIGHT_SPACING,
          ),
        ),
        elevation: NONE,
      ),
      body: foodContents(),
    );
  }

  Center foodContents() {
    return Center(
      child: SizedBox(
        width: 330,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(BORDER_AVG_RADIUS),
                ),
              ),
              elevation: NONE,
              color: CARD_COLOR,
              child: SizedBox(
                height: 90,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/$title.png',
                        height: 90,
                      ),
                    ),
                    Column(
                      children: [
                        Text(capitalize('asdasd'),
                            style: workSans(
                              LESS_BIG_SIZE,
                              MID_PLUS_WEIGHT,
                              CARD_TITLE2_COLOR,
                            )),
                        Text('Alternative Names: Biscuit',
                            style: workSans(
                              MID_SIZE,
                              MID_WEIGHT,
                              CARD_TITLE_COLOR,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
