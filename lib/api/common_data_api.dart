import 'dart:convert';
import 'dart:developer';

import 'package:amcmotion/secrets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/client_configuration_model.dart';

class CommonModel {
  CommonModel({
    required this.learnMoreLabel,
    required this.learnMoreUrl,
    required this.saveLabel,
  });

  String learnMoreLabel;
  String learnMoreUrl;
  String saveLabel;

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
    learnMoreLabel: json['learnMoreLabel'],
    learnMoreUrl: json['learnMoreUrl'],
    saveLabel: json['saveLabel'],
  );

  Map<String, dynamic> toJson() => {
    "learnMoreLabel": learnMoreLabel,
    "learnMoreUrl": learnMoreUrl,
    "saveLabel": saveLabel,
  };

}

class CommonConfigApi {

  Future<CommonModel> commonConfig() async {
    CommonModel? common;
    // Fetch content from the json file
    final String response = await rootBundle.loadString('assets/data/common_page.json');
    common = CommonModel.fromJson(json.decode(response));
    return common;
  }

}
