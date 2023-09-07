import 'dart:async';
import 'dart:convert';

import 'package:amcmotion/api/service_card_api.dart';
import 'package:amcmotion/widgets/line_divider.dart';
import 'package:amcmotion/widgets/logo_image.dart';
import 'package:amcmotion/widgets/service_icon.dart';
import 'package:amcmotion/widgets/services_provided.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'api/organization_service_config_api.dart';
import 'models/organization_service_config_model.dart';
import 'models/service_card_model.dart';

class ServiceLearnMorePage extends StatefulWidget {
  const ServiceLearnMorePage({
    super.key, required this.organizationData, required this.serviceName,
    required this.serviceTitle, required this.serviceIcon
  });

  final Organizations organizationData;
  final String serviceName;
  final String serviceTitle;
  final String serviceIcon;

  @override
  State<ServiceLearnMorePage> createState() => _ServiceLearnMorePageState();
}

class _ServiceLearnMorePageState extends State<ServiceLearnMorePage> {
  bool isLoading = true;
  ServiceCardConfigModel? serviceCardConfig = ServiceCardConfigModel();
  ServiceCardConfigApi? serviceCardConfigApiConfig = ServiceCardConfigApi();
  OrganizationServicesConfigModel? getOrgServicesConfig =
  OrganizationServicesConfigModel();
  OrganizationServiceConfigApi? getOrgServicesConfigApiConfig =
  OrganizationServiceConfigApi();
  late List<Clients> clients;
  late List<ServiceType> serviceType;
  late Properties properties;
  bool checkBoxAll = true;
  bool checkBoxUrgent = false;
  bool checkBoxHealth = false;
  bool checkBoxSocial = false;
  bool checkBoxEducation = false;
  bool checkBoxFinance = false;
  late int orgCount;
  late double screenWidth;

  @override
  void initState() {
    super.initState();

    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    late final Completer<GoogleMapController> controller = Completer();
    MediaQueryData deviceInfo = MediaQuery.of(context);
    screenWidth = deviceInfo.size.width;
    String? orgName = widget.organizationData.orgName;
    String? orgLogoUrl = widget.organizationData.logoUrl;
    String? orgPromoUrl = widget.organizationData.promoUrl;
    String? orgTagline = widget.organizationData.tagLine;
    String? orgDesc = widget.organizationData.description;
    String? orgStreetAddress = widget.organizationData.address;
    String? orgEmail = widget.organizationData.email;
    String? orgPhone = widget.organizationData.phoneNumber;
    String? strLat = widget.organizationData.mapCoords?.lat;
    double lat = double.parse(strLat!);
    String? strLng = widget.organizationData.mapCoords?.lng;
    double lng = double.parse(strLng!);
    List<Services> providedServices =
        widget.organizationData.services!;
    List<UsefulFeatures> providedUsefulFeatures =
        widget.organizationData.usefulFeatures!;
    List<EligibilityCriteria> providedEligibility =
        widget.organizationData.eligibilityCriteria!;
    List<SpecialNeeds> providedSpecialNeeds =
        widget.organizationData.specialNeeds!;

    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(
      double.parse(lat as String),
      double.parse(lng as String)),
      zoom: 14.4746,
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.serviceName.toUpperCase())),
        body: isLoading ? const Center(
          child: CircularProgressIndicator(),
        )
      :SingleChildScrollView(
        child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: logoImage(context),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.serviceTitle,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 22, width: 71,
                      child: serviceIcon(context, widget.serviceIcon),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              lineDivider(context, 6.0),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                  child: Text(
                    orgName!,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                  child: Image.network(
                      orgLogoUrl!
                  ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Image.network(
                    orgPromoUrl!
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                  child: Text(
                    orgTagline!,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                  child: Text(
                    orgDesc!,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: const Center(
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: const Center(
                          child: Icon(
                            Icons.thumb_up,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: const Center(
                          child: Icon(
                            Icons.comment,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: const Center(
                          child: Icon(
                            Icons.share,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                    },
                                    child: const Center(
                                      child: Icon(
                                        Icons.contact_page,
                                        color: Colors.blue,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ]
                            )
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: lineDivider(context, 2.0)
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                  width: deviceInfo.size.width,
                  height: 400,
                  child: DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        automaticallyImplyLeading: false, // remove back button
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        flexibleSpace: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TabBar(
                              indicatorColor: Colors.grey,
                              labelColor: Colors.blue,
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              labelStyle: TextStyle(
                                  fontSize: 11.0,
                                  color: Colors.blue
                              ),
                              unselectedLabelStyle: TextStyle(
                                  fontSize: 11.0
                              ),
                              tabs: [
                                Tab(text: 'Services'),
                                Tab(text: 'Useful Features'),
                                Tab(text: 'Eligibility'),
                                Tab(text: 'Special Needs'),
                              ],
                            )
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return buildOrganizationCard(index, 'services',
                                  providedServices,
                                  providedUsefulFeatures,
                                  providedEligibility,
                                  providedSpecialNeeds
                                  );
                            },
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return buildOrganizationCard(index, 'useful features',
                                  providedServices,
                                  providedUsefulFeatures,
                                  providedEligibility,
                                  providedSpecialNeeds
                              );
                            },
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return buildOrganizationCard(index, 'eligibility',
                                  providedServices,
                                  providedUsefulFeatures,
                                  providedEligibility,
                                  providedSpecialNeeds
                              );                            },
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return buildOrganizationCard(index, 'special needs',
                                  providedServices,
                                  providedUsefulFeatures,
                                  providedEligibility,
                                  providedSpecialNeeds
                              );
                            },
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                              child: Image.network(
                                  orgLogoUrl
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(10, 20, 5, 2),
                                child: SizedBox(
                                  width: screenWidth /2,
                                  child: Text(
                                    orgName,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 5, 2),
                              child: SizedBox(
                                width: screenWidth /2,
                                child: Text(
                                  'ADDRESS\n${orgStreetAddress!}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 5, 2),
                              child: SizedBox(
                                width: screenWidth /2,
                                child: Text(
                                  'EMAIL: ${orgEmail!}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 5, 30),
                              child: SizedBox(
                                width: screenWidth /2,
                                child: Text(
                                  'PHONE: ${orgPhone!}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 5, 10),
                              child: SizedBox(
                                width: screenWidth *.40,
                                child: GoogleMap(
                                  mapType: MapType.hybrid,
                                  initialCameraPosition: kGooglePlex,
                                  onMapCreated: (GoogleMapController controller) {
                                    controller.complete(controller);
                                  },
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildOrganizationCard(int index, String type,
      List<Services> providedServices,
      List<UsefulFeatures> providedUsefulFeatures,
      List<EligibilityCriteria> providedEligibility,
      List<SpecialNeeds> providedSpecialNeeds) =>
    ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 50,
      ),
      child:  ListTile(
        title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            if (type == 'services') ...[
              servicesProvided(context, providedServices, 'services')
            ] else if(type == 'useful features')...[
              servicesProvided(context, providedUsefulFeatures, 'usefulFeatures')
              ] else if(type == 'eligibility')...[
              servicesProvided(context, providedEligibility, 'eligibility')
                ] else if(type == 'special needs')...[
              servicesProvided(context, providedSpecialNeeds, 'specialNeeds')
                  ],
            ],
         ),
    ),
  );
}