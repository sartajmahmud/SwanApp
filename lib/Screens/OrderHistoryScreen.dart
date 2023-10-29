import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Controllers/OrderController.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'package:swanapp/Screens/HomeScreen.dart';
import 'package:swanapp/Screens/OrderHistoryDetails.dart';
import 'package:intl/intl.dart';
import 'package:swanapp/Screens/OrderHistoryDetails2.dart';
import 'package:swanapp/loading.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  @override
  State createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends StateMVC<OrderHistoryScreen> {
  TextEditingController dateInputController = TextEditingController();
  late OrderController _con;
  _OrderHistoryScreenState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  // bool loading = false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _con.getOrderHistory('');
  }

  dateWidget() {
    return DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return _con.loading
        ? Loading()
        : Scaffold(
            // backgroundColor: Colors.redAccent,
            appBar: AppBar(
              title: Center(
                child: Text(
                  '${currentUser.value.currentZone} Order List',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: Colors.red,
              actions: [
                IconButton(
                    onPressed: () async {
                      await _con.getOrderHistory('');
                      setState(() {});
                    },
                    icon: const Icon(Icons.refresh))
              ],
              // lead
            ),
            body: Container(
              padding: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      var results = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(),
                        dialogSize: const Size(325, 400),
                        borderRadius: BorderRadius.circular(15),
                      );
                      print(results.toString().split(' ')[0].substring(1));
                      await _con.updateOrderDataWithSelectedDate(
                          results.toString().split(' ')[0].substring(1));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        primary: Colors.amber[700]),
                    icon: const Icon(
                        Icons.search_outlined), //icon data for elevated button
                    label: const Text(
                      "Search Orders By Date",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ), //label text
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  _con.orderHistory.isEmpty
                      ? Center(
                          child: Column(
                            children: <Widget>[
                              //Image.asset
                              Image.asset(
                                'assets/notfound.png',
                                height: 200,
                                width: 200,
                              ),
                              const Text(
                                'No Orders Found',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ) // Image.asset
                            ], //<Widget>[]
                          ), //Column
                        ) //Cen
                      : Expanded(
                          child: Scrollbar(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _con.orderHistory
                                  .length, //_con.orderHistory.length,
                              itemBuilder: (_, index) => InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(context, '/OrderDetails');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          OrderHistoryDetails2(
                                              _con.orderHistory[index]),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height *
                                          .119,
                                      width: MediaQuery.of(context).size.width *
                                          1,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        // border: Border.all(
                                        //     color: Colors.indigo.shade300,
                                        //     width: 2),

                                        boxShadow: [
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Invoice ID : ${_con.orderHistory[index].invoice_id.toString()}",
                                              // "Order ID : ",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height *
                                                .01),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Customer Name : ${_con.orderHistory[index].customer_name}",
                                                      // "Customer Name : ",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height *
                                                        .01),
                                                    Text(
                                                      "Total Amount : ${_con.orderHistory[index].total_amount}",
                                                      // "Total Amount : ",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets.symmetric(
                                                //       horizontal: 25),
                                                // ),
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    _con.getInvoiceDoc(int.parse(
                                                        _con.orderHistory[index]
                                                            .order_id));
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 10),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16)),
                                                      primary: Colors.indigo[300]),
                                                  icon: const Icon(Icons
                                                      .print_rounded), //icon data for elevated button
                                                  label: const Text(
                                                      "Print Invoice"), //label text
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )

                  // MaterialButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const HomeScreen()),
                  //     );
                  //   },
                  //   minWidth: 220,
                  //   height: 35,
                  //   color: Colors.red,
                  //   shape: new RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(30.0),
                  //   ),
                  //   child: Text(
                  //     "Home",
                  //     style: const TextStyle(color: Colors.white, fontSize: 15),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
  }
}
