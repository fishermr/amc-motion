import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

Widget serviceIcon(BuildContext context, String iconName) {
  return Container(
      color: Colors.white,
      child: (
          Row (
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SvgPicture.network(
                        'https://dreqd1ad59oml.cloudfront.net/hill-crest/svg/client/hfs-logo.svg',
                        semanticsLabel: 'SVG From Network',
                        placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator()), //placeholder while downloading file.
                      )
                    ],
                  ),
                ),
              ]
          )
      )
  );
}