import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/OrderHistory.dart';
import 'package:swanapp/Screens/OrderChalaanHitory.dart';

import '../Controllers/OrderController.dart';
import 'package:swanapp/loading.dart';

class OrderHistoryDetails2 extends StatefulWidget {
  late OrderHistory oh;
  OrderHistoryDetails2(this.oh);

  @override
  State createState() => _OrderHistoryDetails2State();
}

class _OrderHistoryDetails2State extends StateMVC<OrderHistoryDetails2> {
  late OrderController _con;

  _OrderHistoryDetails2State() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  @override
  void initState() {
    super.initState();
    _con.getOrderData(int.parse(widget.oh.order_id));
    _con.getOrderHistory('');
  }

  double subtotal = 0;

  double calcSubtotal() {
    subtotal =
        double.parse(widget.oh.discount) + double.parse(widget.oh.total_amount);
    print("INVOICE ID SELECTED IS: ${widget.oh.invoice_id}");
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: const Text(
            'ORDER DETAILS',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await _con.getOrderData(int.parse(widget.oh.order_id));

                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: _con.orderProducts.length < 1
          ? Loading()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        // color: Colors.amber,
                        child: Container(
                          // height: MediaQuery.of(context).size.height*0.13,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Invoice ID #${widget.oh.invoice_id}",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                                      "Placed on ${widget.oh.created_at}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff525252)
                                              .withOpacity(.90),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    await _con
                                        .getOrderChalan(widget.oh.invoice_id);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            OrderChalaanHistory(
                                          con: _con,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      primary: Colors.indigo[300]),
                                  icon: Icon(Icons
                                      .check_circle), //icon data for elevated button
                                  label: Text("View Chalaans"), //label text
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        // color: Colors.amberAccent,
                        child: Container(
                          // height: MediaQuery.of(context).size.height*0.13,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer Details : ",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                  "Name: "
                                  "${widget.oh.customer_name}",
                                  style: TextStyle(
                                      // color: Color(0xff525252),
                                      fontSize: 18,
                                      color: Color(0xff525252).withOpacity(.75),
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                  "Contact: "
                                  "${widget.oh.customer_mobile}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff525252).withOpacity(.75),
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                  "Address: "
                                  "${widget.oh.customer_address}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff525252).withOpacity(.75),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        // color: Colors.amberAccent,
                        child: Container(
                          // height: MediaQuery.of(context).size.height*0.13,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              shrinkWrap: true,
                              itemCount: _con.orderProducts
                                  .length, //_con.orderHistory.length,
                              itemBuilder: (_, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: const Icon(
                                                Icons.card_giftcard,
                                                color: Colors.green,
                                              ),
                                            ),
                                            // Text(
                                            //   // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            //   "Product ${index + 1} : ",
                                            //   style: TextStyle(
                                            //       fontSize: 17,
                                            //       color: Color(0xff525252)
                                            //           .withOpacity(.75),
                                            //       fontWeight: FontWeight.w500),
                                            // ),
                                            Text(
                                              // "Order ID : ${_con.orderHistory[index].customer_name}",
                                              "${_con.orderProducts[index].description}",
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        if (_con.orderProducts[index]
                                            .qty_remains.isNotEmpty)
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.local_shipping,
                                                color: Colors.indigo,
                                                size: 15,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Delivered: ${int.parse(_con.orderProducts[index].qty) - int.parse(_con.orderProducts[index].qty_remains)}",
                                                style: const TextStyle(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(width: 10),
                                              const Icon(
                                                Icons.waving_hand,
                                                color: Colors.indigo,
                                                size: 15,
                                              ),
                                              Text(
                                                // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                "Pending: ${_con.orderProducts[index].qty_remains}",
                                                style: const TextStyle(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        else
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.local_shipping,
                                                color: Colors.indigo,
                                                size: 15,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                // "Delivered: ${int.parse(_con.orderProducts[index].qty) - int.parse(_con.orderProducts[index].qty_remains)}",
                                                // "Oredered: ${_con.orderProducts[index].qty}",
                                                "Delivery Pending",
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                    //
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 32.5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   // "Order ID : ${_con.orderHistory[index].customer_name}",
                                          //   "${_con.orderProducts[index].description}",
                                          //   style: const TextStyle(
                                          //       fontSize: 17,
                                          //       fontWeight: FontWeight.w500),
                                          // ),
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "BDT ${_con.orderProducts[index].product_amount}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.redAccent
                                                    .withOpacity(.8),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          _con.orderProducts[index].dimension !=
                                                  ''
                                              ? Text(
                                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                  "Dimension : ${_con.orderProducts[index].dimension} ${_con.orderProducts[index].unit}",
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              : Container(),
                                          _con.orderProducts[index].qty != ''
                                              ? Text(
                                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                  "x ${_con.orderProducts[index].qty}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xff525252)
                                                          .withOpacity(.75),
                                                      fontWeight:
                                                          FontWeight.w400),
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
                        ),
                      ),
                      // Card(
                      //   elevation: 0,
                      //   shadowColor: Colors.black,
                      //   color: Colors.white70,
                      //   child: Container(
                      //     // height: MediaQuery.of(context).size.height*0.13,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             // "Order ID : ${_con.orderHistory[index].id.toString()}",
                      //             "Invoice ID #${widget.oh.invoice_id}",
                      //             style: TextStyle(
                      //                 color: Colors.teal,
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.w500),
                      //           ),
                      //           Text(
                      //             // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //             "Placed on ${widget.oh.created_at}",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 color: Color(0xff525252).withOpacity(.75),
                      //                 fontWeight: FontWeight.w400),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Card(
                        elevation: 20,
                        shadowColor: Colors.black,
                        // color: Colors.amberAccent,
                        child: Container(
                          // height: MediaQuery.of(context).size.height*0.13,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        // "Order ID : ${_con.orderHistory[index].id.toString()}",
                                        "Subtotal",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff525252)
                                                .withOpacity(.75),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        // "Order ID : ${_con.orderHistory[index].customer_name}",
                                        "BDT ${calcSubtotal()}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff525252)
                                                .withOpacity(.75),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        // "Order ID : ${_con.orderHistory[index].id.toString()}",
                                        "Discount",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff525252)
                                                .withOpacity(.75),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        // "Order ID : ${_con.orderHistory[index].customer_name}",
                                        "- BDT ${widget.oh.discount}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff525252)
                                                .withOpacity(.75),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                    thickness: 2,
                                    color: Colors.black87.withOpacity(.2)),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        // "Order ID : ${_con.orderHistory[index].id.toString()}",
                                        "Total",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff525252)
                                                .withOpacity(.75),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        // "Order ID : ${_con.orderHistory[index].customer_name}",
                                        "BDT ${widget.oh.total_amount}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff525252)
                                                .withOpacity(.75),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
