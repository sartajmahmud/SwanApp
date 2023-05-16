import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/loading.dart';
import '../Controllers/OrderController.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'OrderHistoryDetails.dart';

class ChalanHistoryScreen extends StatefulWidget {
  const ChalanHistoryScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ChalanHistoryScreenState();
}

class _ChalanHistoryScreenState extends StateMVC<ChalanHistoryScreen> {
  late OrderController _con;

  _ChalanHistoryScreenState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  // bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _con.getChalanHistory('');
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      await _con.getChalanHistory('');
                      setState(() {});
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            body: Container(
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

                        await _con.updateChalaanDataWithSelectedDate(
                            results.toString().split(' ')[0].substring(1));
                      },
                      minWidth: 220,
                      height: 30,
                      color: Colors.amber[900],
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        'Search By Date',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  _con.chalans.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              _con.chalans.length, //_con.orderHistory.length,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width * .9,
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
                                              "Chalaan ID : ${_con.chalans[index].chalaan_id.toString()}",
                                              // "Order ID : ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Customer Name : ${_con.chalans[index].customer_name}",
                                              // "Customer Name : ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
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
                                            _con.getChallanDoc(
                                                _con.chalans[index].chalaan_id);
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
                        )
                      : Center(
                          child: Text(
                          'No Chalaans Available',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                ],
              ),
            ),
          );
  }
}
