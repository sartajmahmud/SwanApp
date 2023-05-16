import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/OrderHistory.dart';
import '../Controllers/OrderController.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'package:swanapp/loading.dart';

class DispatchScreen extends StatefulWidget {
  OrderHistory oh;
  DispatchScreen(this.oh);

  @override
  State createState() => _DispatchScreenState();
}

class _DispatchScreenState extends StateMVC<DispatchScreen> {
  late OrderController _con;

  _DispatchScreenState() : super(OrderController()) {
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
              title: Text(
                '${currentUser.value.currentZone} Dispatch Section',
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
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
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Items for Dispatch : ",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: _con.orderProducts
                                                .length, //_con.orderHistory.length,
                                            itemBuilder: (_, index) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${index + 1} ) ${_con.orderProducts[index].description}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87),
                                                  ),
                                                  SizedBox(width: 10),
                                                  const Icon(
                                                    Icons
                                                        .production_quantity_limits_rounded,
                                                    color: Colors.indigo,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    'Total Ordered: ${_con.orderProducts[index].qty}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87),
                                                  ),
                                                  SizedBox(width: 15),
                                                  const Icon(
                                                    Icons
                                                        .delivery_dining_rounded,
                                                    color: Colors.indigo,
                                                    size: 25,
                                                  ),
                                                  Text(
                                                    'Delivery Remains: ${_con.orderProducts[index].qty_remains}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87),
                                                  ),
                                                  Expanded(
                                                      flex: 8,
                                                      child: Center(
                                                        child: SizedBox(
                                                          width: 100,
                                                          height: 30,
                                                          child: TextField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            onChanged: (String
                                                                password) {
                                                              if (int.parse(
                                                                      password) <=
                                                                  int.parse(_con
                                                                      .orderProducts[
                                                                          index]
                                                                      .qty)) {
                                                                _con.dp.dispatchItems[
                                                                            index]
                                                                        [1] =
                                                                    int.parse(
                                                                        password);
                                                              } else {
                                                                var snackBar =
                                                                    SnackBar(
                                                                  content: Text(
                                                                    'QTY Can\'t be more than Total Qty \"${_con.orderProducts[index].qty}\"',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackBar);
                                                              }
                                                              if (int.parse(
                                                                      password) <=
                                                                  int.parse(_con
                                                                      .orderProducts[
                                                                          index]
                                                                      .qty_remains)) {
                                                                _con.dp.dispatchItems[
                                                                            index]
                                                                        [1] =
                                                                    int.parse(
                                                                        password);
                                                              } else {
                                                                var snackBar =
                                                                    SnackBar(
                                                                  content: Text(
                                                                    'Dipatch QTY Can\'t be more than Qty Remains \"${_con.orderProducts[index].qty_remains}\"',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackBar);
                                                              }
                                                              if (int.parse(
                                                                      password) ==
                                                                  0) {
                                                                var snackBar =
                                                                    SnackBar(
                                                                  content: Text(
                                                                    'Dispatch QTY Can\'t be "0"',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                );
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackBar);
                                                              }
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: 'QTY',
                                                              labelStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'PlayfairDisplay',
                                                                  color: Colors
                                                                      .black54),
                                                              focusColor:
                                                                  Colors.black,
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              13)),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              13)),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: InkWell(
                                      onTap: () async {
                                        // await _con.submitOrder(context);
                                        await _con.dispatch();

                                        Navigator.pushReplacementNamed(
                                            context, '/chalanHistory');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 20.0,
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                  flex: 8,
                                                  child: Center(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'Dispatch',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: () async {
                                  //     // await _con.submitOrder(context);
                                  //     await _con.dispatch();
                                  //
                                  //     Navigator.pushReplacementNamed(
                                  //         context, '/chalanHistory');
                                  //   },
                                  //   child: Container(
                                  //     margin: const EdgeInsets.symmetric(
                                  //         vertical: 10, horizontal: 110),
                                  //     width: 180,
                                  //     decoration: const BoxDecoration(
                                  //       color: Colors.green,
                                  //       borderRadius: BorderRadius.all(
                                  //           Radius.circular(10)),
                                  //       boxShadow: const [
                                  //         BoxShadow(
                                  //           color: Colors.grey,
                                  //           blurRadius: 5.0,
                                  //           offset: Offset(
                                  //             0.0,
                                  //             0.0,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     child: const Padding(
                                  //       padding: EdgeInsets.all(10),
                                  //       child: Center(
                                  //           child: Text(
                                  //         'Confirm Dispatch',
                                  //         style: TextStyle(
                                  //             color: Colors.white,
                                  //             fontSize: 18,
                                  //             fontWeight: FontWeight.w500),
                                  //       )),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            )),
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
