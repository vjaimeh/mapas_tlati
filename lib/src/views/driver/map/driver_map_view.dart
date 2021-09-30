import 'package:flutter/material.dart';

class DriverMapView extends StatefulWidget {
  const DriverMapView({Key? key}) : super(key: key);

  @override
  _DriverMapViewState createState() => _DriverMapViewState();
}

class _DriverMapViewState extends State<DriverMapView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Mapa del chofer'),
      ),
    );
  }
}
