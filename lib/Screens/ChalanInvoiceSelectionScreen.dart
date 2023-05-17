import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Controllers/OrderController.dart';
import '../loading.dart';
import 'DispatchScreen.dart';

class ChalanInvoiceSelectionScreen extends StatefulWidget {
  const ChalanInvoiceSelectionScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ChalanInvoiceSelectionScreenState();
}

class _ChalanInvoiceSelectionScreenState
    extends StateMVC<ChalanInvoiceSelectionScreen> {
  late OrderController _con;

  _ChalanInvoiceSelectionScreenState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getOrderHistory('');
  }

  @override
  Widget build(BuildContext context) {
    return _con.loading
        ? Loading()
        : Scaffold(
            // backgroundColor: Colors.redAccent,
            appBar: AppBar(
              title: Text(
                'Select Invoice For Chalaan',
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red,
            ),
            body: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  MaterialButton(
                      onPressed: () async {
                        // return
                        // dateWidget();

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
                      minWidth: 220,
                      height: 30,
                      color: Colors.amber[900],
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        'Sarch By Date',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  _con.orderHistory.length < 1
                      ? Center(
                          child: Text(
                          'No Invoice Available',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _con
                              .orderHistory.length, //_con.orderHistory.length,
                          itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, '/OrderDetails');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DispatchScreen(_con.orderHistory[index]),
                                ),
                              );
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width * .9,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    // border: Border.all(
                                    //     color: Colors.pink.shade100, width: 2),
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "Order ID : ${_con.orderHistory[index].id.toString()}",
                                              "Invoice ID : ${_con.orderHistory[index].invoice_id.toString()}",
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

                                            // Text(
                                            //   "Order Date : ${_con.factoryOrderHistory[index].created_at}",
                                            //   // "Total Amount : ",
                                            //   style: TextStyle(
                                            //       fontSize: 15,
                                            //       fontWeight: FontWeight.w500,
                                            //       color: Colors.black),
                                            // ),
                                          ],
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            // Navigator.pushNamed(context, '/OrderDetails');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    DispatchScreen(_con
                                                        .orderHistory[index]),
                                              ),
                                            );
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
                                              .delivery_dining_rounded), //icon data for elevated button
                                          label: Text(
                                              "Dispatch Order"), //label text
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(horizontal: 25),
                                        //   child:
                                        // ),
                                        // IconButton(
                                        //     onPressed: (){
                                        //       _con.getInvoiceDoc(int.parse(_con.orderHistory[index].order_id));
                                        //     }, icon: Icon(Icons.print,color: Colors.green,))
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
