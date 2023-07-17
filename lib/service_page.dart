
import 'package:amcmotion/widgets/menu_drawer.dart';
import 'package:amcmotion/widgets/service_icon.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({
    super.key, required this.serviceType, required this.serviceName,
  });

  final int serviceType;
  final String serviceName;

  @override
  State<ServicePage> createState() => _ServicePageState();
}


class _ServicePageState extends State<ServicePage> {
  get serviceType => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.serviceName.toUpperCase())),
    body: Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            serviceIcon(context, 'basic-needs'),
          ],
      ),
    ),
    endDrawer: menuDrawer(context)
    );
  }
}