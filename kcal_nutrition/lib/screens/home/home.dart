import 'package:flutter/material.dart';
import 'package:kcal_nutrition/constans.dart';
import 'package:kcal_nutrition/essentials.dart';

SizedBox homeConents() {
  return SizedBox(
    height: TALL,
    child: Center(
      child: Table(
          columnWidths: const <int, TableColumnWidth>{},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(children: [
              Card(
                elevation: 6,
                color: CARD_COLOR,
                child: Container(
                  width: 400,
                  height: 200,
                  child: Row(
                    children: [
                      Image.asset('assets/images/cookie.png'),
                      Text(
                        "Cookie",
                        style: workSans(
                          MID_PLUS_SIZE,
                          MID_WEIGHT,
                          CARD_TITLE2_COLOR,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                  color: CARD_COLOR,
                child: Row(
                  children: [
                    Image.asset('assets/images/cookie.png'),
                    Row(
                      children: [
                        Text(
                          "Cookie",
                          style: workSans(
                            MID_PLUS_SIZE,
                            MID_WEIGHT,
                            CARD_TITLE2_COLOR,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ]),
    ),
  );
}
