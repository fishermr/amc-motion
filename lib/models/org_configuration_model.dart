import 'dart:convert';

/*List<OrgConfigurationModel> orgConfigurationModelFromJson(String str) =>
    List<OrgConfigurationModel>.from(json.decode(str).map((x) => OrgConfigurationModel.fromJson(x)));

String orgConfigurationModelToJson(List<OrgConfigurationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));*/

OrgConfigurationModel orgConfigurationModelFromJson(String str) => OrgConfigurationModel.fromJson(json.decode(str));

String orgConfigurationModelToJson(OrgConfigurationModel data) => json.encode(data.toJson());

class OrgConfigurationModel {
  OrgConfigurationModel({
    required this.orgCardProperties,
    required this.orgServicesList,
    required this.usStatesList,
    // required this.staffDirectoryList,
    required this.clientServices,
    required this.orgCardType,
    required this.formstackLinksList,
    required this.orgServiceAttributesList,
  });

  OrgCardProperties orgCardProperties;
  List<OrgServicesList> orgServicesList;
  List<UsStatesList> usStatesList;
  // List<StaffDirectoryList> staffDirectoryList;
  List<String> clientServices;
  List<String> orgCardType;
  List<FormstackLinksList> formstackLinksList;
  List<OrgServiceAttributesList> orgServiceAttributesList;


  factory OrgConfigurationModel.fromJson(Map<String, dynamic> json) => OrgConfigurationModel(
    // orgCardPropertiesList: List<OrgCardPropertiesList>.from(json["orgCardProperties"].map((x) => OrgCardPropertiesList.fromJson(x))),
    orgCardProperties: OrgCardProperties.fromJson(json["orgCardProperties"]),
    orgServicesList: List<OrgServicesList>.from(json["orgServices"].map((x) => OrgServicesList.fromJson(x))),
    usStatesList: List<UsStatesList>.from(json["usStates"].map((x) => UsStatesList.fromJson(x))),
    // staffDirectoryList: List<StaffDirectoryList>.from(json["staffDirectory"].map((x) => StaffDirectoryList.fromJson(x))),
    formstackLinksList: List<FormstackLinksList>.from(json["formstackLinks"].map((x) => FormstackLinksList.fromJson(x))),
    orgServiceAttributesList: List<OrgServiceAttributesList>.from(json["orgServiceAttributes"].map((x) => OrgServiceAttributesList.fromJson(x))),
    clientServices: List<String>.from(json['clientServices']),
    orgCardType: List<String>.from(json['orgCardType']),
  );

  Map<String, dynamic> toJson() => {
    // "orgCardPropertiesList": List<dynamic>.from(orgCardPropertiesList!.map((x) => x.toJson())),
    "orgCardProperties": orgCardProperties.toString(),
    "orgServicesList": List<dynamic>.from(orgServicesList.map((x) => x.toJson())),
    "usStatesList": List<dynamic>.from(usStatesList.map((x) => x.toJson())),
    // "staffDirectoryList": List<dynamic>.from(staffDirectoryList.map((x) => x.toJson())),
    "formstackLinksList": List<dynamic>.from(formstackLinksList.map((x) => x.toJson())),
    "orgServiceAttributesList": List<dynamic>.from(orgServiceAttributesList.map((x) => x.toJson())),
    "clientServices": clientServices,
    "orgCardType": orgCardType,
  };

  /*@override
  List<Object?> get orgConfigurationModel =>
      [orgCardPropertiesList, orgServicesList, usStatesList, staffDirectoryList,
        formstackLinksList, orgServiceAttributesList, clientServices,
        orgCardType];*/
}

class OrgCardProperties {
  OrgCardProperties({
    required this.all,
    required this.healthServices,
    required this.referOrganizationButtonText,
    required this.purposeStatement,
    required this.financialServices,
    required this.serviceCardMenuTitle,
    required this.educationServices,
    required this.signupButtonText,
    required this.serviceStatement,
    required this.eventCardMenuTitle,
    required this.urgentNeeds,
    required this.organizationCardMenuTitle,
    required this.popularServices,
    required this.comingSoonTitle,
    required this.socialServices,
  });

  String all;
  String healthServices;
  String referOrganizationButtonText;
  String purposeStatement;
  String financialServices;
  String serviceCardMenuTitle;
  String educationServices;
  String signupButtonText;
  String serviceStatement;
  String eventCardMenuTitle;
  String urgentNeeds;
  String organizationCardMenuTitle;
  String popularServices;
  String comingSoonTitle;
  String socialServices;

  Map<String, dynamic> toJson() => {
    'all': all,
    'healthServices': healthServices,
    'referOrganizationButtonText': referOrganizationButtonText,
    'purposeStatement': purposeStatement,
    'financialServices': financialServices,
    'serviceCardMenuTitle': serviceCardMenuTitle,
    'educationServices': educationServices,
    'signupButtonText': signupButtonText,
    'serviceStatement': serviceStatement,
    'eventCardMenuTitle': eventCardMenuTitle,
    'urgentNeeds': urgentNeeds,
    'organizationCardMenuTitle': organizationCardMenuTitle,
    'popularServices': popularServices,
    'comingSoonTitle': comingSoonTitle,
    'socialServices': socialServices,
  };

