import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getChalanHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('${currentUser.value.currentZone}  Chalaans'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _con.chalans.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: _con.chalans.length, //_con.orderHistory.length,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border:
                              Border.all(color: Colors.pink.shade100, width: 2),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              IconButton(
                                  onPressed: () {
                                    _con.getChallanDoc(
                                        _con.chalans[index].chalaan_id);
                                  },
                                  icon: Icon(Icons.print))
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
                'No Chalaan Available',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
      ),
    );
  }
}
