class OrganizationServicesConfigModel {
  OrganizationElement? organizationElement;

  OrganizationServicesConfigModel({this.organizationElement});

  OrganizationServicesConfigModel.fromJson(Map<String, dynamic> json) {
    organizationElement = json['organizationElement'] != null
        ? OrganizationElement.fromJson(json['organizationElement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (organizationElement != null) {
      data['organizationElement'] = organizationElement!.toJson();
    }
    return data;
  }
}

class OrganizationElement {
  String? address;
  List<String>? clientServices;
  String? description;
  List<EligibilityCriteria>? eligibilityCriteria;
  String? email;
  String? eventBuildNameNumber;
  String? eventCost;
  String? eventDate;
  String? eventDescription;
  String? eventDetails;
  String? eventLocation;
  String? eventPurpose;
  String? eventSpecialRequirement;
  String? eventTime;
  String? eventTitle;
  String? id;
  String? logoAlt;
  String? logoUrl;
  MapCoords? mapCoords;
  String? orgCardType;
  String? orgName;
  String? phoneNumber;
  String? promoAlt;
  String? promoUrl;
  String? serviceName;
  List<String>? serviceProvided;
  List<Services>? services;
  List<SpecialNeeds>? specialNeeds;
  String? tagLine;
  List<UsefulFeatures>? usefulFeatures;
  String? website;

  OrganizationElement(
      {this.address,
        this.clientServices,
        this.description,
        this.eligibilityCriteria,
        this.email,
        this.eventBuildNameNumber,
        this.eventCost,
        this.eventDate,
        this.eventDescription,
        this.eventDetails,
        this.eventLocation,
        this.eventPurpose,
        this.eventSpecialRequirement,
        this.eventTime,
        this.eventTitle,
        this.id,
        this.logoAlt,
        this.logoUrl,
        this.mapCoords,
        this.orgCardType,
        this.orgName,
        this.phoneNumber,
        this.promoAlt,
        this.promoUrl,
        this.serviceName,
        this.serviceProvided,
        this.services,
        this.specialNeeds,
        this.tagLine,
        this.usefulFeatures,
        this.website});

  OrganizationElement.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    clientServices = json['clientServices'].cast<String>();
    description = json['description'];
    if (json['eligibilityCriteria'] != null) {
      eligibilityCriteria = <EligibilityCriteria>[];
      json['eligibilityCriteria'].forEach((v) {
        eligibilityCriteria!.add(EligibilityCriteria.fromJson(v));
      });
    }
    email = json['email'];
    eventBuildNameNumber = json['eventBuildNameNumber'];
    eventCost = json['eventCost'];
    eventDate = json['eventDate'];
    eventDescription = json['eventDescription'];
    eventDetails = json['eventDetails'];
    eventLocation = json['eventLocation'];
    eventPurpose = json['eventPurpose'];
    eventSpecialRequirement = json['eventSpecialRequirement'];
    eventTime = json['eventTime'];
    eventTitle = json['eventTitle'];
    id = json['id'];
    logoAlt = json['logoAlt'];
    logoUrl = json['logoUrl'];
    mapCoords = json['mapCoords'] != null
        ? MapCoords.fromJson(json['mapCoords'])
        : null;
    orgCardType = json['orgCardType'];
    orgName = json['orgName'];
    phoneNumber = json['phoneNumber'];
    promoAlt = json['promoAlt'];
    promoUrl = json['promoUrl'];
    serviceName = json['serviceName'];
    serviceProvided = json['serviceProvided'].cast<String>();
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    if (json['specialNeeds'] != null) {
      specialNeeds = <SpecialNeeds>[];
      json['specialNeeds'].forEach((v) {
        specialNeeds!.add(SpecialNeeds.fromJson(v));
      });
    }
    tagLine = json['tagLine'];
    if (json['usefulFeatures'] != null) {
      usefulFeatures = <UsefulFeatures>[];
      json['usefulFeatures'].forEach((v) {
        usefulFeatures!.add(UsefulFeatures.fromJson(v));
      });
    }
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['clientServices'] = clientServices;
    data['description'] = description;
    if (eligibilityCriteria != null) {
      data['eligibilityCriteria'] =
          eligibilityCriteria!.map((v) => v.toJson()).toList();
    }
    data['email'] = email;
    data['eventBuildNameNumber'] = eventBuildNameNumber;
    data['eventCost'] = eventCost;
    data['eventDate'] = eventDate;
    data['eventDescription'] = eventDescription;
    data['eventDetails'] = eventDetails;
    data['eventLocation'] = eventLocation;
    data['eventPurpose'] = eventPurpose;
    data['eventSpecialRequirement'] = eventSpecialRequirement;
    data['eventTime'] = eventTime;
    data['eventTitle'] = eventTitle;
    data['id'] = id;
    data['logoAlt'] = logoAlt;
    data['logoUrl'] = logoUrl;
    if (mapCoords != null) {
      data['mapCoords'] = mapCoords!.toJson();
    }
    data['orgCardType'] = orgCardType;
    data['orgName'] = orgName;
    data['phoneNumber'] = phoneNumber;
    data['promoAlt'] = promoAlt;
    data['promoUrl'] = promoUrl;
    data['serviceName'] = serviceName;
    data['serviceProvided'] = serviceProvided;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (specialNeeds != null) {
      data['specialNeeds'] = specialNeeds!.map((v) => v.toJson()).toList();
    }
    data['tagLine'] = tagLine;
    if (usefulFeatures != null) {
      data['usefulFeatures'] =
          usefulFeatures!.map((v) => v.toJson()).toList();
    }
    data['website'] = website;
    return data;
  }
}

class EligibilityCriteria {
  String? item;
  String? subItem;

  EligibilityCriteria({this.item, this.subItem});

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

class Services {
  String? item;
  String? subItem;

  Services({this.item, this.subItem});

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

class SpecialNeeds {
  String? item;
  String? subItem;

  SpecialNeeds({this.item, this.subItem});

  SpecialNeeds.fromJson(Map<String, dynamic> json) {
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

  UsefulFeatures({this.item, this.subItem});

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

class MapCoords {
  String? lat;
  String? lng;
  String? location;

  MapCoords({this.lat, this.lng, this.location});

  MapCoords.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    data['location'] = location;
    return data;
  }
}
