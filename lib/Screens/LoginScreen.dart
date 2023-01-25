import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Controllers/AuthController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  late AuthController _con;

  _LoginScreenState() : super(AuthController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as AuthController;
  }

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade100,
                child: SafeArea(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 35),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Image.asset('assets/logo.jpeg'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Enter your Mobile No.',
                              ),
                              onChanged: (String email){
                                this.email = email;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Enter your password*',
                              ),
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              onPressed: () async {
                                bool response = await _con.login(email, password);
                                if (response) {
                                  Navigator.pushNamed(context, '/home');
                                } else {
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
                              height: 30,
                              color: Colors.red,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "LOG IN",
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

