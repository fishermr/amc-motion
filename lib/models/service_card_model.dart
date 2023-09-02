import 'dart:convert';

class ServiceCardConfigModel {
  List<Clients>? clients;
  List<ServiceType>? serviceType;
  Properties? properties;

  ServiceCardConfigModel({this.clients, this.serviceType, this.properties});

  ServiceCardConfigModel.fromJson(Map<String, dynamic> json) {
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(Clients.fromJson(v));
      });
    }
    if (json['serviceType'] != null) {
      serviceType = <ServiceType>[];
      json['serviceType'].forEach((v) {
        serviceType!.add(ServiceType.fromJson(v));
      });
    }
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clients != null) {
      data['clients'] = clients!.map((v) => v.toJson()).toList();
    }
    if (serviceType != null) {
      data['serviceType'] = serviceType!.map((v) => v.toJson()).toList();
    }
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    return data;
  }
}

class Clients {
  String? clientName;
  String? clientId;
  List<int>? services;

  Clients({this.clientName, this.clientId, this.services});

  Clients.fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'];
    clientId = json['clientId'];
    services = json['services'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientName'] = clientName;
    data['clientId'] = clientId;
    data['services'] = services;
    return data;
  }
}

class ServiceType {
  String? serviceTitle;
  String? serviceWhiteLogo;
  String? serviceWhiteLogoAlt;
  String? serviceBlueLogo;
  String? serviceBlueLogoAlt;

  ServiceType(
      {this.serviceTitle,
        this.serviceWhiteLogo,
        this.serviceWhiteLogoAlt,
        this.serviceBlueLogo,
        this.serviceBlueLogoAlt});

  ServiceType.fromJson(Map<String, dynamic> json) {
    serviceTitle = json['serviceTitle'];
    serviceWhiteLogo = json['serviceWhiteLogo'];
    serviceWhiteLogoAlt = json['serviceWhiteLogoAlt'];
    serviceBlueLogo = json['serviceBlueLogo'];
    serviceBlueLogoAlt = json['serviceBlueLogoAlt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceTitle'] = serviceTitle;
    data['serviceWhiteLogo'] = serviceWhiteLogo;
    data['serviceWhiteLogoAlt'] = serviceWhiteLogoAlt;
    data['serviceBlueLogo'] = serviceBlueLogo;
    data['serviceBlueLogoAlt'] = serviceBlueLogoAlt;
    return data;
  }
}

class Properties {
  String? comingSoonTitle;
  String? purposeStatement;
  String? serviceStatement;
  String? signupButtonText;
  String? referOrganizationButtonText;
  String? signupButtonLink;
  String? referOrgButtonLink;
  String? all;
  String? urgentNeeds;
  String? healthServices;
  String? socialServices;
  String? educationServices;
  String? financialServices;
  String? popularServices;

  Properties(
      {this.comingSoonTitle,
        this.purposeStatement,
        this.serviceStatement,
        this.signupButtonText,
        this.referOrganizationButtonText,
        this.signupButtonLink,
        this.referOrgButtonLink,
        this.all,
        this.urgentNeeds,
        this.healthServices,
        this.socialServices,
        this.educationServices,
        this.financialServices,
        this.popularServices});

  Properties.fromJson(Map<String, dynamic> json) {
    comingSoonTitle = json['comingSoonTitle'];
    purposeStatement = json['purposeStatement'];
    serviceStatement = json['serviceStatement'];
    signupButtonText = json['signupButtonText'];
    referOrganizationButtonText = json['referOrganizationButtonText'];
    signupButtonLink = json['signupButtonLink'];
    referOrgButtonLink = json['referOrgButtonLink'];
    all = json['all'];
    urgentNeeds = json['urgentNeeds'];
    healthServices = json['healthServices'];
    socialServices = json['socialServices'];
    educationServices = json['educationServices'];
    financialServices = json['financialServices'];
    popularServices = json['popularServices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comingSoonTitle'] = comingSoonTitle;
    data['purposeStatement'] = purposeStatement;
    data['serviceStatement'] = serviceStatement;
    data['signupButtonText'] = signupButtonText;
    data['referOrganizationButtonText'] = referOrganizationButtonText;
    data['signupButtonLink'] = signupButtonLink;
    data['referOrgButtonLink'] = referOrgButtonLink;
    data['all'] = all;
    data['urgentNeeds'] = urgentNeeds;
    data['healthServices'] = healthServices;
    data['socialServices'] = socialServices;
    data['educationServices'] = educationServices;
    data['financialServices'] = financialServices;
    data['popularServices'] = popularServices;
    return data;
  }
}

