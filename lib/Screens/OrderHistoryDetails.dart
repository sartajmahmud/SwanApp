import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/OrderHistory.dart';

import '../Controllers/OrderController.dart';

class OrderHistoryDetails extends StatefulWidget {
  late OrderHistory oh;
  OrderHistoryDetails(this.oh);

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
    _con.getOrderData(int.parse(widget.oh.order_id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Order Details'),
      ),
      body: _con.orderProducts.length < 1
          ? const CircularProgressIndicator()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:10,bottom:25),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.numbers,
                              color: Colors.green,
                            ),
                          ),
                          const Text(
                            // "Order ID : ${_con.orderHistory[index].id.toString()}",
                            "Invoice ID : ",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].id.toString()}",
                            "${widget.oh.invoice_id}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.perm_identity,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "Customer Name : ",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "${widget.oh.customer_name}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:10),
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "Customer Address : ",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "${widget.oh.customer_address}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:10),
                            child: const Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "Customer Mobile : ",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "${widget.oh.customer_mobile}",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:25),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            _con.orderProducts.length, //_con.orderHistory.length,
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: const Icon(
                                      Icons.card_giftcard,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    // "Order ID : ${_con.orderHistory[index].customer_name}",
                                    "Product ${index + 1} : ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    // "Order ID : ${_con.orderHistory[index].customer_name}",
                                    "${_con.orderProducts[index].description}",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              //

                              Padding(
                                padding: const EdgeInsets.only(left: 32.5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _con.orderProducts[index].dimension != ''
                                        ? Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "Dimension : ${_con.orderProducts[index].dimension} ${_con.orderProducts[index].unit}",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Container(),
                                    _con.orderProducts[index].qty != ''
                                        ? Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "Quantity : ${_con.orderProducts[index].qty} pcs",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Container(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: 10),
                            child:  Icon(
                              Icons.discount_outlined,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "Discount Amount : ",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "${widget.oh.discount} BDT",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: 10),
                            child:  Icon(
                              Icons.monetization_on_rounded,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "Total Bill Amount : ",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "${widget.oh.total_amount} BDT",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
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
