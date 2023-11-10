
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
          left: 20,
          top: 20,
          child: SizedBox(
            height: 112,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'Join Us in Our Work!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                    'Support a Positive Change for your Community to Improve Access to Care',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your on pressed event here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Get Started - Free to Join',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  ),
              ]
            ),
          ),
        ),
      ]
  );
}
