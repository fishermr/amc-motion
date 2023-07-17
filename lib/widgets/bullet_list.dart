import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget bulletList(BuildContext context, list) {
  List<String> listStr = list;
  MediaQueryData deviceInfo = MediaQuery.of(context);
  return Container(
    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
    color: Colors.white,
    child: Column(
      children: listStr.map((lineItem){
        return Row(
            children:[
              // const Text("\u2022", style: TextStyle(fontSize: 12),), //bullet text
              SizedBox(width: deviceInfo.size.width-60, //space between bullet and text
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                  child:
                  Text(
                    lineItem,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ),//text
            ]
        );
      }).toList(),
    ),
  );
}