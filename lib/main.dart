import 'package:flutter/material.dart';
import 'package:mapas_tlati/views/home/home_view.dart';
import 'package:mapas_tlati/views/login/login_view.dart';

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
        fontFamily: 'NimbusSans'
      ),
      routes: {
        'home':(BuildContext context) => HomeView(),
        'login':(BuildContext context) => const LoginView(),
      },
    );
  }
}