import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ServiceCardOrgTypes extends StatefulWidget {
  const ServiceCardOrgTypes({Key? key}) : super(key: key);

  @override
  State<ServiceCardOrgTypes> createState() => ServiceCardOrgTypesState();
}

class ServiceCardOrgTypesState extends State<ServiceCardOrgTypes> {
  @override
  Widget build(BuildContext context) {
    bool checkBoxAll = false;
    return  Container(
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
        ],
      ),
    );
  }
}