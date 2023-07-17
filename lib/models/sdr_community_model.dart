import 'dart:convert';

SdrCommunityModel sdrCommunityModelFromJson(String str) => SdrCommunityModel.fromJson(json.decode(str));

String sdrCommunityModelToJson(SdrCommunityModel data) => json.encode(data.toJson());

class SdrCommunityModel {
  SdrCommunityModel({
    required this.orgList,
    required this.reasonList,
    required this.contactTimes,
    required this.poiRelations,
    required this.usStates
  });

  List<OrgList> orgList;
  List<ReasonList> reasonList;
  List<ContactTimes> contactTimes;
  List<PoiRelations> poiRelations;
  List<UsStates> usStates;

  factory SdrCommunityModel.fromJson(Map<String, dynamic> json) => SdrCommunityModel(
    orgList: List<OrgList>.from(json["orgList"].map((x) => OrgList.fromJson(x))),
    reasonList: List<ReasonList>.from(json["reasonList"].map((x) => ReasonList.fromJson(x))),
    contactTimes: List<ContactTimes>.from(json["contactTimes"].map((x) => ContactTimes.fromJson(x))),
    poiRelations: List<PoiRelations>.from(json["poiRelations"].map((x) => PoiRelations.fromJson(x))),
    usStates: List<UsStates>.from(json["usStates"].map((x) => UsStates.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orgList": List<dynamic>.from(orgList.map((x) => x.toJson())),
    "reasonList": List<dynamic>.from(reasonList.map((x) => x.toJson())),
    "contactTimes": List<dynamic>.from(contactTimes.map((x) => x.toJson())),
    "poiRelations": List<dynamic>.from(poiRelations.map((x) => x.toJson())),
    "usStates": List<dynamic>.from(usStates.map((x) => x.toJson())),
  };
}

class OrgList {
  OrgList({
    required this.orgId,
    required this.orgName,
    required this.receiveReferrals,
  });

  String orgId;
  String orgName;
  String receiveReferrals;

  factory OrgList.fromJson(Map<String, dynamic> json) => OrgList(
    orgId: json["orgId"],
    orgName: json["orgName"],
    receiveReferrals: json["receiveReferrals"],
  );

  Map<String, dynamic> toJson() => {
    "orgId": orgId,
    "orgName": orgName,
    "receiveReferrals": receiveReferrals,
  };
}

class ReasonList {
  ReasonList({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory ReasonList.fromJson(Map<String, dynamic> json) => ReasonList(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class ContactTimes {
  ContactTimes({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory ContactTimes.fromJson(Map<String, dynamic> json) => ContactTimes(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class PoiRelations {
  PoiRelations({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory PoiRelations.fromJson(Map<String, dynamic> json) => PoiRelations(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class UsStates {
  UsStates({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory UsStates.fromJson(Map<String, dynamic> json) => UsStates(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}