
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../learn_more.dart';

Widget learnMoreBanner(BuildContext context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  if (kDebugMode) {
    print('size: ${deviceInfo.size}');
    print('padding: ${deviceInfo.padding}');
    print('deviceInfo.devicePixelRatio: ${deviceInfo.devicePixelRatio}');
  }

  final bannerImageHeight = (deviceInfo.size.width *
      (9 * deviceInfo.devicePixelRatio) / (16 * deviceInfo.devicePixelRatio));
  if (kDebugMode) {
    print('bannerImageHeight: $bannerImageHeight');
  }
  final bottomOffset = bannerImageHeight - 30;

  return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Image.asset(
          'assets/images/hero-image-overlay.jpg',
          // height: bannerImageHeight,
          width: deviceInfo.size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 50,
          top: 20,
          child: SizedBox(
            height: 110,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text(
                  'Join Us in Our Work!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )
                ),
                const Text(
                    'Support a Positive Change for your Community to Improve Access to Care',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    )
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    fixedSize: const Size(150, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Get Started - Free to Join',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      )
                  ),
                ),
              ]
            ),
          ),
        ),
      ]
  );
}
