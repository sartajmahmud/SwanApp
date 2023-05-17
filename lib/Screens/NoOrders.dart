import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Controllers/AuthController.dart';
import '../Repositories/AuthRepository.dart';
import 'package:swanapp/loading.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'dart:io';

class NoOrdersScreen extends StatefulWidget {
  const NoOrdersScreen({Key? key}) : super(key: key);

  @override
  State createState() => _NoOrdersScreenState();
}

class _NoOrdersScreenState extends StateMVC<NoOrdersScreen> {
  late AuthController _con;

  _NoOrdersScreenState() : super(AuthController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as AuthController;
  }
  @override
  String email = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return
        // loading
        //   ? Loading()
        //   :
        Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey.shade100,
                    child: SafeArea(
                        child: Container(
                      margin: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding:
                            // EdgeInsets.symmetric(vertical: 250, horizontal: 20),
                            EdgeInsets.all(100),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20.0,
                                    offset: Offset(
                                      0.0,
                                      0.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: Image.asset('assets/logo.png'),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () async {
                                // setState(() => loading = true);
                                bool response =
                                    await _con.login(email, password);
                                if (response) {
                                  await getUserZones();
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                } else {
                                  // setState(() => loading = false);

                                  SnackBar snackBar = SnackBar(
                                    content: const Text('Unauthorised'),
                                    backgroundColor: (Colors.red),
                                    action: SnackBarAction(
                                      label: 'dismiss',
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              minWidth: 220,
                              height: 35,
                              color: Colors.red,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "Home",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )))));
  }
}
