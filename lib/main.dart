import 'package:flutter/material.dart';
import 'package:swanapp/Screens/factory_bottom_bar.dart';
import 'Screens/ZoneSelectionScreen.dart';
import 'Screens/ChalanHistoryScreen.dart';
import 'Screens/ChalanInvoiceSelectionScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/OrderHistoryScreen.dart';
import 'Screens/CreateOrderScreen.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/NoOrders.dart';
import 'Screens/zone_bottom_bar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
      '/FactoryBottombar': (context) => const FactoryBottomBar(),
      '/ZoneBottombar': (context) => const ZoneBottomBar(),
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
