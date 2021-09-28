import 'package:flutter/material.dart';
import 'package:mapas_tlati/src/providers/auth_provider.dart';

class RegisterController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  late AuthProvider _authProvider;

  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
  }

  void register() async {
    String email = emailController.text;
    String password = passwordController.text;

    print('correo: $email');
    print('contraseña: $password');

    try {
      bool isLogin = await _authProvider.login(email, password);
      if (isLogin) {
        print('el usuario esta logeado ');
      } else {
        print('no se pudo');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
