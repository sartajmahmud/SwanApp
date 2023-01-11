
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Controllers/OrderController.dart';
import 'package:swanapp/Screens/OrderHistoryDetails.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _con.orderHistory.length, //_con.orderHistory.length,
          itemBuilder: (_, index) => InkWell(
            onTap: (){
              // Navigator.pushNamed(context, '/OrderDetails');
              Navigator.push(context, MaterialPageRoute (
                builder: (BuildContext context) => OrderHistoryDetails(_con.orderHistory[index]),
              ),);
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width*.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.black, width: 1),
                        //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       "id ${index}",
                        //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        //     ),
                        //   ),
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order ID : ${_con.orderHistory[index].id.toString()}",
                              // "Order ID : ",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            Text(
                              "Customer Name : ${_con.orderHistory[index].customer_name}",
                              // "Customer Name : ",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                            Text(
                              "Total Amount : ${_con.orderHistory[index].total_amount}",
                              // "Total Amount : ",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 25),
                        //   child:
                        // ),
                        IconButton(
                            onPressed: (){
                              _con.getInvoiceDoc(int.parse(_con.orderHistory[index].order_id));
                            }, icon: Icon(Icons.print,color: Colors.green,))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
