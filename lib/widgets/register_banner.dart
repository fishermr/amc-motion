import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../learn_more.dart';

Widget registerBannerSection(BuildContext context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  double screenWidth = deviceInfo.size.width;
  String registerOne = 'Your organization was recommended to us by another '
    'community-based care provider. Together, we can achieve a better, '
    'stronger, healthier ecosystem for all concerned and involved.';
  String registerTwo = 'We ask that you sign your organization up to '
    'AccessMeCare so together we can make the greatest impact. Just take a '
    'few minutes to register your organization. Thank you!';
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
    alignment: Alignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Image.asset(
          'assets/images/shaded-image.jpg',
          width: deviceInfo.size.width,
          // fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column (
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child:SizedBox(
                width: screenWidth - 70,
                child: Text(
                  'Sign Your Organization Up for Free Today',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth - 70,
              child: Text(
                  registerOne,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child:SizedBox(
                width: screenWidth - 70,
                child: Text(
                    registerTwo,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Register',
                  style:Theme.of(context).textTheme.labelSmall),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child:SizedBox(
                width: screenWidth - 70,
                child: Text(
                    'Working Together to Create a Local and More Relevant Care Experience',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
      ),
    ),
  ]
  );
}
