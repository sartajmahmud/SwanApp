import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/OrderHistory.dart';

import '../Controllers/OrderController.dart';

class OrderHistoryDetails extends StatefulWidget {
  late OrderHistory oh;
  OrderHistoryDetails(this.oh) ;

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
    // _con.getOrderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Order Details'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.numbers,color: Colors.green,),
                    Text(
                      // "Order ID : ${_con.orderHistory[index].id.toString()}",
                      "Order ID : ${widget.oh.id}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.perm_identity,color: Colors.green,),
                    Text(
                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                      "Customer Name : ${widget.oh.customer_name}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.green,),
                    Text(
                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                      "Customer Address : ${widget.oh.customer_address}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.phone,color: Colors.green,),
                    Text(
                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                      "Customer Mobile : ${widget.oh.customer_mobile}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.discount_outlined,color: Colors.green,),
                    Text(
                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                      "Discount Percentage : ${widget.oh.discount}%",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.monetization_on_rounded,color: Colors.green,),
                    Text(
                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                      "Total Bill Amount : ${widget.oh.total_amount}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
