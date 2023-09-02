import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

Widget serviceIcon(BuildContext context, String iconUrl) {
  return Container(
      color: Colors.white,
      child: (
          Row (
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SvgPicture.network(
                        iconUrl,
                        semanticsLabel: 'SVG From Network',
                        height: 17,
                        fit: BoxFit.fitHeight,
                        /*placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator()), //placeholder while downloading file.*/
                      )
                    ],
                  ),
                ),
              ]
          )
      )
  );
}