import 'package:flutter/material.dart';
import 'package:mapas_tlati/src/utils/shared_pref.dart';

class HomeController {

  BuildContext? context;
  late SharedPref _sharedPref;

  Future? init(BuildContext context) {
    this.context = context;
    _sharedPref = SharedPref();

  }

  void goToLoginView(String typeUser){
    saveTypeUserClient(typeUser);
    Navigator.pushNamed(context!, 'login');
  }

  void saveTypeUserClient(String typeUser) async {
    _sharedPref.save('typeUser', typeUser);
  }

}