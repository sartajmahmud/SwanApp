import 'package:flutter/material.dart';
import 'Screens/ZoneSelectionScreen.dart';
import 'Screens/ChalanHistoryScreen.dart';
import 'Screens/ChalanInvoiceSelectionScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/OrderHistoryScreen.dart';
import 'Screens/CreateOrderScreen.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/NoOrders.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
      '/login': (context) => const LoginScreen(),
      '/home': (context) => const HomeScreen(),
      '/chalanHistory': (context) => const ChalanHistoryScreen(),
      '/orderHistory': (context) => const OrderHistoryScreen(),
      '/createOrder': (context) => const CreateOrderScreen(),
      '/zones': (context) => const ZoneSelectionScreen(),
      '/selectChalaanInvoice': (context) =>
          const ChalanInvoiceSelectionScreen(),
      // '/OrderDetails' : (context) => const OrderHistoryDetails(),
    },
    initialRoute: '/',
  ));
}
