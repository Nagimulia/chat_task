import 'package:chat_task/firebase_options.dart';
import 'package:chat_task/pages/chatpage.dart';
import 'package:chat_task/pages/home.dart';
import 'package:chat_task/pages/signin.dart';
import 'package:chat_task/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: SignUp(),
    );
  }
}
