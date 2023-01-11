
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
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(7, 80, 0, 7),
                        child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage("assets/logo.jpeg"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 45,
                            child: TextField(
                              cursorColor: Colors.black54,
                              onChanged: (String email){
                                this.email = email;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.black,
                                labelText: 'E-mail',
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 45,
                            child: TextField(
                              cursorColor: Colors.black54,
                              onChanged: (String password){
                                this.password = password;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.black,
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          bool response = await _con.login(email, password);

                          if (response){
                            Navigator.pushNamed(context, '/home');
                          }else{
                            SnackBar snackBar = SnackBar(
                              content: const Text('Unauthorised'),
                              backgroundColor: (Colors.black12),
                              action: SnackBarAction(
                                label: 'dismiss',
                                onPressed: () {

                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width*.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green
                          ),
                          child: Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 22.5,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ),
        ),
      )
        ,
    );
  }
}
