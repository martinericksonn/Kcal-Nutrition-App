// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';
import 'package:kcal_nutrition/screens/favorites/tabs.dart';

Padding favoriteFoods() {
  return Padding(
    padding: const EdgeInsets.only(
      top: ABOVE_PADDING,
      left: SIDE_PADDING,
      right: SIDE_PADDING,
    ),
    child: containerFoodsContent(),
  );
}

SizedBox containerFoodsContent() {
  return SizedBox(
    child: Center(
      child: tableFoodsContent(),
    ),
  );
}

Table tableFoodsContent() {
  return Table(
      border: TableBorder.all(
        color: WHITE,
        width: BORDER_WIDTH,
      ),
      columnWidths: const <int, TableColumnWidth>{},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: tableFoodsRow);
}

List<TableRow> get tableFoodsRow {
  return <TableRow>[
    TableRow(children: [
      cardContents('cookie'),
      cardContents('burger'),
    ]),
    TableRow(children: [
      cardContents('cakes'),
      cardContents('pizza'),
    ]),
    TableRow(children: [
      cardContents('hotdog'),
      cardContents('fries'),
    ]),
    TableRow(children: [
      cardContents('donuts'),
      SizedBox(),
    ]),
  ];
}

Padding cardContents(title) {
  return Padding(
    padding: const EdgeInsets.only(top: IND_X),
    child: foodCards(title),
  );
}

Card foodCards(title) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(BORDER_AVG_RADIUS),
      ),
    ),
    elevation: NONE,
    color: CARD_COLOR,
    child: foodCardContents(title),
  );
}

SizedBox foodCardContents(title) {
  return SizedBox(
    width: BOX_WIDTH,
    height: BOX_HEIGHT,
    child: Row(
      children: [
        foodCardImage(title),
        foodCardName(title),
        foodCardArrow(),
      ],
    ),
  );
}

Expanded foodCardArrow() {
  return Expanded(
    child: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Positioned(
            right: ARROW_ICON_RIGHT,
            top: ARROW_ICON_TOP,
            child: Icon(
              // Feather.chevron_right,Icon(
              Icons.arrow_forward_ios_outlined,
              size: MID_PLUS_SIZE,
              color: CARD_TITLE2_COLOR,
            ),
          ),
        ]),
  );
}

Padding foodCardName(title) {
  return Padding(
    padding: const EdgeInsets.only(
      left: FOOD_NAME_PADDING,
    ),
    child: Text(
      capitalize(title),
      style: workSans(
        MID_PLUS_SIZE,
        MID_WEIGHT,
        CARD_TITLE_COLOR,
      ),
    ),
  );
}

Padding foodCardImage(title) {
  return Padding(
    padding: const EdgeInsets.only(
      top: MID_SIZE,
      left: MID_SIZE,
      bottom: MID_SIZE,
    ),
    child: Image.asset(
      'assets/images/$title.png',
      height: IMAGE_FOOD_SIZE,
      width: IMAGE_FOOD_SIZE,
    ),
  );
}
