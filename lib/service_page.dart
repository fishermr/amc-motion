
import 'dart:async';

import 'package:amcmotion/api/service_card_api.dart';
import 'package:amcmotion/service_learn_more_page.dart';
import 'package:amcmotion/widgets/line_divider.dart';
import 'package:amcmotion/widgets/logo_image.dart';
import 'package:amcmotion/widgets/menu_drawer.dart';
import 'package:amcmotion/widgets/service_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'api/organization_service_config_api.dart';
import 'models/organization_service_config_model.dart';
import 'models/service_card_model.dart';


class ServicePage extends StatefulWidget {
  const ServicePage({
    super.key, required this.serviceKind, required this.serviceName,
  });

  final int serviceKind;
  final String serviceName;

  @override
  State<ServicePage> createState() => _ServicePageState();
}


class _ServicePageState extends State<ServicePage> {
  bool isLoading = true;
  ServiceCardConfigModel? serviceCardConfig = ServiceCardConfigModel();
  ServiceCardConfigApi? serviceCardConfigApiConfig = ServiceCardConfigApi();
  OrganizationServicesConfigModel? getOrgServicesConfig =
  OrganizationServicesConfigModel();
  OrganizationServiceConfigApi? getOrgServicesConfigApiConfig =
  OrganizationServiceConfigApi();
  late List<Organizations> activeOrganizations = [];
  late List<Organizations> activeServices = [];
  late List<Organizations> activeEvents = [];
  late List<Organizations> activeBookmarks = [];
  late List<Clients> clients;
  late List<ServiceType> serviceType;
  late Properties properties;
  String providedType = 'all';
  String orgType = 'organization';
  bool checkBoxAll = true;
  bool checkBoxUrgent = false;
  bool checkBoxHealth = false;
  bool checkBoxSocial = false;
  bool checkBoxEducation = false;
  bool checkBoxFinance = false;
  int orgCount = 0;
  int serviceCount = 0;
  int eventCount = 0;
  int bookmarkCount = 0;
  late double screenWidth;

  @override
  void initState() {
    super.initState();

    isLoading = true;
    getServiceCardConfigData();
  }

  Future<void> getServiceCardConfigData() async {
    serviceCardConfig = await serviceCardConfigApiConfig!.serviceCardConfig();
    // setState(() {
      clients = serviceCardConfig!.clients!;
      serviceType = serviceCardConfig!.serviceType!;
      properties = serviceCardConfig!.properties!;
      String clientId = clients[0].clientId!; // Hillcrest
      getOrgServices(clientId);
    // });
  }

