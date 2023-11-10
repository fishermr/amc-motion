
import 'package:amcmotion/widgets/benefit_section.dart';
import 'package:amcmotion/widgets/core_values.dart';
import 'package:amcmotion/widgets/learn_more_banner.dart';
import 'package:amcmotion/widgets/line_divider.dart';
import 'package:amcmotion/widgets/menu_drawer.dart';
import 'package:amcmotion/widgets/neighbors_section.dart';
import 'package:amcmotion/widgets/register_banner.dart';
import 'package:amcmotion/widgets/signup_section.dart';
import 'package:flutter/material.dart';

class LearnMorePage extends StatefulWidget {
  const LearnMorePage({
    super.key, required this.serviceName
  });

  final String serviceName;

  @override
  State<LearnMorePage> createState() => _LearnMorePageState();
}


class _LearnMorePageState extends State<LearnMorePage> {
  late double screenWidth;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    screenWidth = deviceInfo.size.width;

    return Scaffold(
      appBar: AppBar(title: Text(
        widget.serviceName.toUpperCase(),
        style: Theme.of(context).textTheme.displayMedium),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  learnMoreBanner(context),
                  benefitSection(context),
                  lineDivider(context, 2.0),
                  neighborsSection(context),
                  signupSection(context),
                  registerBannerSection(context),
                  coreValuesSection(context),
                ],
              ),
            ),
      ),
        endDrawer: menuDrawer(context)
    );
  }
}
