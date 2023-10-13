
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../learn_more.dart';

Widget bannerSection(BuildContext context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  if (kDebugMode) {
    // print('size: ${deviceInfo.size}');
    // print('padding: ${deviceInfo.padding}');
    // print('deviceInfo.devicePixelRatio: ${deviceInfo.devicePixelRatio}');
  }

  final bannerImageHeight = (deviceInfo.size.width *
      (9 * deviceInfo.devicePixelRatio) / (16 * deviceInfo.devicePixelRatio));
  if (kDebugMode) {
    // print('bannerImageHeight: $bannerImageHeight');
  }
  final bottomOffset = bannerImageHeight - 30;

  return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Image.asset(
          'assets/images/hero-image.jpg',
          // height: bannerImageHeight,
          width: deviceInfo.size.width,
          fit: BoxFit.cover,
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                if (kDebugMode) {
                  print('LEARN MORE touched');
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      const LearnMorePage(serviceName: 'Learn More')),
                );

              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(width: 2.0, color: Colors.white),
              ),
              child: const Text(
                  'LEARN MORE'
              ),
          ),
        ),
      ]
  );
}
