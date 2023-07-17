
import 'package:flutter/material.dart';
import 'package:amcmotion/api/chat_api.dart';

import 'home_page.dart';

void main() => runApp(
    MotionApp(chatApi: ChatApi())
);

class MotionApp extends StatelessWidget {
  const MotionApp({super.key, required this.chatApi});

  final ChatApi chatApi;

  static const appTitle = 'AMC MOTION';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: HomePage(title: appTitle, chatApi: chatApi),
    );
  }
}
