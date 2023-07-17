
import 'package:amcmotion/self_directed_referral.dart';
import 'package:amcmotion/widgets/bullet_list.dart';
import 'package:amcmotion/widgets/formSelfDirectedReferral.dart';
import 'package:amcmotion/widgets/line_divider.dart';
import 'package:amcmotion/widgets/logo_image.dart';
import 'package:flutter/foundation.dart';
import 'package:amcmotion/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class SdrPage extends StatefulWidget {
  const SdrPage(BuildContext context, {super.key, required this.title});

  final String title;

  @override
  State<SdrPage> createState() => _SdrPageState();

  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _SdrPageState extends State<SdrPage> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    List<String> bulletItems = [
      "Request information",
      "Speak to a Caring Professional",
      "Schedule an Appointment with a Care or Service Provider"
    ];

    return Scaffold(
        appBar: AppBar(title: Text( widget.title)),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              lineDivider(context, 4.0),
              logoImage(context),
              lineDivider(context, 6.0),
              Text("Welcome to AccessMeCare Hillcrest Family Services",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 12
                  )
              ),
              const SizedBox(
                width: double.infinity,
                child:
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage('assets/images/iStock-1067721136.jpg')
                    )
                  )
              ),
              SizedBox(
                width: deviceInfo.size.width - 40,
                height: 40.0,
                child:
                    TextButton(
                    onPressed: () {
                      if (kDebugMode) {
                        print('Self Directed Referral touched');
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            SelfDirectedReferralPage(context, title: 'Self Directed Referral')
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orangeAccent[700],
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal)
                        ),
                    child: const Text(
                      'Start Your Best Care Journey Here',
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child:
                  Text("Hillcrest Family Services and their community partners are always there to help you.",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ),
              Center(
              child:
                Text("Use this button to:",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 12
                  )
                ),
              ),
              bulletList(context, bulletItems),
              Padding(
                padding: const EdgeInsets.all(20),
                child:
                Text("If you are having a mental health emergency, please call the crisis hotline.",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              lineDivider(context, 10.0),
              SizedBox(
                width: deviceInfo.size.width,
                height: 40.0,
              ),
            ]
          ),
        ),
        endDrawer: menuDrawer(context)
    );
  }
}