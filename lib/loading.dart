import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 200, horizontal: 35),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/logo.png'),
                  ),
                  Center(
                      child: SpinKitCircle(
                    color: Colors.red,
                    size: 50.0,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please Wait While Connecting to Server',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
