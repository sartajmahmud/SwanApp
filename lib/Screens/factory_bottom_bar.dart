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

class FactoryBottomBar extends StatefulWidget {
  const FactoryBottomBar({Key? key}) : super(key: key);

  @override
  State<FactoryBottomBar> createState() => _FactoryBottomBarState();
}

class _FactoryBottomBarState extends State<FactoryBottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptionsFactory = <Widget>[
    const HomeScreen(),
    const OrderHistoryScreen(),
    const ChalanHistoryScreen(),
    const ChalanInvoiceSelectionScreen(),
    // const CreateOrderScreen()
  ];
  void _onButtonTapped(int Index) {
    setState(() {
      _selectedIndex = Index;
      print(Index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("My Tickets"),
      // ),
      body: Center(
        child: _widgetOptionsFactory[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onButtonTapped,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.red.shade50,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_history_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_history_filled),
              label: "Order History"),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_app_store_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_app_store_filled),
            label: "Chalaan History",
          ),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_add_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_add_filled),
              label: "Create Chalaan "),
          // if (currentUser.value.address_type == '0')
          //            BottomNavigationBarItem(
          //     icon: Icon(FluentSystemIcons.ic_fluent_add_circle_regular),
          //     activeIcon: Icon(FluentSystemIcons.ic_fluent_add_circle_filled),
          //     label: "Create Order"),
        ],
      ),
    );
  }
}
