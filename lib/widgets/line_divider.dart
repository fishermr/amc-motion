import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget lineDivider(BuildContext context, thickness) {
  return Container(
    color: Colors.white,
    child: (
        Row (
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: thickness,
                  )
                ],
              ),
            ),
          ]
        )
    )
  );
}