import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Controllers/OrderController.dart';

class OrderHistoryDetails extends StatefulWidget {
  const OrderHistoryDetails({Key? key}) : super(key: key);

  @override
  State createState() => _OrderHistoryDetailsState();
}

class _OrderHistoryDetailsState extends StateMVC<OrderHistoryDetails> {
  late OrderController _con;

  _OrderHistoryDetailsState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getOrderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Container(
        child: Center(
          child: Card(
            child:Column(
              children: [
                Text(
                  // "Order ID : ${_con.orderHistory[index].id.toString()}",
                  "Order ID : ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                  "Customer Name : ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
