import 'dart:convert';
import 'dart:developer';

import 'package:amcmotion/secrets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/client_configuration_model.dart';


class Client {
  String clientId;
  String clientName;
  String shortName;
  bool active;

  Client(this.clientId, this.clientName, this.shortName, this.active);
}

class ClientServiceApi {

  Future<Client> clientData() async {
    ClientConfigurationModel? clientList;
    // Fetch content from the json file
    final String response = await rootBundle.loadString('assets/data/active_client.json');
    clientList = ClientConfigurationModel.fromJson(json.decode(response));
    if (kDebugMode) {
      final prettyString = const JsonEncoder.withIndent('  ').convert(
          clientList);
      print(prettyString);
    }
    List<Clients>? clients = clientList.clients;
    bool active;
    log('clients length:  ${clients!.length}');
    Client activeClient = Client("", "", "", false);
    for(final client in clients){
      if (client.active!) {
        if (kDebugMode) {
          log('clientId {$client.clientId}');
          log('clientName {$client.clientName}');
          log('shortName {$client.shortName}');
          log('active {$client.active}');
        }
        activeClient = Client(
            client.clientId!,
            client.clientName!, 
            client.shortName!,
            client.active!);
        break;
      }
    }

    return activeClient;
  }

}
