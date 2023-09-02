import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/service_card_model.dart';

class ServiceCardConfigApi {

  Future<ServiceCardConfigModel> serviceCardConfig() async {
    ServiceCardConfigModel? serviceCardConfig;
    // Fetch content from the json file
    final String response = await rootBundle.loadString('assets/data/service_card_page.json');
    serviceCardConfig = ServiceCardConfigModel.fromJson(json.decode(response));
    return serviceCardConfig;
  }

}