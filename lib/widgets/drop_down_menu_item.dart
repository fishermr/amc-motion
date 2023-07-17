import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

DropdownMenuItem<int> dropDownMenuItem(BuildContext context, listItem, indexValue) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  String itemString = listItem as String;
  int itemValue = indexValue;

  return DropdownMenuItem(
    value: itemValue,
    child: Text(
        itemString,
        style: const TextStyle(
          fontSize: 11.0,
        )
    ),
  );
}