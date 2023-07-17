import 'dart:convert';
import 'dart:developer';

import 'package:amcmotion/secrets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/org_configuration_model.dart';
import 'package:http/http.dart' as http;

class GeneralConfigApi {

  Future<OrgConfigurationModel?> configData() async {
    OrgConfigurationModel? dataFromAPI;
    try {
      var amcHeader = {
        'amc-platform': 'amc741',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      String url = 'https://gavj0b94ni.execute-api.us-east-1.amazonaws.com/v1/amc/sb/config/general/';
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
        dataFromAPI = OrgConfigurationModel.fromJson(json.decode(res.body));
        if (kDebugMode) {
          log('dataFromAPI: {$dataFromAPI}');
        }
        if (kDebugMode) {
          for(String service in dataFromAPI!.clientServices){
            log('dataFromAPI clientServices $service');
          }
          log('dataFromAPI clientServices ${dataFromAPI?.clientServices}');
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