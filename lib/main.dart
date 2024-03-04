import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Shared/Screens/LoginScreen.dart';
import 'package:untitled/Shared/Screens/home_Screen.dart';
import 'package:untitled/Shared/Screens/navigation_screen.dart';

void main() {
  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool logined = false;
  @override
  void initState() {
    auth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logined ? Navigation_screen() : loginScreen(),
    );
  }

  void auth() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    final sh = await shared.getBool('auth');
    if (sh != null) {
      logined = sh;
    } else {
      logined = false;
    }
    setState(() {});
  }
}
