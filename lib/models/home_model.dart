import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  List<HomeData>? homeData;

  HomeModel({this.homeData});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['home'] != null) {
      homeData = <HomeData>[];
      json['home'].forEach((v) {
        homeData!.add(HomeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homeData != null) {
      data['home'] = homeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeData {
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


  HomeData ({
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
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    leaderImage = json['leaderImage'];
    leaderImageAlt = json['leaderImageAlt'];
    nameApp = json['nameApp'];
    leaderTitleLineOne = json['leaderTitleLineOne'];
    leaderTitleLineTwo = json['leaderTitleLineTwo'];
    leaderBody = json['leaderBody'];
    pageServices = json['pageServices'];
    positionOneImage = json['positionOneImage'];
    positionOneImageAlt = json['positionOneImageAlt'];
    positionTwoImage = json['positionTwoImage'];
    positionTwoImageAlt = json['positionTwoImageAlt'];
    positionThreeImage = json['positionThreeImage'];
    positionThreeImageAlt = json['positionThreeImageAlt'];
    positionFourImage = json['positionFourImage'];
    positionFourImageAlt = json['positionFourImageAlt'];
    positionFiveImage = json['positionFiveImage'];
    positionFiveImageAlt = json['positionFiveImageAlt'];
    phiButtonUrl = json['phiButtonUrl'];
    phiButtonLabel = json['phiButtonLabel'];
    selfDirectedImage = json['selfDirectedImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['leaderImage'] = leaderImage;
    data['leaderImageAlt'] = leaderImageAlt;
    data['nameApp'] = nameApp;
    data['leaderTitleLineOne'] = leaderTitleLineOne;
    data['leaderTitleLineTwo'] = leaderTitleLineTwo;
    data['leaderBody'] = leaderBody;
    data['pageServices'] = pageServices;
    data['positionOneImage'] = positionOneImage;
    data['positionOneImageAlt'] = positionOneImageAlt;
    data['positionTwoImage'] = positionTwoImage;
    data['positionTwoImageAlt'] = positionTwoImageAlt;
    data['positionThreeImage'] = positionThreeImage;
    data['positionThreeImageAlt'] = positionThreeImageAlt;
    data['positionFourImage'] = positionFourImage;
    data['positionFourImageAlt'] = positionFourImageAlt;
    data['positionFiveImage'] = positionFiveImage;
    data['positionFiveImageAlt'] = positionFiveImageAlt;
    data['phiButtonUrl'] = phiButtonUrl;
    data['phiButtonLabel'] = phiButtonLabel;
    data['selfDirectedImage'] = selfDirectedImage;
    return data;
  }
}
