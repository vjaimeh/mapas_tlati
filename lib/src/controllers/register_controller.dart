import 'package:flutter/material.dart';
import 'package:mapas_tlati/src/models/cliente.dart';
import 'package:mapas_tlati/src/providers/auth_provider.dart';
import 'package:mapas_tlati/src/providers/client_provider.dart';
import 'package:mapas_tlati/src/utils/my_progress_dialog.dart';
import 'package:mapas_tlati/src/utils/snackbar.dart' as utils;
// ignore: import_of_legacy_library_into_null_safe
import 'package:progress_dialog/progress_dialog.dart';

class RegisterController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  late AuthProvider _authProvider;
  late ClientPovider _clientPovider;
  late ProgressDialog _progressDialog;

  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _clientPovider = ClientPovider();
    _progressDialog =
        MyProgresDialog.createProgressDialog(context, 'Espere un momento..');
  }

  void register() async {
    String username = usernameController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmpassword = confirmpasswordController.text.trim();

    print('correo: $email');
    print('contraseña: $password');
    print('username : $username');
    print('confirmcontraseña: $confirmpassword');

    if (username.isEmpty &&
        email.isEmpty &&
        password.isEmpty &&
        confirmpassword.isEmpty) {
      print('debe tener todos los campos  ');
      utils.Snackbar.showSnackbar(
          context!, key, 'debes ingresar todos los datos ');

      return;
    }
    if (confirmpassword != password) {
      print('incorrecto ');
      utils.Snackbar.showSnackbar(
          context!, key, 'debes ser igual a la contraseña');

      return;
    }

    if (password.length <= 6) {
      print('debe ser mayor a 6 ');
      utils.Snackbar.showSnackbar(
          context!, key, 'debes ingresar una contraseña mayor a 6 ');

      return;
    }
    _progressDialog.show();
    try {
      bool isRegister = await _authProvider.register(email, password);
      if (isRegister) {
        Client client = Client(
            id: _authProvider.getUser()!.uid,
            email: _authProvider.getUser()!.uid,
            username: username,
            password: password);

        await _clientPovider.create(client);
        _progressDialog.hide();
        print('el usuario se reistro ');
      } else {
        _progressDialog.hide();
        print('no se pudo');
      }
    } catch (error) {
      _progressDialog.hide();
      utils.Snackbar.showSnackbar(context!, key, 'Error: $error');
      print('Error: $error');
    }
  }
}
