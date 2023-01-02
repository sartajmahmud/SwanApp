
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getOrderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 4, //_con.orderHistory.length,
        itemBuilder: (_, index) => InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/OrderDetails');
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "idx${index}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  // "Order ID : ${_con.orderHistory[index].total_amount}",
                  "Total Amount : ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
