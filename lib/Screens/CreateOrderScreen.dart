import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/DispatchLocation.dart';
import '../Controllers/OrderController.dart';
import '../Models/Item.dart';
import '../Widgets/ProductDetailsField.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  State createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends StateMVC<CreateOrderScreen> {
  late OrderController _con;

  _CreateOrderScreenState() : super(OrderController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as OrderController;
  }
  bool loading = false;
  bool validateNumber = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getProducts();
    _con.getFabrics();
    _con.getDispatchLoc();
  }

  List<ProductDetailsField> dynamicList = [];
  List<String> product_name = [];
  List<String> product_quantity = [];
  List<String> product_height = [];
  List<String> product_width = [];
  List<String> product_length = [];
  List<String> fabric_id = [];
  addProductDetailsField() {
    if (product_name.isNotEmpty) {
      product_name = [];
      product_quantity = [];
      product_length = [];
      product_height = [];
      product_width = [];
      fabric_id = [];
      dynamicList = [];
    }
    setState(() {
      loading = true;
    });
    _con.po.items.add(Item());
    dynamicList.add(new ProductDetailsField(dynamicList.length, _con));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Create New Order'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 45,
            child: TextField(
              onChanged: (String name) {
                _con.po.name = name;
              },
              decoration: InputDecoration(
                focusColor: Colors.black,
                labelText: 'Customer Name',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 45,
            child: TextField(
              onChanged: (String password) {
                _con.po.address = password;
              },
              decoration: InputDecoration(
                focusColor: Colors.black,
                labelText: 'Customer Address',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: validateNumber?45:65,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (String number) {
                _con.po.mobile = number;
              },
              onSubmitted: (String number){
                number.length == 11 && number.isNotEmpty
                    ? validateNumber = true
                    : validateNumber = false;
                setState(() { });
              },
              decoration: InputDecoration(
                focusColor: Colors.black,
                labelText: 'Customer Mobile',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                errorText: validateNumber ? null : "Invalid Mobile Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.all(10),
          //   height: 45,
          //   child: TextField(
          //     onChanged: (String password) {
          //       _con.po.discount = password;
          //     },
          //     decoration: const InputDecoration(
          //       labelText: 'Discount',
          //       labelStyle: TextStyle(
          //           fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
          //       border: OutlineInputBorder(),
          //     ),
          //   ),
          // ),
          // ProductDetailsField(),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dynamicList.length,
            itemBuilder: (_, index) => dynamicList[index],
          ),
          InkWell(
            onTap: () {
              addProductDetailsField();
            },
            child: loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(
                          child: CircularProgressIndicator(
                              color: Colors.red, strokeWidth: 3)),
                    ],
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 90),
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Expanded(
                              flex: 7,
                              child: Center(
                                  child: Text(
                                'Add Product',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ))),
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.add_box_outlined,
                                size: 20,
                              ))
                        ],
                      ),
                    ),
                  ),
          ),
          dynamicList.isNotEmpty && validateNumber
              ? InkWell(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white70,
                          content: Container(
                            height: MediaQuery.of(context).size.height * 1,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: const BoxDecoration(color: Colors.grey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  // color: Colors.amberAccent,
                                  child: Container(
                                    // height: MediaQuery.of(context).size.height*0.13,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Customer Details : ",
                                            style: TextStyle(
                                                color: Colors.teal,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "Name: "
                                            "${_con.po.name}",
                                            style: TextStyle(
                                                // color: Color(0xff525252),
                                                fontSize: 18,
                                                color: const Color(0xff525252)
                                                    .withOpacity(.75),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "Contact: "
                                            "${_con.po.mobile}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: const Color(0xff525252)
                                                    .withOpacity(.75),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            // "Order ID : ${_con.orderHistory[index].customer_name}",
                                            "Address: "
                                            "${_con.po.address}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: const Color(0xff525252)
                                                    .withOpacity(.75),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  // color: Colors.amberAccent,
                                  child: Container(
                                    // height: MediaQuery.of(context).size.height*0.13,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return const Divider();
                                        },
                                        shrinkWrap: true,
                                        itemCount: _con.po.items
                                            .length, //_con.orderHistory.length,
                                        itemBuilder: (_, index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Icon(
                                                      Icons.card_giftcard,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  Text(
                                                    // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                    "${_con.po.items[index].productID}",
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              //
                                              _con.po.items[index].height != 0
                                                  ? Text(
                                                      "Dimension : ${_con.po.items[index].height} X ${_con.po.items[index].width} X ${_con.po.items[index].length}",
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )
                                                  : Container(),
                                              Text(
                                                "x ${_con.po.items[index].quantity}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xff525252)
                                                            .withOpacity(.75),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "Discount: ${_con.po.items[index].discount}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xff525252)
                                                            .withOpacity(.75),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "Fabric ID: ${_con.po.items[index].fabID}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        const Color(0xff525252)
                                                            .withOpacity(.75),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await _con.submitOrder(context);
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 50,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    // await _con.submitOrder(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 125),
                    width: 150,
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
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
