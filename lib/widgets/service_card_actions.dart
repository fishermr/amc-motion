import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../sdr_page.dart';

class ServiceCardActionWidget extends StatefulWidget{

  final Stream<int> stream;

  const ServiceCardActionWidget(BuildContext context, {super.key, required this.stream});

  @override
  ServiceCardActionWidgetState createState() => ServiceCardActionWidgetState();
}

class ServiceCardActionWidgetState extends State<ServiceCardActionWidget> {

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('--> initState called');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool checkBoxAll = false;
    bool checkBoxUrgent = false;
    bool checkBoxHealth = false;
    bool checkBoxSocial = false;
    bool checkBoxEducation = false;
    bool checkBoxFinance = false;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        if (kDebugMode) {
          print('--> Checkbox state return blue');
        }
        return Colors.blue;
      }
      if (kDebugMode) {
        print('--> Checkbox state return blue');
      }
      return Colors.transparent;
    }

    return Container(
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
                      value: checkBoxAll,
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
    );
  }
}