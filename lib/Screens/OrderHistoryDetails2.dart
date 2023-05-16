import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/OrderHistory.dart';

import '../Controllers/OrderController.dart';

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
    // TODO: implement initState
    super.initState();
    _con.getOrderData(int.parse(widget.oh.order_id));
    // subtotal+=int.parse(_con.orderProducts[index].product_amount);
  }
  double subtotal = 0;

  double calcSubtotal() {
    subtotal=double.parse(widget.oh.discount)+double.parse(widget.oh.total_amount);
    // subtotal+=int.parse(_con.orderProducts[index].product_amount);
    // for (int index = 0; index >= _con.orderProducts.length; index++) {
    //   subtotal += int.parse(_con.orderProducts[index].product_amount);
    // }
    print(subtotal);
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE5E6),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Order Details'),
        actions: [
          IconButton(onPressed:() async {
            await _con.getOrderData(int.parse(widget.oh.order_id));
            setState(() {});
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: _con.orderProducts.length < 1
          ? const CircularProgressIndicator()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 0,
                        shadowColor: Colors.black,
                        color: Colors.white70,
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
                                      color: Colors.teal.withOpacity(.8),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                  widget.oh.customer_name,
                                  style: TextStyle(
                                      // color: Color(0xff525252),
                                      fontSize: 18,
                                      color: Color(0xff525252).withOpacity(.75),
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
                                  "${widget.oh.customer_mobile}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff525252).withOpacity(.75),
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  // "Order ID : ${_con.orderHistory[index].customer_name}",
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
                        elevation: 0,
                        shadowColor: Colors.black,
                        color: Colors.white70,
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
                                            Text(
                                              // "Order ID : ${_con.orderHistory[index].customer_name}",
                                              "Product ${index + 1} : ",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xff525252)
                                                      .withOpacity(.75),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 15,
                                            ),
                                            Text(
                                              // "Order ID : ${_con.orderHistory[index].customer_name}",
                                              "Deliverd",
                                              style: const TextStyle(
                                                  color: Colors.lightGreen,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
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
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "${_con.orderProducts[index].description}",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
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
                      Card(
                        elevation: 0,
                        shadowColor: Colors.black,
                        color: Colors.white70,
                        child: Container(
                          // height: MediaQuery.of(context).size.height*0.13,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      color: Color(0xff525252).withOpacity(.75),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        shadowColor: Colors.black,
                        color: Colors.white70,
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
                                    color: Colors.teal.withOpacity(.2)),
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
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10, bottom: 25),
                      //   child: Row(
                      //     children: [
                      //       const Padding(
                      //         padding: EdgeInsets.only(right: 10),
                      //         child: Icon(
                      //           Icons.numbers,
                      //           color: Colors.green,
                      //         ),
                      //       ),
                      //       const Text(
                      //         // "Order ID : ${_con.orderHistory[index].id.toString()}",
                      //         "Invoice ID : ",
                      //         style: TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w600),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].id.toString()}",
                      //         "${widget.oh.invoice_id}",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 6),
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(right: 10),
                      //         child: const Icon(
                      //           Icons.perm_identity,
                      //           color: Colors.green,
                      //         ),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "Customer Name : ",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w600),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "${widget.oh.customer_name}",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 6),
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(right: 10),
                      //         child: const Icon(
                      //           Icons.location_on_outlined,
                      //           color: Colors.green,
                      //         ),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "Customer Address : ",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w600),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "${widget.oh.customer_address}",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 6),
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(right: 10),
                      //         child: const Icon(
                      //           Icons.phone,
                      //           color: Colors.green,
                      //         ),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "Customer Mobile : ",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w600),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "${widget.oh.customer_mobile}",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 25),
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: _con
                      //         .orderProducts.length, //_con.orderHistory.length,
                      //     itemBuilder: (_, index) => Padding(
                      //       padding: const EdgeInsets.symmetric(vertical: 6),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             children: [
                      //               Padding(
                      //                 padding: const EdgeInsets.only(right: 10),
                      //                 child: const Icon(
                      //                   Icons.card_giftcard,
                      //                   color: Colors.green,
                      //                 ),
                      //               ),
                      //               Text(
                      //                 // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //                 "Product ${index + 1} : ",
                      //                 style: const TextStyle(
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.w600),
                      //               ),
                      //               Text(
                      //                 // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //                 "${_con.orderProducts[index].description}",
                      //                 style: const TextStyle(
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.w500),
                      //               ),
                      //             ],
                      //           ),
                      //           //
                      //
                      //           Padding(
                      //             padding: const EdgeInsets.only(left: 32.5),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 _con.orderProducts[index].dimension != ''
                      //                     ? Text(
                      //                         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //                         "Dimension : ${_con.orderProducts[index].dimension} ${_con.orderProducts[index].unit}",
                      //                         style: const TextStyle(
                      //                             fontSize: 17,
                      //                             fontWeight: FontWeight.w400),
                      //                       )
                      //                     : Container(),
                      //                 _con.orderProducts[index].qty != ''
                      //                     ? Text(
                      //                         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //                         "Quantity : ${_con.orderProducts[index].qty} pcs",
                      //                         style: const TextStyle(
                      //                             fontSize: 17,
                      //                             fontWeight: FontWeight.w400),
                      //                       )
                      //                     : Container(),
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 6),
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.only(right: 10),
                      //         child: Icon(
                      //           Icons.discount_outlined,
                      //           color: Colors.green,
                      //         ),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "Discount Amount : ",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w600),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "${widget.oh.discount} BDT",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 6),
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.only(right: 10),
                      //         child: Icon(
                      //           Icons.monetization_on_rounded,
                      //           color: Colors.green,
                      //         ),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "Total Bill Amount : ",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w600),
                      //       ),
                      //       Text(
                      //         // "Order ID : ${_con.orderHistory[index].customer_name}",
                      //         "${widget.oh.total_amount} BDT",
                      //         style: const TextStyle(
                      //             fontSize: 17, fontWeight: FontWeight.w500),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
