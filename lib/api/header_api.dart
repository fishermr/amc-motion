import 'dart:convert';
import 'dart:developer';

import 'package:amcmotion/secrets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/header_model.dart';


class Header {
  String clientId;
  String logoImage;
  String logoImageAlt;
  String organizationSignupName;
  String reflectionsSignupName;
  String organizationSignupLink;
  String reflectionsSignupLink;
  String aboutCompany;
  String callTracking;

  Header(
      this.clientId,
      this.logoImage,
      this.logoImageAlt,
      this.organizationSignupName,
      this.reflectionsSignupName,
      this.organizationSignupLink,
      this.reflectionsSignupLink,
      this.aboutCompany,
      this.callTracking);
}

class HeaderApi {

  Future<Header> headerData(String targetId) async {
    HeaderModel? headerList;
    // Fetch content from the json file
    final String response = await rootBundle.loadString('assets/data/header_page.json');
    log('response {$response}');
    headerList = HeaderModel.fromJson(json.decode(response));
    if (kDebugMode) {
      final prettyString = const JsonEncoder.withIndent('  ').convert(
          headerList);
      print(prettyString);
    }
    List<Headers>? headers = headerList.headers;
    if (kDebugMode) {
      log('headers length:  ${headers!.length}');
      log('targetId:  $targetId');
    }
    Header activeHeader = Header("", "", "", "", "", "", "", "", "");
    for(final header in headers!){
      if (kDebugMode) {
        log('header.clientId:  ${header.clientId}');
      }
      if (header.clientId == targetId) {
        if (kDebugMode) {
          log('clientId {$header.clientId}');
          log('logoImage {$header.logoImage}');
          log('logoImageAlt {$header.logoImageAlt}');
          log('organizationSignupName {$header.organizationSignupName}');
          log('reflectionsSignupName {$header.reflectionsSignupName}');
          log('organizationSignupLink {$header.organizationSignupLink}');
          log('reflectionsSignupLink {$header.reflectionsSignupLink}');
          log('aboutCompany {$header.aboutCompany}');
          log('callTracking {$header.callTracking}');
        }
        activeHeader = Header(
          header.clientId!,
          header.logoImage!,
          header.logoImageAlt!,
          header.organizationSignupName!,
          header.reflectionsSignupName!,
          header.organizationSignupLink!,
          header.reflectionsSignupLink!,
          header.aboutCompany!,
          header.callTracking!,
        );
        break;
      }
    }

    return activeHeader;
  }

}
