import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amcmotion/models/org_configuration_model.dart';

import '../service_page.dart';

const  serviceList = [
  'https://dreqd1ad59oml.cloudfront.net/hill-crest/svg/client/basic-needs.svg',
  'https://dreqd1ad59oml.cloudfront.net/hill-crest/svg/client/brain-health.svg',
  'https://dreqd1ad59oml.cloudfront.net/hill-crest/svg/client/transportation-new.svg',
  'https://dreqd1ad59oml.cloudfront.net/hill-crest/svg/client/primary-care.svg',
  'https://dreqd1ad59oml.cloudfront.net/hill-crest/svg/client/housing.svg',
];

final Widget serviceOneSvg = SvgPicture.network(
  serviceList[0],
  semanticsLabel: 'Basic Needs',
  placeholderBuilder: (BuildContext context) => Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
);
final Widget serviceTwoSvg = SvgPicture.network(
  serviceList[1],
  semanticsLabel: 'Brain Health',
  placeholderBuilder: (BuildContext context) => Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
);
/*final Widget serviceThreeSvg = SvgPicture.asset(
  serviceList[2],
  semanticsLabel: 'Transportation',
  placeholderBuilder: (BuildContext context) => Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
);*/
final Widget serviceFourSvg = SvgPicture.network(
  serviceList[3],
  semanticsLabel: 'Primary Care',
  placeholderBuilder: (BuildContext context) => Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
);
final Widget serviceFiveSvg = SvgPicture.network(
  serviceList[4],
  semanticsLabel: 'Housing',
  placeholderBuilder: (BuildContext context) => Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
);

const serviceOnePng = Image(image: AssetImage('assets/images/basic-needs.png'));
const serviceTwoPng = Image(image: AssetImage('assets/images/brain-health.png'));
const serviceThreePng = Image(image: AssetImage('assets/images/transportation.png'));
const serviceFourPng = Image(image: AssetImage('assets/images/primary-care.png'));
const serviceFivePng = Image(image: AssetImage('assets/images/housing.png'));

Widget serviceSection(context, clientServicesList) {
  navServicePage(serviceType, serviceName) {
    if (kDebugMode) {
      print('serviceType: $serviceType  serviceName: $serviceName');
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          ServicePage(serviceKind: serviceType, serviceName: serviceName)),
    );
  }

  return Center(
    child: Container(
        color: Colors.white,
        child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 180,
                    height: 121,
                    child: TextButton(
                        onPressed: () {
                          int serviceType = 0;
                          if (kDebugMode) {
                            print('clientServicesList: $clientServicesList SELECTED');
                            print('${clientServicesList[serviceType].toUpperCase()} SELECTED');
                          }
                          String serviceName = clientServicesList[serviceType];
                          navServicePage(serviceType, serviceName);
                        },
                        style: TextButton.styleFrom( // ElevatedButton styles
                          backgroundColor: Colors.white,
                        ),
                        child: serviceOnePng,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 121,
                    child: TextButton(
                      onPressed: () {
                        int serviceType = 1;
                        if (kDebugMode) {
                          print('${clientServicesList[serviceType].toUpperCase()} SELECTED');
                        }
                        String serviceName = clientServicesList[serviceType];
                        navServicePage(serviceType, serviceName);
                      },
                      style: TextButton.styleFrom( // ElevatedButton styles
                        backgroundColor: Colors.white,
                      ),
                      child: serviceTwoPng,
                    ),
                  )
                ]
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 180,
                    height: 121,
                    child: TextButton(
                      onPressed: () {
                        int serviceType = 2;
                        if (kDebugMode) {
                          print('${clientServicesList[serviceType].toUpperCase()} SELECTED');
                        }
                        String serviceName = clientServicesList[serviceType];
                        navServicePage(serviceType, serviceName);
                      },
                      style: TextButton.styleFrom( // ElevatedButton styles
                        backgroundColor: Colors.white,
                      ),
                      child: serviceThreePng
                    ),
                  ),
                ]
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 180,
                    height: 121,
                    child: TextButton(
                      onPressed: () {
                        int serviceType = 3;
                        if (kDebugMode) {
                          print('${clientServicesList[serviceType].uppercase} SELECTED');
                        }
                        String serviceName = clientServicesList[serviceType];
                        navServicePage(serviceType, serviceName);
                      },
                      style: TextButton.styleFrom( // ElevatedButton styles
                        backgroundColor: Colors.white,
                      ),
                      child: serviceFourPng,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 121,
                    child: TextButton(
                      onPressed: () {
                        int serviceType = 4;
                        if (kDebugMode) {
                          print('${clientServicesList[serviceType].uppercase} SELECTED');
                        }
                        String serviceName = clientServicesList[serviceType];
                        navServicePage(serviceType, serviceName);
                      },
                      style: TextButton.styleFrom( // ElevatedButton styles
                        backgroundColor: Colors.white,
                      ),
                      child: serviceFivePng,
                    ),
                  )
                ]
              ),

            ]
        ),
      )
  );
}