  Future<void> getOrgServices(clientId) async {
    getOrgServicesConfig =
      await getOrgServicesConfigApiConfig!.orgServiceData(clientId)
        as OrganizationServicesConfigModel;
    setState(() {
      if (kDebugMode) {
        print('getOrgServicesConfig?.organizations: {$getOrgServicesConfig?.organizations.toJson()}');
      }
      getActiveOrganizations();
      if (kDebugMode) {
        print('getOrgServicesConfig number of organizations for serviceType: $providedType');
        print('getOrgServicesConfig number of organizations for orgType: $orgType');
        print('getOrgServicesConfig number of organizations: $orgCount');
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int serviceIndex = widget.serviceKind;
    MediaQueryData deviceInfo = MediaQuery.of(context);
    screenWidth = deviceInfo.size.width;

    return Scaffold(
        appBar: AppBar(title: Text(widget.serviceName.toUpperCase())),
    body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      )
    :Center (
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
                      serviceType[serviceIndex].serviceTitle!,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 22, width: 71,
                      child: serviceIcon(context, serviceType[serviceIndex].serviceBlueLogo!),
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
            Container(
                color: Colors.white,
                child:
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: checkBoxAll,
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              onChanged: (bool? value) {
                                if (kDebugMode) {
                                  print('--> All Checkbox touched value: $value');
                                }
                                setState(() {
                                  checkBoxAll = checkBoxSelection(value!, 'all');
                                });
                              },
                            ),
                            const Text(
                                'ALL',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 10.0,
                                )
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: checkBoxUrgent,
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxUrgent = checkBoxSelection(value!, 'urgent');
                                });
                              },
                            ),
                            const Text(
                              'URGENT',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: checkBoxHealth,
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxHealth = checkBoxSelection(value!, 'health');
                                });
                              },
                            ),
                            const Text(
                              'HEALTH',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: checkBoxSocial,
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxSocial = checkBoxSelection(value!, 'social');
                                });
                              },
                            ),
                            const Text(
                              'SOCIAL',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: checkBoxEducation,
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxEducation = checkBoxSelection(value!, 'education');
                                });
                              },
                            ),
                            const Text(
                              'EDUCATION',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: checkBoxFinance,
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxFinance = checkBoxSelection(value!, 'finance');
                                });
                              },
                            ),
                            const Text(
                              'FINANCE',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                color: Colors.lightBlueAccent,
                width: deviceInfo.size.width,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Center(
                    child: Text(
                      'POPULAR SERVICES IN YOUR AREA',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                            tabs: [
                              Tab(text: 'Organizations'),
                              Tab(text: 'Services'),
                              Tab(text: 'Events'),
                              Tab(text: 'Bookmarks'),
                            ],
                          )
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: activeOrganizations.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  activeOrganizations.isNotEmpty ?
                            buildOrganizationCard(index, 'organization')
                                : buildEmptyCard(index);
                          },
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: activeServices.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  activeServices.isNotEmpty ?
                            buildOrganizationCard(index, 'service')
                                : buildEmptyCard(index);
                          },
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: activeEvents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  activeEvents.isNotEmpty ?
                            buildOrganizationCard(index, 'event')
                                : buildEmptyCard(index);
                          },
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: activeBookmarks.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (kDebugMode) {
                              print('bookmark count: $orgCount');
                            }
                            return  activeBookmarks.isNotEmpty ?
                              buildOrganizationCard(index, 'bookmark')
                                : buildEmptyCard(index);
                          },
                        ),
                      ]
                    )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: menuDrawer(context)
    );
  }

  Widget buildOrganizationCard(int index, String type) =>
    ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 50,
      ),
      child: ListTile(
        // leading: const Icon(Icons.list),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                activeOrganizations[index].logoUrl!,
                width: 212,
                height: 71,
              ),
            ),
            Text(activeOrganizations[index].orgName!)
          ]
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                  activeOrganizations[index].description!
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: InkWell(
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: InkWell(
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: InkWell(
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
                            if (kDebugMode) {
                              print('Service Learn More touched');
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  ServiceLearnMorePage(
                                      serviceName: widget.serviceName,
                                      serviceTitle: serviceType[widget.serviceKind].serviceTitle!,
                                      serviceIcon: serviceType[widget.serviceKind].serviceBlueLogo!,
                                      organizationData: activeOrganizations[index])),
                            );
                          },
                          child: const Center(
                            child: Icon(
                              Icons.help_outline,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ),
                        ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: lineDivider(context, 2.0)
            ),
          ]
        ),
      )
    );

  Widget buildEmptyCard(int index) =>
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 50,
        ),
        child: const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'No active organizations',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                )
              ),
            ]
        ),
    );

  checkBoxSelection(bool selection, String type) {
    checkBoxAll = false;
    checkBoxUrgent = false;
    checkBoxHealth = false;
    checkBoxSocial = false;
    checkBoxEducation = false;
    checkBoxFinance = false;
    if (selection) {
      providedType = type;
      getActiveOrganizations();
      if (kDebugMode) {
        print('checkBoxSelection number of activeOrganizations: ${activeOrganizations.length}');
        print('checkBoxSelection number of activeServices: ${activeServices.length}');
        print('checkBoxSelection number of activeEvents: ${activeEvents.length}');
        print('checkBoxSelection number of activeBookmarks: ${activeBookmarks.length}');
      }
    }
    return selection;
  }

  getActiveOrganizations() {
    if (kDebugMode) {
      print('getActiveOrganizations providedType: --->$providedType<---');
    }
    activeOrganizations = [];
    activeServices = [];
    activeEvents = [];
    activeBookmarks = [];
    for (Organizations org in getOrgServicesConfig!.organizations!) {
      if ((org.serviceProvided!.any((e) => e.toString().toLowerCase().contains(providedType)) &&
        org.orgCardType == 'organization') ||
          (providedType == 'all' && org.orgCardType == 'organization')) {
        activeOrganizations.add(org);
      }
      else
      if ((org.serviceProvided!.any((e) => e.toString().toLowerCase().contains(providedType)) &&
          org.orgCardType == 'service') ||
          (providedType == 'all' && org.orgCardType == 'service')) {
        activeServices.add(org);
      }
      else
      if ((org.serviceProvided!.any((e) => e.toString().toLowerCase().contains(providedType)) &&
          org.orgCardType == 'event') ||
          (providedType == 'all' && org.orgCardType == 'event')) {
        activeEvents.add(org);
      }
      // Bookmark
      /*if ((org.serviceProvided!.any((e) => e.toString().toLowerCase().contains(providedType)) &&
          org.orgCardType == 'bookmark') ||
          (providedType == 'all' && org.orgCardType == 'service')) {
        activeBookmarks.add(org);
      }*/
    }
  }
}