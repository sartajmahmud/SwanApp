import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Controllers/OrderController.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'package:swanapp/Screens/OrderHistoryDetails.dart';
import 'package:intl/intl.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    dateInputController.text = "";
    super.initState();
    _con.getOrderHistory('');
  }

  dateWidget(){
    return
    DatePickerDialog(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${currentUser.value.currentZone}  Orders'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextButton(onPressed: () async {
              // return
              // dateWidget();

              var results = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(),
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
              );
              print( results.toString().split(' ')[0].substring(1));
             await _con.updateDataWithSelectedDate(results.toString().split(' ')[0].substring(1));
            }, child: Text('Select Date')),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _con.orderHistory.length, //_con.orderHistory.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, '/OrderDetails');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          OrderHistoryDetails(_con.orderHistory[index]),
                    ),
                  );
                },
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * .9,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order ID : ${_con.orderHistory[index].invoice_id.toString()}",
                                  // "Order ID : ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Customer Name : ${_con.orderHistory[index].customer_name}",
                                  // "Customer Name : ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Total Amount : ${_con.orderHistory[index].total_amount}",
                                  // "Total Amount : ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 25),
                            //   child:
                            // ),
                            IconButton(
                                onPressed: () {
                                  _con.getInvoiceDoc(
                                      int.parse(_con.orderHistory[index].order_id));
                                },
                                icon: Icon(
                                  Icons.print,
                                  color: Colors.green,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
