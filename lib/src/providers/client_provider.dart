import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mapas_tlati/src/models/cliente.dart';

class ClientPovider {
  late CollectionReference _ref;

  ClientPovider() {
    _ref = FirebaseFirestore.instance.collection('Clients');
  }

  Future<void> create(Client client) async {
    dynamic errorMessage;
    try {
      return _ref.doc(client.id).set(client.toJson());
    } catch (error) {
      errorMessage = error;
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
  }
}
