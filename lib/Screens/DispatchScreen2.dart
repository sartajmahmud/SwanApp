import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/OrderHistory.dart';
import '../Controllers/OrderController.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'package:swanapp/loading.dart';

class DispatchScreen2 extends StatefulWidget {
  OrderHistory oh;
  DispatchScreen2(this.oh);

  @override
  State createState() => _DispatchScreen2State();
}

class _DispatchScreen2State extends StateMVC<DispatchScreen2> {
  late OrderController _con;

  _DispatchScreen2State() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getUniqueOrderData(int.parse(widget.oh.order_id));
    _con.getOrderData(int.parse(widget.oh.order_id));
  }

  @override
  Widget build(BuildContext context) {
    return _con.loading
        ? Loading()
        : Scaffold(
            // backgroundColor: Colors.redAccent,
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text('${currentUser.value.currentZone}  Dispatch'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _con.orderProducts.length >= 1
                    ? Container(
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
                                  color: Colors.amber,
                                  child: Container(
                                    // height: MediaQuery.of(context).size.height*0.13,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].id.toString()}",
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
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  color: Colors.amberAccent,
                                  child: Container(
                                    // height: MediaQuery.of(context).size.height*0.13,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                color: Color(0xff525252)
                                                    .withOpacity(.75),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "Contact: "
                                            "${widget.oh.customer_mobile}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xff525252)
                                                    .withOpacity(.75),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "Address: "
                                            "${widget.oh.customer_address}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xff525252)
                                                    .withOpacity(.75),
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
                                  color: Colors.amberAccent,
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
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child: const Icon(
                                                          Icons.card_giftcard,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                      Text(
                                                        // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                        "Product ${index + 1} : ",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color: Color(
                                                                    0xff525252)
                                                                .withOpacity(
                                                                    .75),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
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
                                                        "Delivered: ${int.parse(_con.orderProducts[index].qty) - int.parse(_con.orderProducts[index].qty_remains)}",
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .deepOrangeAccent,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(width: 10),
                                                      const Icon(
                                                        Icons.waving_hand,
                                                        color: Colors.indigo,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                        "Remains: ${_con.orderProducts[index].qty_remains}",
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .deepOrangeAccent,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              //
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 32.5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                      "${_con.orderProducts[index].description}",
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                      "BDT ${_con.orderProducts[index].product_amount}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .redAccent
                                                              .withOpacity(.8),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    _con.orderProducts[index]
                                                                .dimension !=
                                                            ''
                                                        ? Text(
                                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                            "Dimension : ${_con.orderProducts[index].dimension} ${_con.orderProducts[index].unit}",
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          )
                                                        : Container(),
                                                    _con.orderProducts[index]
                                                                .qty !=
                                                            ''
                                                        ? Text(
                                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                            "x ${_con.orderProducts[index].qty}",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Color(
                                                                        0xff525252)
                                                                    .withOpacity(
                                                                        .75),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
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
                                Card(
                                  elevation: 20,
                                  shadowColor: Colors.black,
                                  color: Colors.amberAccent,
                                  child: Container(
                                    // height: MediaQuery.of(context).size.height*0.13,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  // "Order ID : ${_con.orderHistory[index].id.toString()}",
                                                  "Subtotal",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xff525252)
                                                          .withOpacity(.75),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                  "BDT",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xff525252)
                                                          .withOpacity(.75),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  // "Order ID : ${_con.orderHistory[index].id.toString()}",
                                                  "Discount",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xff525252)
                                                          .withOpacity(.75),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                  "- BDT ${widget.oh.discount}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xff525252)
                                                          .withOpacity(.75),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                              thickness: 2,
                                              color: Colors.black87
                                                  .withOpacity(.2)),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  // "Order ID : ${_con.orderHistory[index].id.toString()}",
                                                  "Total",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xff525252)
                                                          .withOpacity(.75),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                  "BDT ${widget.oh.total_amount}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xff525252)
                                                          .withOpacity(.75),
                                                      fontWeight:
                                                          FontWeight.w700),
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
                      )
                    : Center(
                        child: Text(
                        'No Product Left For Dispatch',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ))),
          );
  }
}
