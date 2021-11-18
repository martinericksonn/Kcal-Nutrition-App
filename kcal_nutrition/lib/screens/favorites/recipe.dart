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
            SizedBox(
              height: 70,
              child: Row(children: [
                cardIcon(Icons.schedule_outlined),
                cardText('$time min'),
                cardIcon(Feather.users),
                cardText('$serve serve'),
                starRatings(),
              ]),
            )
          ],
        ),
      ],
    ));
  }
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
