import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/OrderHistory.dart';
import '../Controllers/OrderController.dart';

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
        title: Text('Dispatch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _con.orderProducts.length < 1
            ? Center(
                child: Text(
                'No Invoice Available',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'QTY',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
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
                          Text(
                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                            "${index + 1} : ${_con.orderProducts[index].description}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          ),
                          Container(
                            // margin: const EdgeInsets.all(10),
                            height: 45,
                            width: 55,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (String password) {
                                // widget._con.po.items[widget.serialNo].quantity = int.parse(password);

                                // this.password = password;
                              },
                              decoration: InputDecoration(
                                labelText: 'QTY',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay',
                                    color: Colors.black54),
                                focusColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // await _con.submitOrder(context);
                      await _con.dispatch();
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
    );
  }
}
