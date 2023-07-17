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
  String? logoImage;
  String? logoImageAlt;
  String? organizationSignupName;
  String? reflectionsSignupName;
  String? organizationSignupLink;
  String? reflectionsSignupLink;
  String? aboutCompany;
  String? callTracking;

  HomeData {
  ({
    this.clientId,
    this.logoImage,
    this.logoImageAlt,
    this.organizationSignupName,
    this.reflectionsSignupName,
    this.organizationSignupLink,
    this.reflectionsSignupLink,
    this.aboutCompany,
    this.callTracking
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    logoImage = json['logoImage'];
    logoImageAlt = json['logoImageAlt'];
    organizationSignupName = json['organizationSignupName'];
    reflectionsSignupName = json['reflectionsSignupName'];
    organizationSignupLink = json['organizationSignupLink'];
    reflectionsSignupLink = json['reflectionsSignupLink'];
    aboutCompany = json['aboutCompany'];
    callTracking = json['callTracking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['logoImage'] = logoImage;
    data['logoImageAlt'] = logoImageAlt;
    data['organizationSignupName'] = organizationSignupName;
    data['reflectionsSignupName'] = reflectionsSignupName;
    data['organizationSignupLink'] = organizationSignupLink;
    data['reflectionsSignupLink'] = reflectionsSignupLink;
    data['aboutCompany'] = aboutCompany;
    data['callTracking'] = callTracking;
    return data;
  }
}