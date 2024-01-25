import 'package:chat_task/firebase_options.dart';
import 'package:chat_task/generated/l10n.dart';
import 'package:chat_task/pages/signin.dart';
import 'package:chat_task/pages/signup.dart';
import 'package:chat_task/service/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: FutureBuilder(
            future: AuthMethods().getcurrentUser(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return SignUp();
              } else {
                return SignIn();
              }
            }));
  }
}
