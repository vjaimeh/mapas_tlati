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

      return;
    }
    if (confirmpassword != password) {
      print('incorrecto ');

      return;
    }

    if (password.length <= 6) {
      print('debe ser mayor a 6 ');
      return;
    }

    try {
      bool isRegister = await _authProvider.register(email, password);
      if (isRegister) {
        print('el usuario se reistro ');
      } else {
        print('no se pudo');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
