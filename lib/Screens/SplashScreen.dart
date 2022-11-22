
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Controllers/AuthController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  late AuthController _con;


  _SplashScreenState() : super(AuthController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as AuthController;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getUser(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset('assets/logo.jpeg'),
      ),
    );
  }
}
