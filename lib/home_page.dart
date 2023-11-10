
import 'package:amcmotion/widgets/home_actions.dart';
import 'package:amcmotion/widgets/home_banner.dart';
import 'package:amcmotion/widgets/menu_drawer.dart';
import 'package:amcmotion/widgets/service_actions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amcmotion/api/chat_api.dart';
import 'package:http/http.dart' as http;
import 'api/client_service_api.dart';
import 'api/common_data_api.dart';
import 'api/general_config_api.dart';
import 'api/header_api.dart';
import 'api/home_api.dart';
import 'models/org_configuration_model.dart';
import 'models/client_configuration_model.dart';
import 'chat_page.dart';
import 'dart:convert';
import 'dart:developer';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.chatApi});

  final String title;
  final ChatApi chatApi;


  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;
  OrgConfigurationModel? dataFromAPI;
  ClientServiceApi? clientService = ClientServiceApi();
  GeneralConfigApi? generalConfig = GeneralConfigApi();
  CommonConfigApi? commonConfig = CommonConfigApi();
  late CommonModel? commonData;
  HeaderApi? headerService = HeaderApi();
  HomeApi? homeService = HomeApi();

  late Client activeClient;
  late Header activeHeader;
  late Home activeHome;
  String? clientId = '';
  String? clientName = '';
  String? shortName = '';
  bool? clientActive = false;


  @override
  void initState() {
    super.initState();

    isLoading = true;
    getClientService();
    getGeneralConfig();
    getCommonData();
    getHeaderData(clientId!);
    getHomeData(clientId!);
  }

  Future<void> getClientService() async {
    activeClient = await clientService!.clientData();
    setState(() {
      if (kDebugMode) {
        // log('client length:  ${activeClient.clientName}');
      }
      clientId = activeClient.clientId;
      clientName = activeClient.clientName;
      shortName = activeClient.shortName;
      clientActive = activeClient.active;

      if (kDebugMode) {
        // print('getClientService isLoading: $isLoading');
      }
    });
  }

  Future<void> getGeneralConfig() async {
    dataFromAPI = await generalConfig!.configData();
    setState(() {
      if (kDebugMode) {
        // print(
        //    'getGeneralConfig dataFromAPI!clientServices: $dataFromAPI!clientServices');
        // print('getGeneralConfig isLoading: $isLoading');
      }
    });
  }

  Future<void> getCommonData() async {
    commonData = await commonConfig!.commonConfig();
    setState(() {
      if (kDebugMode) {
        // print('getCommonData isLoading: $isLoading');
      }
    });
  }

  Future<void> getHeaderData(String clientId) async {
    activeHeader = await headerService!.headerData(clientId);
    setState(() {
      if (kDebugMode) {
        // log('header clientId:  ${activeHeader.clientId}');
      }
      if (kDebugMode) {
        // print('getHeaderData isLoading: $isLoading');
      }
    });
  }

  Future<void> getHomeData(String clientId) async {
    activeHome = await homeService!.homeData(clientId);
    setState(() {
      isLoading = false;
      if (kDebugMode) {
        // log('home clientId:  ${activeHome.clientId}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        widget.title,
        style: Theme.of(context).textTheme.displayMedium),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:
          isLoading ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
            children: [
              bannerSection(context),
              actionSection(context, widget.chatApi),
              serviceSection(context, dataFromAPI?.clientServices),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child:
                OutlinedButton(
                    onPressed: (){
                      if (kDebugMode) {
                        print('FIND HELP touched');
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ChatPage(chatApi: widget.chatApi)),
                      );
                    },
                    child: const Text('FIND HELP')
                ),
              ),
            ]
        ),
      endDrawer: menuDrawer(context)
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<OrgConfigurationModel>('dataFromAPI', dataFromAPI));
  }
}