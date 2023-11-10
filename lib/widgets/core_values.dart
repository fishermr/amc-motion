import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../learn_more.dart';

Widget coreValuesSection(BuildContext context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);

  String? dataSuccess = 'All individuals regardless of their economic status '
    'should have adequate access to the right set of care resources when they '
    'are needed to live a healthier, more comfortable life. Our data driven, '
    'human-centered processes increases your organizations ability to ensure '
    'this for all individuals in need.';
  String? trustBasedInteractions = 'Our platform increases trust-based '
    'interactions between individuals in need, community care givers, and '
    'community service providers. These community representatives are in the '
    'best position to proactively intervene to help the vulnerable individuals '
    'in need. The more this happens the more everyone involved will benefit.';
  String? ecoSystemOfCare = 'All individuals regardless of their economic '
    'status should have adequate access to the right set of care resources '
    'when they are needed to live a healthier, more comfortable life. Our '
    'data driven, human-centered processes increases your organizations '
    'ability to ensure this for all individuals in need.';
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 30),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SvgPicture.asset(
              'assets/svg/icons_cap-03a.svg',
              semanticsLabel: '03 Ecosystem of Care',
              colorFilter: const ColorFilter.mode(Colors.indigo,
                  BlendMode.srcIn),
              height: 83.2,
              width: 82.8,
            ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                '03 Ecosystem of Care',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              ecoSystemOfCare,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SvgPicture.asset(
              'assets/svg/icons_cap-02a.svg',
              semanticsLabel: '02 Trust-Based Interactions',
              colorFilter: const ColorFilter.mode(Colors.indigo,
                  BlendMode.srcIn),
              height: 83.2,
              width: 82.8,
            ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '02 Trust-Based Interactions',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(trustBasedInteractions,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SvgPicture.asset(
              'assets/svg/icons_cap-03a.svg',
              semanticsLabel: '03 Ecosystem of Care',
              colorFilter: const ColorFilter.mode(Colors.indigo,
                  BlendMode.srcIn),
              height: 83.2,
              width: 82.8,
            ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '03 Ecosystem of Care',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Container(
          color: Colors.blue[50],
          width: deviceInfo.size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(ecoSystemOfCare,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
}
