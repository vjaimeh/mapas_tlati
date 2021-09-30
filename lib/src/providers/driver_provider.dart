import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mapas_tlati/src/models/driver.dart';

class DriverPovider {
  late CollectionReference _ref;

  DriverPovider() {
    _ref = FirebaseFirestore.instance.collection('Drivers');
  }

  Future<void> create(Driver driver) async {
    dynamic errorMessage;
    try {
      return _ref.doc(driver.id).set(driver.toJson());
    } catch (error) {
      errorMessage = error;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
  }
}
