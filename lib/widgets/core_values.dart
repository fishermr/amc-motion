import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../learn_more.dart';

Widget coreValuesSection(BuildContext context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);

  return Center(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            Container(
              color: Colors.blue[50],
              child: const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.blue[50],
              child: const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.blue[50],
              child: const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
