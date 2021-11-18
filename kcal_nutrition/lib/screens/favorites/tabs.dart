// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';
import 'package:kcal_nutrition/screens/favorites/foods.dart';
import 'package:kcal_nutrition/screens/favorites/foodsWithConents.dart';
import 'package:kcal_nutrition/screens/favorites/recipes.dart';

var controller = AdvancedSegmentController('foods');
Column emptyFavorites() {
  return Column(
    children: [
      ValueListenableBuilder<String>(
          valueListenable: controller,
          builder: (_, key, __) {
            if (hasFavorites) {
              switch (key) {
                case FOODS:
                  return favoriteFoods();
                case RECIPES:
                  return recipeContent();
                //tabContainer(RECIPES);
                default:
                  return tabContainer(FOODS);
              }
            } else {
              switch (key) {
                case FOODS:
                  return tabContainer(FOODS);
                case RECIPES:
                  return recipeContent();
                default:
                  return tabContainer(FOODS);
              }
            }
          })
    ],
  );
}

SizedBox tabContainer(title) {
  return SizedBox(
    height: TALL,
    child: Center(
      child: Column(
        children: [
          emptySpace(MEDIUM),
          noFavoriteImage(title),
          emptyTabMessage(title),
          emptySpace(SMALL),
          textButton('Search', POP, LOOSE_SPACING),
        ],
      ),
    ),
  );
}

Image noFavoriteImage(title) {
  return Image.asset(
    'assets/images/$title.png',
    height: AVG,
    width: AVG,
  );
}

SizedBox emptySpace(space) {
  return SizedBox(
    height: space,
  );
}

Padding emptyTabMessage(title) {
  return Padding(
    padding: const EdgeInsets.all(BALANCE),
    child: Column(
      children: [emptyFavTitle(title), emptyFavBody(title)],
    ),
  );
}

Text emptyFavTitle(title) {
  return Text(
    'No ${capitalize(title)} Found',
    style: workSans(
      BIG_SIZE,
      MID_WEIGHT,
      BLACK,
      TIGHT_SPACING,
    ),
  );
}

Padding emptyFavBody(title) {
  return Padding(
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
  );
}

String capitalize(word) {
  return "${word[ZERO].toUpperCase()}${word.substring(ONE)}";
}

AdvancedSegment tabOptions() {
  return AdvancedSegment(
    controller: controller, // AdvancedSegmentController
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
