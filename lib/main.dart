import 'package:flutter/material.dart';
import 'package:swanapp/Screens/ChalanHistoryScreen.dart';
import 'package:swanapp/Screens/HomeScreen.dart';
import 'package:swanapp/Screens/LoginScreen.dart';
import 'package:swanapp/Screens/OrderHistoryScreen.dart';

import 'Screens/CreateOrderScreen.dart';
import 'Screens/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
      '/login' : (context) => const LoginScreen(),
      '/home' : (context) => const HomeScreen(),
      '/chalanHistory' : (context) => const ChalanHistoryScreen(),
      '/orderHistory' : (context) => const OrderHistoryScreen(),
      '/createOrder' : (context) => const CreateOrderScreen(),
    },
    initialRoute: '/createOrder',
  ));
}

