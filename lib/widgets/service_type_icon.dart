import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

Widget serviceTypeIcon(BuildContext context, String iconName) {

  List<String> imageNames = [
    'a1.jpg',
    'a2.jpg',
    'a3.jpg',
    'a4.jpg',
    'a5.png',
    'a6.jpg',
    'a7.jpg',
    'a8.jpg',
    'a9.jpg',
    'a10.jpg',
    'a11.jpg'
  ];

  const serviceTypeOnePng = Image(image: AssetImage('assets/images/basic-needs.png'));
  const serviceTwoTypePng = Image(image: AssetImage('assets/images/brain-health.png'));
  const serviceThreePng = Image(image: AssetImage('assets/images/transportation.png'));
  const serviceFourPng = Image(image: AssetImage('assets/images/primary-care.png'));
  const serviceFivePng = Image(image: AssetImage('assets/images/housing.png'));

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