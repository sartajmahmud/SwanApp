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
  Color getColor(Set<MaterialState> states) {
    return Colors.pink.shade50;
  }

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
              title: Center(
                child: Text(
                  '${currentUser.value.currentZone} Dispatch Section',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      _con.getUniqueOrderData(int.parse(widget.oh.order_id));
                      setState(() {});
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: _con.orderProducts.isNotEmpty
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
                                    // color: Colors.amber,
                                    child: Container(
                                      // height: MediaQuery.of(context).size.height*0.13,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
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
                                    // color: Colors.amberAccent,
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
                                    // color: Colors.amberAccent,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Items for Dispatch : ",
                                              style: TextStyle(
                                                  color: Colors.teal,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            DataTable(
                                              border: TableBorder.all(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.grey.shade400),
                                              columns: const <DataColumn>[
                                                DataColumn(
                                                  label: Text('Product'),
                                                ),
                                                DataColumn(
                                                  label: Text('Ordered'),
                                                ),
                                                DataColumn(
                                                  label: Text('Delivered'),
                                                ),
                                                DataColumn(
                                                  label: Text('Dispatch Qty'),
                                                ),
                                              ],
                                              rows: List.generate(
                                                  _con.orderProducts.length,
                                                  (index) {
                                                final item =
                                                    _con.orderProducts[index];

                                                return DataRow(
                                                  color: index % 1 == 0
                                                      ? MaterialStateProperty
                                                          .resolveWith(getColor)
                                                      : null,
                                                  cells: [
                                                    DataCell(
                                                      Text(item.description,
                                                          style: TextStyle(
                                                              fontSize: 15)),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        item.qty,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        item.qty_remains,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged:
                                                            (String password) {
                                                          if (int.parse(
                                                                  password) <=
                                                              int.parse(_con
                                                                  .orderProducts[
                                                                      index]
                                                                  .qty)) {
                                                            _con.dp.dispatchItems[
                                                                    index][1] =
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
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
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
                                                                    index][1] =
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
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
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
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          icon: Icon(Icons
                                                              .production_quantity_limits_outlined),
                                                          // labelText: '',
                                                          // labelStyle: TextStyle(
                                                          //     fontWeight:
                                                          //         FontWeight
                                                          //             .w500,
                                                          //     fontFamily:
                                                          //         'PlayfairDisplay',
                                                          //     color: Colors
                                                          //         .black54),
                                                          focusColor:
                                                              Colors.redAccent,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          // border: OutlineInputBorder(
                                                          //     borderRadius:
                                                          //         BorderRadius
                                                          //             .circular(
                                                          //                 5)),
                                                        ),
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                            )
                                          ],
                                        ),
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
                                          color: Colors.indigo[300],
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
                                                              Colors.white70),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      )
                    : Center(
                        child: Column(
                          children: <Widget>[
                            //Image.asset
                            Image.asset(
                              'assets/notfound.png',
                              height: 200,
                              width: 200,
                            ),
                            Text(
                              'No Products Left For dispatch',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ) // Image.asset
                          ], //<Widget>[]
                        ), //Column
                      )

                //Cen
                ),
          );
  }
}
