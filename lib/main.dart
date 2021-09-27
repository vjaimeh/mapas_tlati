import 'package:flutter/material.dart';
import 'package:mapas_tlati/src/views/home/home_view.dart';
import 'package:mapas_tlati/src/views/login/login_view.dart';
import 'package:mapas_tlati/src/utils/colors.dart' as utils;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Clone',
      initialRoute: 'home',
      theme: ThemeData(
        fontFamily: 'NimbusSans',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: utils.Colors.primaryColor
        ),
      ),
      routes: {
        'home':(BuildContext context) => HomeView(),
        'login':(BuildContext context) => const LoginView(),
      },
    );
  }
}