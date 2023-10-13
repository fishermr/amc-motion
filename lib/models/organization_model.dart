class OrganizationModel {
  List<Organizations>? organizations;

  OrganizationModel({this.organizations});

  OrganizationModel.fromJson(Map<String, dynamic> json) {
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
      data['organizations'] = organizations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organizations {
  List<String>? serviceProvided;
  String? promoUrl;
  String? description;
  List<String>? clientServices;
  List<SpecialNeeds>? specialNeeds;
  MapCoords? mapCoords;
  String? eventCost;
  String? eventTitle;
  List<UsefulFeatures>? usefulFeatures;
  String? logoAlt;
  String? eventDescription;
  String? eventTime;
  List<EligibilityCriteria>? eligibilityCriteria;
  String? eventPurpose;
  String? id;
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
  String? tagLine;
  String? eventSpecialRequirements;
  String? promoAlt;
  String? eventDate;

  Organizations(
      {this.serviceProvided,
        this.promoUrl,
        this.description,
        this.clientServices,
        this.specialNeeds,
        this.mapCoords,
        this.eventCost,
        this.eventTitle,
        this.usefulFeatures,
        this.logoAlt,
        this.eventDescription,
        this.eventTime,
        this.eligibilityCriteria,
        this.eventPurpose,
        this.id,
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
        this.tagLine,
        this.eventSpecialRequirements,
        this.promoAlt,
        this.eventDate});

  Organizations.fromJson(Map<String, dynamic> json) {
    serviceProvided = json['serviceProvided'].cast<String>();
    promoUrl = json['promoUrl'];
    description = json['description'];
    clientServices = json['clientServices'].cast<String>();
    if (json['specialNeeds'] != null) {
      specialNeeds = <SpecialNeeds>[];
      json['specialNeeds'].forEach((v) {
        specialNeeds!.add(SpecialNeeds.fromJson(v));
      });
    }
    mapCoords = json['mapCoords'] != null
        ? MapCoords.fromJson(json['mapCoords'])
        : null;
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
    tagLine = json['tagLine'];
    eventSpecialRequirements = json['eventSpecialRequirements'];
    promoAlt = json['promoAlt'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceProvided'] = serviceProvided;
    data['promoUrl'] = promoUrl;
    data['description'] = description;
    data['clientServices'] = clientServices;
    if (specialNeeds != null) {
      data['specialNeeds'] = specialNeeds!.map((v) => v.toJson()).toList();
    }
    if (mapCoords != null) {
      data['mapCoords'] = mapCoords!.toJson();
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
    data['tagLine'] = tagLine;
    data['eventSpecialRequirements'] = eventSpecialRequirements;
    data['promoAlt'] = promoAlt;
    data['eventDate'] = eventDate;
    return data;
  }
}

class SpecialNeeds {
  String? subItem;
  String? item;

  SpecialNeeds({this.subItem, this.item});

  SpecialNeeds.fromJson(Map<String, dynamic> json) {
    subItem = json['subItem'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subItem'] = subItem;
    data['item'] = item;
    return data;
  }
}

class UsefulFeatures {
  String? subItem;
  String? item;

  UsefulFeatures({this.subItem, this.item});

  UsefulFeatures.fromJson(Map<String, dynamic> json) {
    subItem = json['subItem'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subItem'] = subItem;
    data['item'] = item;
    return data;
  }
}

class EligibilityCriteria {
  String? subItem;
  String? item;

  EligibilityCriteria({this.subItem, this.item});

  EligibilityCriteria.fromJson(Map<String, dynamic> json) {
    subItem = json['subItem'];
    item = json['item'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subItem'] = subItem;
    data['item'] = item;
    return data;
  }
}

class Services {
  String? subItem;
  String? item;

  Services({this.subItem, this.item});

  Services.fromJson(Map<String, dynamic> json) {
    subItem = json['subItem'];
    item = json['item'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subItem'] = subItem;
    data['item'] = item;
    return data;
  }
}

class MapCoords {
  String? lng;
  String? lat;
  String? location;

  MapCoords({this.lng, this.lat, this.location});

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