/*ServiceCardConfigModel serviceCardConfigModelFromJson(String str)
  => ServiceCardConfigModel.fromJson(json.decode(str));

String serviceCardConfigModelToJson(ServiceCardConfigModel data)
  => json.encode(data.toJson());

class ServiceCardConfigModel {
  List<Clients>? clients;
  List<ServiceType>? serviceType;
  List<Properties>? properties;

  ServiceCardConfigModel(
    {
      this.clients,
      this.serviceType,
      this.properties
    }
  );

  ServiceCardConfigModel.fromJson(Map<String, dynamic> json) {
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(Clients.fromJson(v));
      });
    }
    if (json['serviceType'] != null) {
      serviceType = <ServiceType>[];
      json['properties'].forEach((v) {
        serviceType!.add(ServiceType.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
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
  String? clientName;
  String? clientId;
  List<int>? services;

  Clients({this.clientName, this.clientId, this.services});

  Clients.fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'];
    clientId = json['clientId'];
    services = json['services'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientName'] = clientName;
    data['clientId'] = clientId;
    data['services'] = services;
    return data;
  }
}

class Clients {
  String? clientId;
  String? clientName;
  List<Services>? services = [];

  Clients({this.clientId, this.clientName});

  Clients.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    clientName = json['clientName'];
    services = <Services>[];
    json['services'].forEach((v) {
      services!.add(Services.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientId'] = clientId;
    data['clientName'] = clientName;
    data['services'] = services;
    return data;
  }
}

class Services {
  List<int> services = [];

  Services(this.services);

  factory Services.fromJson(dynamic json) {
    if (json['services'] != null) {
      var serviceObjJson = json['services'] as List;
      List<int> services = serviceObjJson.map((serviceJson) =>
          Services.fromJson(serviceJson)).cast<int>().toList();
      return Services(
          services
      );
    } else {
      List<int> services = [];
      return Services(services);
    }
  }
}

class ServiceType {
  String? serviceTitle;
  String? serviceWhiteLogo;
  String? serviceWhiteLogoAlt;
  String? serviceBlueLogo;
  String? serviceBlueLogoAlt;

  ServiceType(
    {
      this.serviceTitle,
      this.serviceWhiteLogo,
      this.serviceWhiteLogoAlt,
      this.serviceBlueLogo,
      this.serviceBlueLogoAlt
    }
  );

  ServiceType.fromJson(Map<String, dynamic> json) {
    serviceTitle = json['serviceTitle'];
    serviceWhiteLogo = json['serviceWhiteLogo'];
    serviceWhiteLogoAlt = json['serviceWhiteLogoAlt'];
    serviceBlueLogo = json['serviceBlueLogo'];
    serviceBlueLogoAlt = json['serviceBlueLogoAlt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceTitle'] = serviceTitle;
    data['serviceWhiteLogo'] = serviceWhiteLogo;
    data['serviceWhiteLogoAlt'] = serviceWhiteLogoAlt;
    data['serviceBlueLogoAlt'] = serviceBlueLogoAlt;
    return data;
  }
}

class Properties {
  String? comingSoonTitle;
  String? purposeStatement;
  String? serviceStatement;
  String? signupButtonText;
  String? referOrganizationButtonText;
  String? signupButtonLink;
  String? referOrgButtonLink;
  String? all;
  String? urgentNeeds;
  String? healthServices;
  String? socialServices;
  String? educationServices;
  String? financialServices;
  String? popularServices;

  Properties(
      {
        this.comingSoonTitle,
        this.purposeStatement,
        this.serviceStatement,
        this.signupButtonText,
        this.referOrganizationButtonText,
        this.signupButtonLink,
        this.referOrgButtonLink,
        this.all,
        this.urgentNeeds,
        this.healthServices,
        this.socialServices,
        this.educationServices,
        this.financialServices,
        this.popularServices
      }
  );

  Properties.fromJson(Map<String, dynamic> json) {
    comingSoonTitle = json['comingSoonTitle'];
    purposeStatement = json['purposeStatement'];
    serviceStatement = json['serviceStatement'];
    signupButtonText = json['signupButtonText'];
    referOrganizationButtonText = json['referOrganizationButtonText'];
    signupButtonLink = json['signupButtonLink'];
    referOrgButtonLink = json['referOrgButtonLink'];
    all = json['all'];
    urgentNeeds = json['referOrganizationButtonText'];
    healthServices = json['healthServices'];
    socialServices = json['socialServices'];
    educationServices = json['educationServices'];
    financialServices = json['financialServices'];
    popularServices = json['popularServices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comingSoonTitle'] = comingSoonTitle;
    data['purposeStatement'] = purposeStatement;
    data['serviceStatement'] = serviceStatement;
    data['signupButtonText'] = signupButtonText;
    data['referOrgButtonLink'] = referOrgButtonLink;
    data['all'] = all;
    data['urgentNeeds'] = urgentNeeds;
    data['healthServices'] = healthServices;
    data['socialServices'] = signupButtonText;
    data['signupButtonText'] = socialServices;
    data['educationServices'] = signupButtonText;
    data['signupButtonText'] = educationServices;
    data['financialServices'] = financialServices;
    data['popularServices'] = popularServices;
    return data;
  }
}
*/