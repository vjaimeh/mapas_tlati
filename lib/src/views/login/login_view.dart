import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mapas_tlati/src/utils/colors.dart' as utils;

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _bannerApp(),
          _textDescription(),
          _textLogin(),
          Expanded(child: Container(),),
          _textFieldEmail(),
          _textFieldPassword(),
          _buttonLogin(),
          _textDontHaveAccount()
        ],
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return GestureDetector(
      /*onTap: _con.goToRegisterPage,*/
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: const Text(
          '¿No tienes cuenta?',
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ElevatedButton.icon(
        label: const Text('Iniciar sesión'),
        icon: const Icon(Icons.done),
        style: ElevatedButton.styleFrom(
          primary: utils.Colors.primaryColor,
        ),
        onPressed: (){},
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        /*controller: _con.emailController,*/
        decoration: const InputDecoration(
            hintText: 'correo@gmail.com',
            labelText: 'Correo electrónico:',
            prefixIcon: Icon(
              Icons.email_outlined,
              color: utils.Colors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        obscureText: true,
        /*controller: _con.passwordController,*/
        decoration: InputDecoration(
            labelText: 'Contraseña:',
            prefixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.Colors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: const Text(
        'Continua con tu',
        style: TextStyle(
            color: Colors.black54,
            fontSize: 24,
            fontFamily: 'NimbusSans'
        ),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: const Text(
        'Login',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28
        ),
      ),
    );
  }
  Widget _bannerApp() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height*.22,
        color: utils.Colors.primaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/img/logo_app.jpg',width: 180, height: 130),
            const Text('Tlati Digital', style: TextStyle(fontFamily: 'Pacifico', fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
