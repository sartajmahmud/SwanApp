
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Controllers/OrderController.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends StateMVC<OrderHistoryScreen> {

  late OrderController _con;

  _OrderHistoryScreenState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Container(
        child: Column(
          children: [
            IconButton(
                onPressed: (){
                _con.getInvoiceDoc(77);
            }, icon: Icon(Icons.print))
          ],
        ),
      ),
    );
  }
}
