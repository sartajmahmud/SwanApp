import 'package:flutter/material.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'package:swanapp/Widgets/HomeHistoryButtonWidget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () async {
              // logout();
              // Navigator.pushReplacementNamed(context, '/login');
              await getUserZones();
              var x = await Navigator.pushNamed(context, '/zones');
              if (x == true) {
                setState(() {});
              }
            },
            icon: Icon(Icons.location_on)),
        title: Center(child: Text('DashBoard')),
        actions: [
          IconButton(
              onPressed: () {
                logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                height: 40,
              ),
              if (currentUser.value.address_type == '0')
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    child: Text(
                      textAlign: TextAlign.center,
                      '${currentUser.value.currentZone} Zone ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87),
                    )),
              if (currentUser.value.address_type == '1')
                Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    child: Text(
                      textAlign: TextAlign.center,
                      '${currentUser.value.currentZone} Factory',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87),
                    )),
              const SizedBox(
                height: 20,
              ),
              if (currentUser.value.address_type == '0')
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/createOrder');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 8,
                              child: Center(
                                  child: Text(
                                'Create Order',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ))),
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.add_box_rounded,
                                color: Colors.green,
                                size: 35,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // if (currentUser.value.address_type == '0')
                  Expanded(
                      flex: 1,
                      child: HomeHistoryButtonWidget(
                          'Order History', Icons.shopping_cart_outlined)),
                  if (currentUser.value.address_type == '1')
                    Expanded(
                        flex: 1,
                        child: HomeHistoryButtonWidget(
                            'Chalaan History', Icons.inventory_outlined)),
                ],
              ),
              if (currentUser.value.address_type == '1')
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/selectChalaanInvoice');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 18,
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Create Chalaan',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.inventory_rounded,
                                  color: Colors.green,
                                  size: 35,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
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
