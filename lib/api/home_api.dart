import 'dart:convert';
import 'dart:developer';

import 'package:amcmotion/secrets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/header_model.dart';


class Home {
  String? clientId;
  String? leaderImage;
  String? leaderImageAlt;
  String? nameApp;
  String? leaderTitleLineOne;
  String? leaderTitleLineTwo;
  String? leaderBody;
  String? pageServices;
  String? positionOneImage;
  String? positionOneImageAlt;
  String? positionOneLink;
  String? positionTwoImage;
  String? positionTwoImageAlt;
  String? positionTwoLink;
  String? positionThreeImage;
  String? positionThreeImageAlt;
  String? positionThreeLink;
  String? positionFourImage;
  String? positionFourImageAlt;
  String? positionFourLink;
  String? positionFiveImage;
  String? positionFiveImageAlt;
  String? positionFiveLink;
  String? phiButtonUrl;
  String? phiButtonLabel;
  String? selfDirectedImage;

  Home(
      this.clientId,
      this.leaderImage,
      this.leaderImageAlt,
      this.nameApp,
      this.leaderTitleLineOne,
      this.leaderTitleLineTwo,
      this.leaderBody,
      this.pageServices,
      this.positionOneImage,
      this.positionOneImageAlt,
      this.positionTwoImage,
      this.positionTwoImageAlt,
      this.positionThreeImage,
      this.positionThreeImageAlt,
      this.positionFourImage,
      this.positionFourImageAlt,
      this.positionFiveImage,
      this.positionFiveImageAlt,
      this.phiButtonUrl,
      this.phiButtonLabel,
      this.selfDirectedImage,
    );
}

class HomeApi {

  Future<Home> homeData(String targetId) async {
    HomeModel? homeList;
    // Fetch content from the json file
    final String response = await rootBundle.loadString('assets/data/home_page.json');
    log('response {$response}');
    homeList = HeaderModel.fromJson(json.decode(response));
    if (kDebugMode) {
      final prettyString = const JsonEncoder.withIndent('  ').convert(
          homeList);
      print(prettyString);
    }
    List<Home>? homeData = homeList.headers;
    if (kDebugMode) {
      log('homeData length:  ${homeData!.length}');
      log('targetId:  $targetId');
    }
    Home activeHeader = Home("", "", "", "", "", "", "", "", "");
    for(final home in homeData!){
      if (kDebugMode) {
        log('header.clientId:  ${home.clientId}');
      }
      if (home.clientId == targetId) {
        if (kDebugMode) {
          log('clientId {$home.clientId}');
          log('logoImage {$home.logoImage}');
          log('logoImageAlt {$home.logoImageAlt}');
          log('organizationSignupName {$home.organizationSignupName}');
          log('reflectionsSignupName {$home.reflectionsSignupName}');
          log('organizationSignupLink {$home.organizationSignupLink}');
          log('reflectionsSignupLink {$home.reflectionsSignupLink}');
          log('aboutCompany {$home.aboutCompany}');
          log('callTracking {$home.callTracking}');
        }
        activeHeader = Home(
          home.clientId!,
          home.logoImage!,
          home.logoImageAlt!,
          home.organizationSignupName!,
          home.reflectionsSignupName!,
          home.organizationSignupLink!,
          home.reflectionsSignupLink!,
          home.aboutCompany!,
          home.callTracking!,
        );
        break;
      }
    }

    return activeHeader;
  }

}
