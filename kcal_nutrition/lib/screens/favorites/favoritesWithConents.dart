// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';
import 'package:kcal_nutrition/screens/favorites/tabs.dart';

Padding favoriteFoods() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 12.0,
      left: 14.0,
      right: 14.0,
    ),
    child: SizedBox(
      child: Center(
        child: Table(
            border: TableBorder.all(
              color: WHITE,
              width: 5,
            ),
            columnWidths: const <int, TableColumnWidth>{},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
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
            ]),
      ),
    ),
  );
}

Padding cardContents(title) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: NONE,
      color: CARD_COLOR,
      child: SizedBox(
        width: 200,
        height: 80,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: MID_SIZE,
                left: MID_SIZE,
                bottom: MID_SIZE,
              ),
              child: Image.asset(
                'assets/images/$title.png',
                height: 40,
                width: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
              ),
              child: Text(
                capitalize(title),
                style: workSans(
                  MID_PLUS_SIZE,
                  MID_WEIGHT,
                  CARD_TITLE_COLOR,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Positioned(
                      right: 10,
                      top: 30,
                      child: Icon(
                        // Feather.chevron_right,Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: MID_PLUS_SIZE,
                        color: CARD_TITLE2_COLOR,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    ),
  );
}
