import 'package:flutter/material.dart';
import 'package:mapas_tlati/src/providers/auth_provider.dart';
import 'package:mapas_tlati/src/utils/my_progress_dialog.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:progress_dialog/progress_dialog.dart';
import 'package:mapas_tlati/src/utils/snackbar.dart' as utils;
// @dart=2.9

class LoginController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthProvider _authProvider;
  late ProgressDialog _progressDialog;

  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _progressDialog =
        MyProgresDialog.createProgressDialog(context, 'Espere un momento..');
  }

  void goToRegisterView() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;

    print('correo: $email');
    print('contraseña: $password');
    _progressDialog.show();

    try {
      bool isLogin = await _authProvider.login(email, password);
      _progressDialog.hide();
      if (isLogin) {
        print('El usuario ha iniciado sesión');
        utils.Snackbar.showSnackbar(context!, key, 'El usuario ha iniciado sesión');
      } else {
        print('No se pudo iniciar la sesión');
        utils.Snackbar.showSnackbar(context!, key, 'No se pudo iniciar la sesión');
      }
    } catch (error) {
      utils.Snackbar.showSnackbar(context!, key, 'Error: $error');
      _progressDialog.hide();
      print('Error: $error');
    }
  }
}
