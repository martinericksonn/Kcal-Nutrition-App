// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/screens/favorites/foodsAndRecipes.dart';
import 'package:kcal_nutrition/screens/favorites/recipe.dart';
import 'package:kcal_nutrition/screens/favorites/tabs.dart';

import '../../essentials.dart';

class Foods extends StatelessWidget {
  String description =
      "A cookie is a baked or cooked food that is typically small, flat and sweet. It usually contains flour, sugar, ege, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, nuts, etc.\n\nIn most English-speaking countries except for the United States, crunchy cookies are called biscuits. Many Canadians also use this term. Chewier biscuits are sometimes called cookies even in the United Kingdom. Some cookies may also be named by their shape, such as date squares or bars.";
  final title;
  Foods({Key? key, this.title}) : super(key: key);

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
            foodTitleBar(),
            recipeDescription(description),
            headers('Gallery'),
            foodImages(),
            addToFavButton(),
          ],
        ),
      ),
    );
  }

  Row foodImages() {
    return Row(
      children: [
        foodImage('assets/images/cookie-1.png'),
        foodImage('assets/images/cookie-2.png'),
      ],
    );
  }

  Padding foodImage(text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 300,
        width: 150,
        child: Image.asset(
          text,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Card foodTitleBar() {
    return Card(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Text(capitalize(title),
                      style: workSans(
                        LESS_BIG_SIZE,
                        MID_PLUS_WEIGHT,
                        CARD_TITLE2_COLOR,
                      )),
                ),
                Text('Alternative Names: La${title}z',
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
    );
  }

  Align headers(text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 30.0, bottom: 20.0),
        child: Text('$text',
            style: workSans(
              LESS_BIG_SIZE,
              MID_PLUS_WEIGHT,
              BLACK,
            )),
      ),
    );
  }

  Padding recipeDescription(text) {
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

  Padding addToFavButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: modifiedTextButton(
        'Add to Favorite',
        navigatorKey.currentState,
        AppHome,
      ),
    );
  }
}
