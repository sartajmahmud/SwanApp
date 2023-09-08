import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swanapp/Models/Chalaan.dart';
import 'package:swanapp/Screens/ChalanHistoryScreen.dart';
import 'package:swanapp/Screens/ChalanInvoiceSelectionScreen.dart';
import 'package:swanapp/Screens/CreateOrderScreen.dart';
import 'package:swanapp/Screens/HomeScreen.dart';

import '../Repositories/AuthRepository.dart';
import 'OrderHistoryScreen.dart';

class ZoneBottomBar extends StatefulWidget {
  const ZoneBottomBar({Key? key}) : super(key: key);

  @override
  State<ZoneBottomBar> createState() => _ZoneBottomBarState();
}

class _ZoneBottomBarState extends State<ZoneBottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptionsFactory = <Widget>[
     HomeScreen(),
     OrderHistoryScreen(),
     CreateOrderScreen()
  ];
  void _onButtonTapped(int Index) {
    setState(() {
      _selectedIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Center(
        child: _widgetOptionsFactory[_selectedIndex],
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onButtonTapped,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[900],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_history_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_history_filled),
              label: "Order History"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_add_circle_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_add_circle_filled),
              label: "Create Order"),
        ],
      ),
    );
  }
}
