import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/organization_service_config_model.dart';

Widget servicesProvided(context, providedServices, type) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  double screenWidth = deviceInfo.size.width;
  return Container(
      color: Colors.white,
      child: Column (
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          for(var service in providedServices )
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (!service.item.isEmpty)
                      const Icon(
                        Icons.check,
                        color: Colors.blue,
                        size: 12.0,
                      ),
                    if (!service.subItem.isEmpty)
                      const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 6.0,
                          ),
                      ),
                    if (!service.item.isEmpty)
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: SizedBox(
                            width: screenWidth - 70,
                            child: Text(
                              service.item,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ),
                    if (!service.subItem.isEmpty)
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: Text(
                            service.subItem,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          )
                      ),
                  ]
              )
        ]
      ),
  );
}
