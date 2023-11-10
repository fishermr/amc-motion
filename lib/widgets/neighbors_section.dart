
import 'package:flutter/material.dart';

Widget neighborsSection(context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  double screenWidth = deviceInfo.size.width;
  String helpOne = 'Many people living in our community face a tremendous '
    'disparity. One of the best solutions is to empower community- based '
    'organizations and community leaders with better data, more funding '
    'opportunities, and the ability to collaborate more effectively with '
    'other organizations.';
  String helpTwo = 'We all know collaboration leads to stronger organizations, '
      'better care, and healthier lives.';
  String helpThree = 'Because of this, Hillcrest Family Services and a growing '
    'number of area organizations are actively working to improve access to '
    'care across Iowa.';
  String helpFour = 'The moment of change starts when more organizations like '
    'yours signs up to join ';
  String helpFive = 'The greater the local level of involvement becomes the '
    'easier it is to improve community health while increasing economic '
    'opportunity for those living here.';
  String helpSix = 'helps the members of your community obtain easier access '
      'to a greater level of healthcare and professional services. By using ';
  String helpSeven = ', anyone – anywhere – can now plan care for a friend, '
  'family member, loved one, client, or patient in a time of need.';
  return Container(
      color: const Color(0xFFFAFAFA),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text(
                  'Your Neighbors Need Your Help ....',
                  softWrap: false,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'This initiative should matter to you',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: screenWidth,
                child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Text(
                      helpOne,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Text(
                      helpTwo,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Text(
                      helpThree,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Image.asset(
                    'assets/images/neighbors-need-help.png',
                    // height: bannerImageHeight,
                    width: deviceInfo.size.width,
                    fit: BoxFit.cover,
                  ),
               ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            SizedBox(
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: RichText(
                  // Whether the text should break at soft line breaks
                  // softWrap: true,
                  // Maximum number of lines for the text to span
                  //maxLines: 3,
                  // The number of font pixels for each logical pixel
                  // textScaleFactor: 1,
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: helpFour,
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'AccessMeCare™.',
                          style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Text(
                      helpFive,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: RichText(
                    // Whether the text should break at soft line breaks
                    softWrap: true,
                    // Maximum number of lines for the text to span
                    maxLines: 2,
                    // The number of font pixels for each logical pixel
                    textScaleFactor: 1,
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: 'This initiative is powered by - ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'AccessMeCare™.',
                            style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: RichText(
                      // Whether the text should break at soft line breaks
                      softWrap: true,
                      // Maximum number of lines for the text to span
                      maxLines: 6,
                      // The number of font pixels for each logical pixel
                      textScaleFactor: 1,
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'AccessMeCare™ ',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                          TextSpan(
                              text: helpSix,
                              style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                              text: 'AccessMeCare™',
                              style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                              text: helpSeven,
                              style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
}
