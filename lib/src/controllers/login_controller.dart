import 'package:flutter/material.dart';
import 'package:mapas_tlati/src/providers/auth_provider.dart';
import 'package:mapas_tlati/src/utils/my_progress_dialog.dart';
import 'package:mapas_tlati/src/utils/shared_pref.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:progress_dialog/progress_dialog.dart';
import 'package:mapas_tlati/src/utils/snackbar.dart' as utils;

class LoginController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthProvider _authProvider;
  late ProgressDialog _progressDialog;
  late SharedPref _sharedPref;
  late String _typeUser;

  Future? init(BuildContext context) async{
    this.context = context;
    _authProvider = AuthProvider();
    _progressDialog = MyProgresDialog.createProgressDialog(context, 'Espera un momento...');
    _sharedPref = SharedPref();
    _typeUser = await _sharedPref.read('typeUser');
    print('********** TIPO DE USUARIO **********');
    print(_typeUser);
  }

  void goToRegisterView() {
    if (_typeUser == 'client') {
      Navigator.pushNamed(context!, 'client/register');
    }
    else {
      Navigator.pushNamed(context!, 'driver/register');
    }
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
        utils.Snackbar.showSnackbar(
            context!, key, 'El usuario ha iniciado sesión');
        Navigator.pushNamedAndRemoveUntil(context!, 'client/map', (route)=>false);
      } else {
        print('No se pudo iniciar la sesión');
        utils.Snackbar.showSnackbar(
            context!, key, 'No se pudo iniciar la sesión');
      }
    } catch (error) {
      utils.Snackbar.showSnackbar(context!, key, 'Error: $error');
      _progressDialog.hide();
      print('Error: $error');
    }
  }
}
