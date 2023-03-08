import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Controllers/AuthController.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'dart:io';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  late AuthController _con;
  _SplashScreenState() : super(AuthController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as AuthController;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = _source.values.toList()[0]
              ? 'Device / Server Online'
              : 'Device / Server Offline';
          break;
        case ConnectivityResult.wifi:
          string = _source.values.toList()[0]
              ? 'Device / Server Online'
              : 'Device / Server Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'Device / Server Offline';
      }
      // 2.
      setState(() {});
      // 3.
      if (string == 'Device / Server Online')
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: (Colors.green),
            content: Text(
              string,
              style: TextStyle(fontSize: 10),
            ),
          ),
        );
      _con.getUser(context);
      if (string == 'Device / Server Offline')
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: (Colors.red),
            content: Text(
              string,
              style: TextStyle(fontSize: 10),
            ),
          ),
        );
    });
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

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}

class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      print(result);
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('pos.swan-family.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
