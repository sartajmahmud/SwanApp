
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Controllers/OrderController.dart';

class ChalanHistoryScreen extends StatefulWidget {
  const ChalanHistoryScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ChalanHistoryScreenState();
}

class _ChalanHistoryScreenState extends StateMVC<ChalanHistoryScreen> {

  late OrderController _con;

  _ChalanHistoryScreenState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chalaan History'),
      ),
    );
  }
}
