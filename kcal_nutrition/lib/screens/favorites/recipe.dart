// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';
import 'package:kcal_nutrition/screens/favorites/foodsAndRecipes.dart';

class Recipe extends StatelessWidget {
  List description = <String>[
    "Grilled Fish Steak is a delicious Mediterranean recipe made by marinating fish fillets in garlic, green chilies and a blend of spices. Tender fish fillets smeared in a simple marinade of lime juice and salt, seared golden. Delicious, isn't it?",
    'To prepare this amazing non-vegetarian recipe, take the fish fillets and massage it gently with oil, keep aside in a plate.',
    'Grind together the garlic, turmeric powder, red chilli powder, green chillies, dill leaves, coriander powder, and salt. Add oil to it and grind to form a paste. Rub this all over the fish fillets and keep aside to marinate for 15 to 30 minutes.',
    'Grill the marinated fish on a preheated grill or oven till golden and crisp on both sides or for 5 minutes. Transfer to a plate.'
  ];

  final image;
  final title;
  final time;
  final serve;

  Recipe({
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
        height: 700,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Image.asset(image),
            Column(
              children: [
                recipeServings(),
                recipeTitle(),
                recipeDiscription(description[RECIPE]),
                headers('Ingredients'),
                ingrdients(),
                headers('Directions'),
                headers('Step 1'),
                recipeDiscription(description[STEP_1]),
                headers('Step 2'),
                recipeDiscription(description[STEP_2]),
                headers('Step 3'),
                recipeDiscription(description[STEP_3]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: modifiedTextButton(
                    'Add to Favorite',
                    navigatorKey.currentState,
                    AppHome,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

// To prepare this amazing non-vegetarian
// recipe, take the fish fillets and massage it
// gently with oil, keep aside in a plate.
  Padding ingrdients() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          ingredientsItem('Fish\n250gm', 'assets/images/fish.png'),
          ingredientsItem('Lemon Juice\n250gm', 'assets/images/cabbage.png'),
          ingredientsItem('Cabbage\n250gm', 'assets/images/chili.png'),
          // Image.asset(
          //   'assets/images/fish.png',
          //   height: 60,
          // ),
          // Image.asset(
          //   'assets/images/cabbage.png',
          //   height: 60,
          // ),
          // Image.asset(
          //   'assets/images/chili.png',
          //   height: 60,
          // ),
        ],
      ),
    );
  }

  Padding ingredientsItem(text, img) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CARD_ING_COLOR,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Image.asset(
              '$img',
              height: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '$text',
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

  Align headers(text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30.0),
        child: Text('$text',
            style: workSans(MID_EXTRA_SIZE, MID_PLUS_WEIGHT, BLACK)),
      ),
    );
  }

  Padding recipeDiscription(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: SizedBox(
          width: 320,
          child: Text(
            '$text',
            style: workSans(
              MID_EXTRA_SIZE,
              MID_WEIGHT,
              BLACK,
              TIGHT_SPACING,
              VERY_LOOSE_HEIGHT,
            ),
          ),
        ),
      ),
    );
  }

  Padding recipeTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
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
    );
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

TextButton modifiedTextButton(
  String text, [
  currentContext,
  destination,
  choice,
  spacing,
]) {
  return TextButton(
    onPressed: () {
      navigatorKey.currentState!.pop(
        MaterialPageRoute(
          builder: (context) => (AppHome()),
        ),
      );
    },
    child: Text(
      text,
      style: workSans(
        BIG_SIZE,
        MID_WEIGHT,
        WHITE,
      ),
    ),
    style: TextButton.styleFrom(
      primary: WHITE,
      backgroundColor: PINK,
      minimumSize: BUTTON_SIZE,
      shape: BUTTON_SHAPE,
    ),
  );
}
