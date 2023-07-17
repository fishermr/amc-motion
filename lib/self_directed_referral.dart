import 'dart:convert';
import 'package:amcmotion/widgets/formSelfDirectedReferral.dart';
import 'package:amcmotion/widgets/logo_image.dart';
import 'package:amcmotion/widgets/menu_drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:http/http.dart' as http;
import 'models/sdr_community_model.dart';
import 'package:regexed_validator/regexed_validator.dart';

class SelfDirectedReferralPage extends StatefulWidget {
  const SelfDirectedReferralPage(BuildContext context, {super.key, required this.title});

  final String title;

  @override
  State<SelfDirectedReferralPage> createState() => _SelfDirectedReferralPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _SelfDirectedReferralPageState extends State<SelfDirectedReferralPage> {
  final form = FormGroup({
    'howCanWeServeYou': FormControl<int>(validators: [Validators.required]),
    'selectOrganization': FormControl<int>(validators: [Validators.required]),
    'firstName': FormControl<String>(validators: [Validators.required]),
    'middle': FormControl<String>(validators: [Validators.required]),
    'lastName': FormControl<String>(validators: [Validators.required]),
    'address': FormControl<String>(validators: [Validators.required]),
    'addressExt': FormControl<String>(),
    'city': FormControl<String>(validators: [Validators.required]),
    'zipcode': FormControl<String>(validators: [Validators.required,
      Validators.pattern(r'^[0-9]{5}(?:-[0-9]{4})?$')]),
    'usStates': FormControl<int>(validators: [Validators.required]),
    'phoneNumber': FormControl<String>(validators: [Validators.required,
      Validators.pattern(r'(^(?:[+0]1)?[0-9]{10}$)')]),
    'email': FormControl<String>(validators: [Validators.required, Validators.email]),
    'identifyOurOrg': FormControl<bool>(value: false),
    'contactUs': FormControl<int>(validators: [Validators.required]),
    'bestTimeToServeYou': FormControl<int>(validators: [Validators.required]),
    'consent': FormControl<bool>(value: false),
    // 'emailConfirmation': FormControl<String>(),
    // 'password': FormControl<String>(validators: [Validators.required, Validators.minLength(8)]),
    // 'passwordConfirmation': FormControl<String>(),
  }, validators: [
  ]);

  var howCanWeServeYouList = [
    'I would like information about an organization.',
    'I would like an organization to contact me.',
    'I would like to schedule an appointment with an organization.',
  ];

  var contactUsList = [
    'Myself',
    'Family member',
    'Employee',
    'Other',
  ];

  var bestTimeToReachList = [
    'Morning',
    'Afternoon',
    'Evening',
    'Anytime',
  ];

  List<DropdownMenuItem<int>> howCanWeServeYouDropdownItems = [];
  List<DropdownMenuItem<int>> contactUsDropdownItems = [];
  List<DropdownMenuItem<int>> bestTimeToReachDropdownItems = [];
  List<DropdownMenuItem<int>> organizationDropdownItems = [];
  List<DropdownMenuItem<int>> usStatesDropdownItems = [];

  bool isLoading = true;
  SdrCommunityModel? dataFromAPI;
  @override
  void initState() {
    super.initState();
    getData();

    // Build drop down list for howCanWeServeYouList
    howCanWeServeYouDropdownItems = List.generate(
      howCanWeServeYouList.length,
          (index) =>
          DropdownMenuItem(
            value: index,
            child: Text(
                howCanWeServeYouList[index],
                style: const TextStyle(
                  fontSize: 11.0,
                )
            ),
          ),
    );

    // Build Contact Us list for howCanWeServeYouList
    contactUsDropdownItems = List.generate(
      contactUsList.length,
          (index) =>
          DropdownMenuItem(
            value: index,
            child: Text(
                contactUsList[index],
                style: const TextStyle(
                  fontSize: 11.0,
                )
            ),
          ),
    );

    // Build Contact Us list for howCanWeServeYouList
    bestTimeToReachDropdownItems = List.generate(
      bestTimeToReachList.length,
          (index) =>
          DropdownMenuItem(
            value: index,
            child: Text(
                bestTimeToReachList[index],
                style: const TextStyle(
                  fontSize: 11.0,
                )
            ),
          ),
    );
  }
  getData() async {
    try {
      var amcHeader = {
        'amc-platform': 'amc741',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      };
      String url = 'https://vk2rw7fg9e.execute-api.us-east-1.amazonaws.com/amc741/amc/referral/community/lists?clientuuid=bf4fe5ae-c2f7-4f3d-8b9f-68221226de98';
      http.Response res = await http.get(
        Uri.parse(url),
        headers: amcHeader,
      );
      if (res.statusCode == 200) {
        if (kDebugMode) {
          debugPrint('status returned 200');
        }
        dataFromAPI = SdrCommunityModel.fromJson(json.decode(res.body));
        if (kDebugMode) {
          debugPrint('dataFromAPI: $dataFromAPI');
        }
        isLoading = false;

        organizationDropdownItems = List.generate(
          dataFromAPI!.orgList.length,
            (index) => DropdownMenuItem(
            value: index,
            child: Text(
                dataFromAPI!.orgList[index].orgName,
                style: const TextStyle(
                  fontSize: 11.0,
                )
            ),
          ),
        );

        usStatesDropdownItems = List.generate(
          dataFromAPI!.usStates.length,
              (index) => DropdownMenuItem(
            value: index,
            child: Text(
                dataFromAPI!.usStates[index].name,
                style: const TextStyle(
                  fontSize: 11.0,
                )
            ),
          ),
        );
        setState(() {});
      }
    } catch (e) {
      if (kDebugMode) {
        print('***** API ERROR *****');
        debugPrint(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(title: Text( widget.title)),
      body: SingleChildScrollView(
        child: ReactiveForm(
          formGroup: form,
          child: SizedBox(
            width: deviceInfo.size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                logoImage(context),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child:
                  Text("Self-Directed Referral",
                    style: TextStyle(
                      color: Color(0xFF3E6D6F),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child:
                  Text("This form is not meant for emergency or urgent medical use. "
                      "If this request is related to an emergency medical "
                      "situation, stop and call 9-1-1.",
                    style: TextStyle(
                      color: Color(0xFFF1563F),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                  formSelfDirectedReferral(context, form,
                    howCanWeServeYouDropdownItems,
                    contactUsDropdownItems,
                    bestTimeToReachDropdownItems,
                    organizationDropdownItems,
                    usStatesDropdownItems),
              ],
            ),
          ),
        ),
      ),
      endDrawer: menuDrawer(context)
    );
  }
}
