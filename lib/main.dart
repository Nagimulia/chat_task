import 'package:chat_task/pages/chatpage.dart';
import 'package:chat_task/pages/home.dart';
import 'package:chat_task/pages/signin.dart';
import 'package:chat_task/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: ChatPage(),
    );
  }
}
