import 'dart:convert';

ClientConfigurationModel clientConfigurationModelFromJson(String str) => ClientConfigurationModel.fromJson(json.decode(str));

String clientConfigurationModelToJson(ClientConfigurationModel data) => json.encode(data.toJson());

class ClientConfigurationModel {
  List<Clients>? clients;

  ClientConfigurationModel({this.clients});

  ClientConfigurationModel.fromJson(Map<String, dynamic> json) {
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(Clients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clients != null) {
      data['clients'] = clients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clients {
  String? clientId;
  bool? active;
  String? clientName;
  String? shortName;

  Clients({this.clientId, this.active, this.clientName, this.shortName});

  Clients.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    active = json['active'];
    clientName = json['clientName'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['active'] = active;
    data['clientName'] = clientName;
    data['shortName'] = shortName;
    return data;
  }
}