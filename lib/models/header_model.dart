import 'dart:convert';

HeaderModel headerModelFromJson(String str) => HeaderModel.fromJson(json.decode(str));

String headerModelToJson(HeaderModel data) => json.encode(data.toJson());

class HeaderModel {
  List<Headers>? headers;

  HeaderModel({this.headers});

  HeaderModel.fromJson(Map<String, dynamic> json) {
    if (json['headers'] != null) {
      headers = <Headers>[];
      json['headers'].forEach((v) {
        headers!.add(Headers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Headers {
  String? clientId;
  String? logoImage;
  String? logoImageAlt;
  String? organizationSignupName;
  String? reflectionsSignupName;
  String? organizationSignupLink;
  String? reflectionsSignupLink;
  String? aboutCompany;
  String? callTracking;

  Headers({
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

  Headers.fromJson(Map<String, dynamic> json) {
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