  factory OrgCardProperties.fromJson(Map<String, dynamic> json) => OrgCardProperties (
    all: json["all"],
    healthServices: json["healthServices"],
    referOrganizationButtonText: json["referOrganizationButtonText"],
    purposeStatement: json["purposeStatement"],
    financialServices: json["financialServices"],
    serviceCardMenuTitle: json["serviceCardMenuTitle"],
    educationServices: json["educationServices"],
    signupButtonText: json["signupButtonText"],
    serviceStatement: json["serviceStatement"],
    eventCardMenuTitle: json["eventCardMenuTitle"],
    urgentNeeds: json["urgentNeeds"],
    organizationCardMenuTitle: json["organizationCardMenuTitle"],
    popularServices: json["popularServices"],
    comingSoonTitle: json["comingSoonTitle"],
    socialServices: json["socialServices"],
  );
}

class OrgServicesList {
  OrgServicesList({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory OrgServicesList.fromJson(Map<String, dynamic> json) => OrgServicesList(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class UsStatesList {
  UsStatesList({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory UsStatesList.fromJson(Map<String, dynamic> json) => UsStatesList(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

class StaffDirectoryList {
  StaffDirectoryList({
    required this.referralAdmin,
    required this.lName,
    required this.phoneExt,
    required this.role,
    required this.credentials,
    required this.receiveReferral,
    required this.title,
    required this.passwordAge,
    required this.emailAddress,
    required this.fName,
    required this.officePhone,
    required this.phone,
    required this.issueReferral,
    required this.lastActivity,
    required this.id,
    required this.state,
    required this.group,
  });

  bool referralAdmin;
  String lName;
  String phoneExt;
  String role;
  String credentials;
  bool receiveReferral;
  String title;
  String passwordAge;
  String emailAddress;
  String fName;
  String officePhone;
  String phone;
  bool issueReferral;
  String lastActivity;
  String id;
  String state;
  String group;

  factory StaffDirectoryList.fromJson(Map<String, dynamic> json) => StaffDirectoryList(
    referralAdmin: json["referralAdmin"],
    lName: json["lName"],
    phoneExt: json["phoneExt"],
    role: json["role"],
    credentials: json["credentials"],
    receiveReferral: json["receiveReferral"],
    title: json["title"],
    passwordAge: json["passwordAge"],
    emailAddress: json["emailAddress"],
    fName: json["fName"],
    officePhone: json["officePhone"],
    phone: json["phone"],
    issueReferral: json["issueReferral"],
    lastActivity: json["lastActivity"],
    id: json["id"],
    state: json["state"],
    group: json["group"],
  );

  Map<String, dynamic> toJson() => {
    "referralAdmin": referralAdmin,
    "lName": lName,
    "phoneExt": phoneExt,
    "role": role,
    "credentials": credentials,
    "receiveReferral": receiveReferral,
    "title": title,
    "passwordAge": passwordAge,
    "emailAddress": emailAddress,
    "fName": fName,
    "officePhone": officePhone,
    "phone": phone,
    "issueReferral": issueReferral,
    "lastActivity": lastActivity,
    "id": id,
    "state": state,
    "group": group,
  };
}

class FormstackLinksList {
  FormstackLinksList({
    required this.referOrgButtonLink,
    required this.signupButtonLink,
    required this.id,
  });

  String? referOrgButtonLink;
  String? signupButtonLink;
  String? id;

  factory FormstackLinksList.fromJson(Map<String, dynamic> json) => FormstackLinksList(
    referOrgButtonLink: json["referOrgButtonLink"],
    signupButtonLink: json["signupButtonLink"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "referOrgButtonLink": referOrgButtonLink,
    "signupButtonLink": signupButtonLink,
    "id": id,
  };
}

class OrgServiceAttributesList {
  OrgServiceAttributesList({
    required this.serviceWhiteLogo,
    required this.serviceBlueLogo,
    required this.serviceWhiteLogoAlt,
    required this.serviceTitle,
    required this.serviceBlueLogoAlt,
  });

  String serviceWhiteLogo;
  String serviceBlueLogo;
  String serviceWhiteLogoAlt;
  String serviceTitle;
  String serviceBlueLogoAlt;

  factory OrgServiceAttributesList.fromJson(Map<String, dynamic> json) => OrgServiceAttributesList(
    serviceWhiteLogo: json["serviceWhiteLogo"],
    serviceBlueLogo: json["serviceBlueLogo"],
    serviceWhiteLogoAlt: json["serviceWhiteLogoAlt"],
    serviceTitle: json["serviceTitle"],
    serviceBlueLogoAlt: json["serviceBlueLogoAlt"],
  );

  Map<String, dynamic> toJson() => {
    "serviceWhiteLogo": serviceWhiteLogo,
    "serviceBlueLogo": serviceBlueLogo,
    "serviceWhiteLogoAlt": serviceWhiteLogoAlt,
    "serviceTitle": serviceTitle,
    "serviceBlueLogoAlt": serviceBlueLogoAlt,
  };
}
