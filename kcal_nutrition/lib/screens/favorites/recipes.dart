// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';

Padding recipeContent() {
  return Padding(
    padding: const EdgeInsets.only(top: 14.0),
    child: Expanded(
      child: SizedBox(
        height: 525,
        width: 320,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            recipeCards(
              '55',
              '3',
              'Fish Stakes With Veggie Sauce',
              'Boneless with stakes with crispy fried\nsauce and topings.',
            ),
            recipeCards(
              '55',
              '3',
              'Fish Stakes With Veggie Sauce',
              'Boneless with stakes with crispy fried\nsauce and topings.',
            ),
            recipeCards(
              '55',
              '3',
              'Fish Stakes With Veggie Sauce',
              'Boneless with stakes with crispy fried\nsauce and topings.',
            ),
          ],
        ),
      ),
    ),
  );
}

Padding recipeCards(time, serve, title, body) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(BORDER_AVG_RADIUS),
        ),
      ),
      elevation: NONE,
      color: CARD_COLOR,
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/fish_steaks.jpg',
                        height: 133, width: 323),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(children: [
                    cardIcon(Icons.schedule_outlined),
                    cardText('$time min'),
                    cardIcon(Feather.users),
                    cardText('$serve serve'),
                    starRatings(),
                  ]),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      title,
                      style: workSans(
                        MID_EXTRA_SIZE,
                        MID_PLUS_WEIGHT,
                        SUPER_BLACK,
                        TIGHT_SPACING,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 10,
                      bottom: 12,
                    ),
                    child: Text(
                      body,
                      style: workSans(
                        MID_SIZE,
                        MID_WEIGHT,
                        BLACK,
                        DEFAULT_SPACING,
                        LOOSE_HEIGHT,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 20,
              child: Icon(
                Feather.heart,
                color: WHITE,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Padding starRatings() {
  return Padding(
    padding: const EdgeInsets.only(left: 45.0, right: 0),
    child: Row(
      children: [
        cardIcon(Icons.star, PINK),
        cardIcon(Icons.star, PINK),
        cardIcon(Icons.star, PINK),
        cardIcon(Icons.star, PINK),
        cardIcon(Icons.star, PINK),
      ],
    ),
  );
}

Icon cardIcon(iconType, [iconColor = CARD_TITLE_COLOR]) {
  return Icon(
    iconType,
    color: iconColor,
    size: 14,
  );
}

Padding cardText(text) {
  return Padding(
    padding: const EdgeInsets.only(left: 6.0, right: 12),
    child: Text('$text',
        style: workSans(
          MID_SIZE,
          MID_WEIGHT,
          CARD_TITLE_COLOR,
        )),
  );
}
