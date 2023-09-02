import 'dart:convert';
import 'dart:developer';

import 'package:amcmotion/secrets.dart';
import 'package:flutter/foundation.dart';
import '../models/organization_service_config_model.dart';
import 'package:http/http.dart' as http;

class OrganizationServiceConfigApi {

  Future<OrganizationServicesConfigModel?> orgServiceData(clientId) async {
    OrganizationServicesConfigModel? dataFromAPI;
    try {
      var amcHeader = {
        'amc-platform': 'amc741',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      String url = 'https://gavj0b94ni.execute-api.us-east-1.amazonaws.com/'
          + 'v1/amc/sb/client/orgservices/' + clientId + '/';
      http.Response res = await http.get(
        Uri.parse(url),
        headers: amcHeader,
      );
      if (res.statusCode == 200) {
        if (kDebugMode) {
          debugPrint('status returned 200');
        }
        if (kDebugMode) {
          debugPrintThrottled('API response: ${res.body}');
        }
        dataFromAPI = OrganizationServicesConfigModel.fromJson(json.decode(res.body));
        if (kDebugMode) {
          log('dataFromAPI: {$dataFromAPI}');
        }
        if (kDebugMode) {
          debugPrint('After setting dataFromAPI.....');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('***** API ERROR *****');
        debugPrint(e.toString());
      }
    }
    return dataFromAPI;
  }
}