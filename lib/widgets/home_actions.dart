import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../sdr_page.dart';

import 'package:url_launcher/url_launcher.dart';

final Uri url = Uri.parse('https://accessdubuquejobs.com/');
Future<void> _launchUrl() async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
Widget actionSection(context, chatApi) {
  return Center(
    child: Container(
      color: Colors.white,
      child:
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                child: Ink.image(
                  width: 120,
                  height: 46,
                  fit: BoxFit.fill,
                  image: const AssetImage(
                    'assets/images/adj_vertical_2c.png',
                  ),
                  child: InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print('CONNECT TO CARE touched');
                      }
                      _launchUrl;
                    },
                  ),
                ),
              ),
            ),//Padding
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Material(
                child: Ink.image(
                  width: 120,
                  height: 46,
                  fit: BoxFit.fill,
                  image: const AssetImage(
                    'assets/images/HFS_ctc_image.png',
                  ),
                  child: InkWell(
                    onTap: () {
                      if (kDebugMode) {
                        print('CONNECT TO CARE touched');
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            SdrPage(context, title: 'CONNECT TO CARE',)),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
    ),
  );
}
