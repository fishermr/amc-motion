/*
Our mission is to illuminate the world’s narratives with transparency, allowing members to think critically and explore multiple
 facets and perspectives of a story.   We believe in providing a dynamic platform that empowers members to cultivate opinions,
  build dedicated followers, and foster open dialogue with both like-minded individuals and those with differing viewpoints.
 */
import 'dart:async';
import 'dart:convert';

import 'package:amcmotion/api/service_card_api.dart';
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
  final StreamController<int> _controller = StreamController<int>();
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

    isLoading = true;
    getServiceCardConfigData();
  }

  Future<void> getServiceCardConfigData() async {
    serviceCardConfig = await serviceCardConfigApiConfig!.serviceCardConfig();
    setState(() {
      clients = serviceCardConfig!.clients!;
      serviceType = serviceCardConfig!.serviceType!;
      properties = serviceCardConfig!.properties!;
      String clientId = clients[0].clientId!; // Hillcrest
      getOrgServices(clientId);
    });
  }

  Future<void> getOrgServices(clientId) async {
    getOrgServicesConfig =
      await getOrgServicesConfigApiConfig!.orgServiceData(clientId)
        as OrganizationServicesConfigModel;
    setState(() {
      if (kDebugMode) {
        print('getOrgServicesConfig?.organizations: {$getOrgServicesConfig?.organizations.toJson()}');
      }
      orgCount = getOrgServicesConfig!.organizations!.length;
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
                                  checkBoxAll = value!;
                                  if (kDebugMode) {
                                    print('--> setState value: $value');
                                    print('--> setState checkBoxAll: $checkBoxAll');
                                  }
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
                                  checkBoxUrgent = !checkBoxUrgent;
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
                                  checkBoxHealth = !checkBoxHealth;
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
                                  checkBoxSocial = !checkBoxSocial;
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
                                  checkBoxEducation = !checkBoxEducation;
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
                                  checkBoxFinance = !checkBoxFinance;
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
                  length: orgCount,
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
                            ],
                          )
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: orgCount,
                          itemBuilder: (BuildContext context, int index) {
                            return buildOrganizationCard(index);
                          },
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: orgCount,
                          itemBuilder: (BuildContext context, int index) {
                            return buildOrganizationCard(index);
                          },
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: orgCount,
                          itemBuilder: (BuildContext context, int index) {
                            return buildOrganizationCard(index);
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

  Widget buildOrganizationCard(int index) =>
    ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 50,
      ),
      child:  ListTile(
        // leading: const Icon(Icons.list),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(getOrgServicesConfig!.organizations![index].logoUrl!),
            Text(getOrgServicesConfig!.organizations![index].orgName!)
          ]
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                  getOrgServicesConfig!.organizations![index].description!
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    //
                  },
                  child: const Center(
                    child: Icon(
                      Icons.help_outline,
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
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.contact_page,
                      color: Colors.black54,
                      size: 30.0,
                    ),
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
        /*trailing: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: 30.0,
              child: Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30.0,
              ),
            ),
            SizedBox(
              width: 30.0,
              child: Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              ),
            ),
          ]
        ),*/
      )
    );
}