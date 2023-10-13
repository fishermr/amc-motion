
import 'package:flutter/foundation.dart';
import '../helper/app_exception.dart';
import '../models/organization_model.dart';
import 'package:http/http.dart' as http;

class OrganizationApi {

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }

  orgServiceData(clientId) async {
    OrganizationModel? dataFromAPI = OrganizationModel();
    var amcHeader = {
      'amc-platform': 'hfsdemo',
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };
    var res;
    String url = 'https://gavj0b94ni.execute-api.us-east-1.amazonaws.com/'
        + 'v1/amc/sb/client/orgservices/' + clientId + '/';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: amcHeader,
      ).timeout(
        const Duration(seconds: 60)
      );
      if (kDebugMode) {
        print('--------');
        print(response.statusCode);
        print('--------');
      }
      if (response.statusCode != 200) {
        res = {
          "success": false,
          "status": response.statusCode,
          "message": _returnResponse(response)
        };
      }
      else {
        res = response;
      }
    } catch (e) {
      if (kDebugMode) {
        print('***** OrganizationApi API ERROR *****');
        debugPrint(e.toString());
      }
    }
    return res;
  }
}