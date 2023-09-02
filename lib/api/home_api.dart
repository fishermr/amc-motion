import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/home_model.dart';


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
    homeList = HomeModel.fromJson(json.decode(response));
    if (kDebugMode) {
      final prettyString = const JsonEncoder.withIndent('  ').convert(
          homeList);
      print(prettyString);
    }
    List<HomeData>? homeData = homeList.homeData;
    if (kDebugMode) {
      log('homeData length:  ${homeData?.length}');
      log('targetId:  $targetId');
    }
    Home activeHomeData = Home("", "", "", "", "", "", "", "", "", "",
      "", "", "", "", "", "", "", "", "", "", "");
    for(final home in homeData!){
      if (kDebugMode) {
        log('home.clientId:  ${home.clientId}');
      }
      if (home.clientId == targetId) {
        if (kDebugMode) {
          log('clientId {$home.clientId}');
          log('leaderImage {$home.leaderImage}');
          log('leaderImageAlt {$home.leaderImageAlt}');
          log('nameApp {$home.nameApp}');
          log('leaderTitleLineOne {$home.leaderTitleLineOne}');
          log('leaderTitleLineTwo {$home.leaderTitleLineTwo}');
          log('leaderBody {$home.leaderBody}');
          log('pageServices {$home.pageServices}');
          log('positionOneImage {$home.positionOneImage}');
          log('positionOneImageAlt {$home.positionOneImageAlt}');
          log('positionTwoImage {$home.positionTwoImage}');
          log('positionTwoImageAlt {$home.positionTwoImageAlt}');
          log('positionThreeImage {$home.positionThreeImage}');
          log('positionThreeImageAlt {$home.positionThreeImageAlt}');
          log('positionFourImageAlt {$home.positionFourImageAlt}');
          log('positionFourImageAlt {$home.positionFourImageAlt}');
          log('positionFiveImageAlt {$home.positionFiverImageAlt}');
          log('positionFiveImageAlt {$home.positionFiveImageAlt}');
          log('phiButtonUrl {$home.phiButtonUrl}');
          log('phiButtonLabel {$home.phiButtonLabel}');
          log('selfDirectedImage {$home.selfDirectedImage}');
        }
        activeHomeData = Home(
          home.clientId!,
          home.leaderImage!,
          home.leaderImageAlt!,
          home.nameApp!,
          home.leaderTitleLineOne!,
          home.leaderTitleLineTwo!,
          home.leaderBody!,
          home.pageServices!,
          home.positionOneImage!,
          home.positionOneImageAlt!,
          home.positionTwoImage!,
          home.positionTwoImageAlt!,
          home.positionThreeImage!,
          home.positionThreeImageAlt!,
          home.positionFourImage!,
          home.positionFourImageAlt!,
          home.positionFiveImage!,
          home.positionFiveImageAlt!,
          home.phiButtonUrl!,
          home.phiButtonLabel!,
          home.selfDirectedImage!
        );
        break;
      }
    }

    return activeHomeData;
  }

}
