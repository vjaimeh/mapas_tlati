import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mapas_tlati/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);

   final HomeController _con = HomeController();

  @override
  Widget build(BuildContext context) {
    _con.init(context); //Inicializando el controlador
    return Scaffold(
      body:  SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color.fromRGBO(36, 25, 55, .3), Color.fromRGBO(36, 25, 55, 1)]
            ),
          ),
          child: Column(
            children: [
              _bannerApp(context),
              const SizedBox(height: 50),
              _textSelectYourRol(),
              const SizedBox(height: 30),
              _imageTypeUser(context,'assets/img/pasajero.png'),
              const SizedBox(height: 10),
              _textTypeUser('Cliente'),
              const SizedBox(height: 30),
              _imageTypeUser(context,'assets/img/driver.png'),
              const SizedBox(height: 10),
              _textTypeUser('Conductor')
            ],
          ),
        ),
      ),
    );
  }

   Widget _bannerApp(BuildContext context) {
     return ClipPath(
       clipper: WaveClipperOne(),
       child: Container(
         height: MediaQuery.of(context).size.height*.3,
         color: Colors.white,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Image.asset('assets/img/logo_app.jpg',width: 180, height: 130),
             const Text('Tlati Digital', style: TextStyle(fontFamily: 'Pacifico', fontSize: 22, fontWeight: FontWeight.bold))
           ],
         ),
       ),
     );
   }

   Widget _textSelectYourRol() {
     return const Text(
       'SELECCIONA TU ROL', style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'OneDay'));
   }

  Widget _imageTypeUser(BuildContext context, String typeImage){
    return GestureDetector(onTap: _con.goToLoginView, child: CircleAvatar(backgroundImage: AssetImage(typeImage),radius: 50,backgroundColor: const Color.fromRGBO(36, 25, 55, 1)));
  }

  Widget _textTypeUser(String typeUser){
    return Text(typeUser, style: const TextStyle(color: Colors.white, fontSize: 16));
  }

}
