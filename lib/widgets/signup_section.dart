import 'package:amcmotion/widgets/line_divider.dart';
import 'package:flutter/material.dart';

Widget signupSection(context) {
  MediaQueryData deviceInfo = MediaQuery.of(context);
  double screenWidth = deviceInfo.size.width;

  return Center(
    child: Container(
      color: const Color(0xFFFAFAFA),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.normal),
            ),
            onPressed: () {},
            child: const Text('Sign Your Organization up Today'),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  color: Colors.lightBlue[50],
                  child: Column(
                  mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: SizedBox(
                          width: screenWidth - 50,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                      Icons.settings,
                                      size: 26,
                                      color: Colors.lightBlue
                                  ),
                                ),
                                TextSpan(
                                    text: "  Over 50 Million",
                                    style: Theme.of(context).textTheme.titleMedium,
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                    child: Text(
                                      'Americans have diagnosable brain health disorders each year',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    )
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ]
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  color: Colors.lightBlue[50],
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: SizedBox(
                          width: screenWidth - 50,
                          child: RichText(
                            text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  Icons.settings,
                                  size: 26,
                                  color: Colors.lightBlue
                                ),
                              ),
                              TextSpan(
                                text: " 1 in 5",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              WidgetSpan(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                                      child: Text(
                                          'People have experienced a brain health issue in their lives – that’s over 482,000 Iowans.',
                                          style: Theme.of(context).textTheme.titleMedium,
                                      )
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ]
                  ),
                ),
              ),
            ]
          ),
        ],
      ),
    ),
  );
}