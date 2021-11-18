// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';

class Recipe extends StatelessWidget {
  final image;
  final title;
  final time;
  final serve;

  const Recipe({
    Key? key,
    this.image,
    this.title,
    this.time,
    this.serve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        toolbarHeight: APP_BAR_HEIGHT,
        centerTitle: true,
        title: Text(
          'Recipes',
          style: workSans(
            MID_SIZE,
            MID_PLUS_WEIGHT,
            SUPER_BLACK,
            TIGHT_SPACING,
          ),
        ),
        elevation: NONE,
      ),
      body: recipeConents(),
    );
  }

  SizedBox recipeConents() {
    return SizedBox(
        child: ListView(
      children: [
        Image.asset(image),
        Column(
          children: [
            recipeServings(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        '$title',
                        style: workSans(
                          LESS_BIG_SIZE,
                          MID_PLUS_WEIGHT,
                          SUPER_BLACK,
                          DEFAULT_SPACING,
                          LOOSE_HEIGHT,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75.0),
                      child: CircleAvatar(
                        radius: AVATAR_RADIUS,
                        backgroundColor: LIGHT_GREEN,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: GREEN,
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ],
    ));
  }

  Padding recipeServings() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: NONE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        color: CARD_COLOR,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(children: [
            cardIcon(Icons.schedule_outlined),
            cardText('$time min'),
            cardIcon(Feather.users),
            cardText('$serve serve'),
            starRatings(),
          ]),
        ),
      ),
    );
  }
}

Padding starRatings() {
  return Padding(
    padding: const EdgeInsets.only(left: 35.0, right: 0),
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
    size: 16,
  );
}

Padding cardText(text) {
  return Padding(
    padding: const EdgeInsets.only(left: 6.0, right: 12),
    child: Text('$text',
        style: workSans(
          MID_EXTRA_SIZE,
          MID_WEIGHT,
          CARD_TITLE_COLOR,
        )),
  );
}
