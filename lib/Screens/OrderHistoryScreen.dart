
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
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Container(
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
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  height: 100,
                  width: MediaQuery.of(context).size.width*.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.pink.shade100,width: 2),
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
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Customer Name : ${_con.orderHistory[index].customer_name}",
                              // "Customer Name : ",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Total Amount : ${_con.orderHistory[index].total_amount}",
                              // "Total Amount : ",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
                            }, icon: Icon(Icons.print))
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
