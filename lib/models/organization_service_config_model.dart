class OrganizationServicesConfigModel {
  List<Organizations>? organizations;

  OrganizationServicesConfigModel({this.organizations});

  OrganizationServicesConfigModel.fromJson(Map<String, dynamic> json) {
    if (json['organizations'] != null) {
      organizations = <Organizations>[];
      json['organizations'].forEach((v) {
        organizations!.add(Organizations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (organizations != null) {
      data['organizations'] =
          organizations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organizations {
  List<String>? serviceProvided;
  String? tagLine;
  String? promoUrl;
  String? description;
  List<String>? clientServices;
  List<SpecialNeeds>? specialNeeds;
  String? eventCost;
  String? eventTitle;
  List<UsefulFeatures>? usefulFeatures;
  String? logoAlt;
  String? eventDescription;
  String? eventTime;
  List<EligibilityCriteria>? eligibilityCriteria;
  String? eventPurpose;
  String? id;
  MapCoords? map;
  String? email;
  String? website;
  String? address;
  String? orgName;
  String? eventLocation;
  List<Services>? services;
  String? serviceName;
  String? orgCardType;
  String? logoUrl;
  String? eventDetails;
  String? phoneNumber;
  String? eventBuildNameNumber;
  String? eventSpecialRequirements;
  String? promoAlt;
  String? eventDate;

  Organizations(
      {this.serviceProvided,
        this.tagLine,
        this.promoUrl,
        this.description,
        this.clientServices,
        this.specialNeeds,
        this.eventCost,
        this.eventTitle,
        this.usefulFeatures,
        this.logoAlt,
        this.eventDescription,
        this.eventTime,
        this.eligibilityCriteria,
        this.eventPurpose,
        this.id,
        this.map,
        this.email,
        this.website,
        this.address,
        this.orgName,
        this.eventLocation,
        this.services,
        this.serviceName,
        this.orgCardType,
        this.logoUrl,
        this.eventDetails,
        this.phoneNumber,
        this.eventBuildNameNumber,
        this.eventSpecialRequirements,
        this.promoAlt,
        this.eventDate});

  Organizations.fromJson(Map<String, dynamic> json) {
    serviceProvided = json['serviceProvided'].cast<String>();
    tagLine = json['tagLine'];
    promoUrl = json['promoUrl'];
    description = json['description'];
    clientServices = json['clientServices'].cast<String>();
    if (json['specialNeeds'] != null) {
      specialNeeds = <SpecialNeeds>[];
      json['specialNeeds'].forEach((v) {
        specialNeeds!.add(SpecialNeeds.fromJson(v));
      });
    }
    eventCost = json['eventCost'];
    eventTitle = json['eventTitle'];
    if (json['usefulFeatures'] != null) {
      usefulFeatures = <UsefulFeatures>[];
      json['usefulFeatures'].forEach((v) {
        usefulFeatures!.add(UsefulFeatures.fromJson(v));
      });
    }
    logoAlt = json['logoAlt'];
    eventDescription = json['eventDescription'];
    eventTime = json['eventTime'];
    if (json['eligibilityCriteria'] != null) {
      eligibilityCriteria = <EligibilityCriteria>[];
      json['eligibilityCriteria'].forEach((v) {
        eligibilityCriteria!.add(EligibilityCriteria.fromJson(v));
      });
    }
    eventPurpose = json['eventPurpose'];
    id = json['id'];
    map = json['mapCoords'] != null
        ? MapCoords.fromJson(json['map'])
        : null;
    email = json['email'];
    website = json['website'];
    address = json['address'];
    orgName = json['orgName'];
    eventLocation = json['eventLocation'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    serviceName = json['serviceName'];
    orgCardType = json['orgCardType'];
    logoUrl = json['logoUrl'];
    eventDetails = json['eventDetails'];
    phoneNumber = json['phoneNumber'];
    eventBuildNameNumber = json['eventBuildNameNumber'];
    eventSpecialRequirements = json['eventSpecialRequirements'];
    promoAlt = json['promoAlt'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceProvided'] = serviceProvided;
    data['tagLine'] = tagLine;
    data['promoUrl'] = promoUrl;
    data['description'] = description;
    data['clientServices'] = clientServices;
    if (specialNeeds != null) {
      data['specialNeeds'] = specialNeeds!.map((v) => v.toJson()).toList();
    }
    data['eventCost'] = eventCost;
    data['eventTitle'] = eventTitle;
    if (usefulFeatures != null) {
      data['usefulFeatures'] =
          usefulFeatures!.map((v) => v.toJson()).toList();
    }
    data['logoAlt'] = logoAlt;
    data['eventDescription'] = eventDescription;
    data['eventTime'] = eventTime;
    if (eligibilityCriteria != null) {
      data['eligibilityCriteria'] =
          eligibilityCriteria!.map((v) => v.toJson()).toList();
    }
    data['eventPurpose'] = eventPurpose;
    data['id'] = id;
    if (map != null) {
      data['map'] = map!.toJson();
    }
    data['email'] = email;
    data['website'] = website;
    data['address'] = address;
    data['orgName'] = orgName;
    data['eventLocation'] = eventLocation;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    data['serviceName'] = serviceName;
    data['orgCardType'] = orgCardType;
    data['logoUrl'] = logoUrl;
    data['eventDetails'] = eventDetails;
    data['phoneNumber'] = phoneNumber;
    data['eventBuildNameNumber'] = eventBuildNameNumber;
    data['eventSpecialRequirements'] = eventSpecialRequirements;
    data['promoAlt'] = promoAlt;
    data['eventDate'] = eventDate;
    return data;
  }
}

class SpecialNeeds {
  String? subItem;
  String? item;

  SpecialNeeds({subItem, item});

  SpecialNeeds.fromJson(Map<String, dynamic> json) {
    subItem = json['subItem'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subItem'] = subItem;
    data['item'] = item;
    return data;
  }
}

class Services {
  String? item;
  String? subItem;

  Services({item, subItem});

  Services.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    subItem = json['subItem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['subItem'] = subItem;
    return data;
  }
}

class UsefulFeatures {
  String? item;
  String? subItem;

  UsefulFeatures({item, subItem});

  UsefulFeatures.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    subItem = json['subItem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['subItem'] = subItem;
    return data;
  }
}

class EligibilityCriteria {
  String? item;
  String? subItem;

  EligibilityCriteria({item, subItem});

  EligibilityCriteria.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    subItem = json['subItem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['subItem'] = subItem;
    return data;
  }
}

class MapCoords {
  String? lng;
  String? lat;
  String? location;

  MapCoords({lng, lat, location});

  MapCoords.fromJson(Map<String, dynamic> json) {
    lng = json['lng'];
    lat = json['lat'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lng'] = lng;
    data['lat'] = lat;
    data['location'] = location;
    return data;
  }
}