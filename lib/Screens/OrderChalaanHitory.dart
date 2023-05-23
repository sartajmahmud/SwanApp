import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/loading.dart';
import '../Controllers/OrderController.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'OrderHistoryDetails.dart';
import 'package:swanapp/Models/OrderHistory.dart';
import 'package:swanapp/Models/OrderChalaan.dart';

// class OrderChalaanHistory extends StatelessWidget {
//   final String invoice_id;
//   OrderChalaanHistory({required this.invoice_id});
//   // receive data from the FirstScreen as a parameter
//   // OrderChalaanHistory({required Key key, required this.invoice_id})
//   //     : super(key: key);
//   // OrderChalaanHistory({Key key, required this.invoice_id}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second screen')),
//       body: Center(
//         child: Text(
//           invoice_id,
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

class OrderChalaanHistory extends StatefulWidget {
  const OrderChalaanHistory({Key? key, required this.invoice_id})
      : super(key: key);

  final String? invoice_id;

  @override
  State createState() => _OrderChalaanHistoryState();
}

// class _OrderChalaanHistoryState extends State<OrderChalaanHistory> {
//   @override
//   Widget build(BuildContext context) {
//     // Use the Todo to create the UI.
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             // Step 4 <-- SEE HERE
//             Text(
//               '${widget.invoice_id}',
//               style: TextStyle(fontSize: 54),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class _OrderChalaanHistoryState extends StateMVC<OrderChalaanHistory> {
  late OrderController _con;

  _OrderChalaanHistoryState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
    print("Invoice IS ${widget.invoice_id}");
  }

  // bool loading = false;
  //  String subtotal = '';
  //
  // String calcSubtotal() {
  //   subtotal = widget.invoice_id;
  //   // subtotal+=int.parse(_con.orderProducts[index].product_amount);
  //   // for (int index = 0; index >= _con.orderProducts.length; index++) {
  //   //   subtotal += int.parse(_con.orderProducts[index].product_amount);
  //   // }
  //   print(subtotal);
  //   return subtotal;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.invoice_id != null) {
      _con.getOrderChalan(widget.invoice_id.toString());
    }
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
                '${currentUser.value.currentZone} Chalaan List',
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              // actions: [
              //   IconButton(
              //       onPressed: () async {
              //         await _con.getChalanHistory('');
              //         setState(() {});
              //       },
              //       icon: Icon(Icons.refresh))
              // ],
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // child: Text(
              //   widget.invoice_id,
              //   style: TextStyle(fontSize: 24),
              // ),
              child: Column(
                children: [
                  // ElevatedButton.icon(
                  //   onPressed: () async {
                  //     // return
                  //     // dateWidget();
                  //
                  //     var results = await showCalendarDatePicker2Dialog(
                  //       context: context,
                  //       config: CalendarDatePicker2WithActionButtonsConfig(),
                  //       dialogSize: const Size(325, 400),
                  //       borderRadius: BorderRadius.circular(15),
                  //     );
                  //     print(results.toString().split(' ')[0].substring(1));
                  //
                  //     await _con.updateChalaanDataWithSelectedDate(
                  //         results.toString().split(' ')[0].substring(1));
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       padding: EdgeInsets.symmetric(
                  //           horizontal: 10.0, vertical: 10.0),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(50.0)),
                  //       primary: Colors.amber[700]),
                  //   icon: Icon(
                  //       Icons.search_outlined), //icon data for elevated button
                  //   label: Text(
                  //     "Search Chalaans By Date",
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.black87),
                  //   ), //label text
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  _con.orderchalans.isEmpty
                      ? Center(
                          child: Column(
                            children: <Widget>[
                              //Image.asset
                              Image.asset(
                                'assets/notfound.png',
                                height: 200,
                                width: 200,
                              ),
                              Text(
                                'No Chalaans Found',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ) // Image.asset
                            ], //<Widget>[]
                          ), //Column
                        ) //Cen
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _con
                              .orderchalans.length, //_con.orderHistory.length,
                          itemBuilder: (_, index) => InkWell(
                            // onTap: () {
                            //   // Navigator.pushNamed(context, '/OrderDetails');
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (BuildContext context) =>
                            //           OrderHistoryDetails(_con.orderHistory[index]),
                            //     ),
                            //   );
                            // },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Container(
                                    height: 100,
                                    // width: MediaQuery.of(context).size.width * .9,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
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
                                      // border: Border.all(
                                      //     color: Colors.pink.shade100, width: 2),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Chalaan ID : ${_con.orderchalans[index].chalaan_id.toString()}",
                                                // "Order ID : ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              // Text(
                                              //   "Customer Name : ${_con.orderchalans[index].customer_name}",
                                              //   // "Customer Name : ",
                                              //   style: TextStyle(
                                              //       fontSize: 15,
                                              //       fontWeight:
                                              //           FontWeight.w500),
                                              // ),
                                              // Text(
                                              //   "Total Amount : ${_con.orderHistory[index].total_amount}",
                                              //   // "Total Amount : ",
                                              //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                              // ),
                                            ],
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.symmetric(horizontal: 25),
                                          //   child:
                                          // ),
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              _con.getChallanDoc(_con
                                                  .orderchalans[index]
                                                  .chalaan_id);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 10.0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0)),
                                                primary: Colors.indigo[300]),
                                            icon: Icon(Icons
                                                .print_rounded), //icon data for elevated button
                                            label: Text(
                                                "Print Chalaan"), //label text
                                          ),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       _con.getChallanDoc(_con
                                          //           .chalans[index].chalaan_id);
                                          //     },
                                          //     icon: Icon(Icons.print))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          );
  }
}
