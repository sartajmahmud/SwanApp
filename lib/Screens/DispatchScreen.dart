import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/OrderHistory.dart';
import '../Controllers/OrderController.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('${currentUser.value.currentZone}  Dispatch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _con.orderProducts.length < 1
            ? Center(
                child: Text(
                'No Product Left For Dispatch',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))
            : Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 8,
                            child: Center(
                                child: Text(
                              'Product',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ))),
                        Expanded(
                            flex: 8,
                            child: Center(
                                child: Text(
                              'Qty',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ))),
                        Expanded(
                            flex: 8,
                            child: Center(
                                child: Text(
                              'Qty Left',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ))),
                        Expanded(
                            flex: 8,
                            child: Center(
                                child: Text(
                              'Qty',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ))),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          _con.orderProducts.length, //_con.orderHistory.length,
                      itemBuilder: (_, index) => Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 8,
                                child: Center(
                                    child: Text(
                                  "${index + 1} : ${_con.orderProducts[index].description} ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ))),
                            Expanded(
                                flex: 8,
                                child: Center(
                                    child: Text(
                                  "${_con.orderProducts[index].qty}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ))),
                            Expanded(
                                flex: 8,
                                child: Center(
                                    child: Text(
                                  "${_con.orderProducts[index].qty_remains}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ))),
                            // Text(
                            //   // "Order ID : ${_con.orderHistory[index].customer_name}",
                            //   "${index + 1} : ${_con.orderProducts[index].description}",
                            //   style: TextStyle(
                            //       fontSize: 17, fontWeight: FontWeight.w800),
                            // ),
                            Expanded(
                                flex: 8,
                                child: Center(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (String password) {
                                      // widget._con.po.items[widget.serialNo].quantity = int.parse(password);

                                      // this.password = password;
                                      if (int.parse(password) <=
                                              int.parse(_con
                                                  .orderProducts[index]
                                                  .qty_remains) &&
                                          int.parse(password) > 0) {
                                        _con.dp.dispatchItems[index][1] =
                                            int.parse(password);
                                      } else if (int.parse(password) == 0) {
                                        var snackBar = SnackBar(
                                          content: Text(
                                            'QTY Can\'t be "0"',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        var snackBar = SnackBar(
                                          content: Text(
                                            'QTY Can\'t be more than Qty Remains \"${_con.orderProducts[index].qty_remains}\"',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'QTY',
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'PlayfairDisplay',
                                          color: Colors.black54),
                                      focusColor: Colors.black,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                    ),
                                  ),
                                )),
                            // Container(
                            //   // margin: const EdgeInsets.all(10),
                            //   height: 45,
                            //   width: 55,
                            //   child: TextField(
                            //     keyboardType: TextInputType.number,
                            //     onChanged: (String password) {
                            //       // widget._con.po.items[widget.serialNo].quantity = int.parse(password);
                            //
                            //       // this.password = password;
                            //       _con.dp.dispatchItems[index][1] =
                            //           int.parse(password);
                            //     },
                            //     decoration: InputDecoration(
                            //       labelText: 'QTY',
                            //       labelStyle: TextStyle(
                            //           fontWeight: FontWeight.w500,
                            //           fontFamily: 'PlayfairDisplay',
                            //           color: Colors.black54),
                            //       focusColor: Colors.black,
                            //       focusedBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(13)),
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(13)),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // await _con.submitOrder(context);
                        await _con.dispatch();

                        Navigator.pushReplacementNamed(
                            context, '/chalanHistory');
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 110),
                        width: 180,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            'Confirm Dispatch',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
