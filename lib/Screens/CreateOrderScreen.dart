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
  bool validateNumber = false;
  bool validateName = false;
  bool validateAddress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getProducts();
    _con.getFabrics();
    _con.getDispatchLoc();
    _con.validateQuantity=false;
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
    _con.po.items.add(
      Item()
        ..dispatchLocation = _con.dispatchLocations[0].mobile_no
        ..productName = _con.products[0].product_name
        ..productID = _con.products[0].id,
    );
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
            height: validateName?45:65,
            child: TextField(
              onChanged: (String name) {
                _con.po.name = name;
                name.isNotEmpty
                    ? validateName = true
                    : validateName = false;
                setState(() {});
              },
              decoration: InputDecoration(
                focusColor: Colors.black,
                labelText: 'Customer Name',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                errorText: validateName ? null : "Name Can't be Empty",
                errorStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1,color: Colors.grey)
                ),
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
            margin: const EdgeInsets.all(5),
            height: validateAddress ? 55 : 65,
            child: TextField(
              onChanged: (String address) {
                _con.po.address = address;
                address.isNotEmpty
                    ? validateAddress = true
                    : validateAddress = false;
                setState(() {});
              },

              decoration: InputDecoration(
                focusColor: Colors.black,
                labelText: 'Customer Address',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                errorText: validateAddress ? null : "Address Can't be Empty",
                errorStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1,color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(width: 1,color: Colors.green)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide(width: 1,color: Colors.green)
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: validateNumber ? 45 : 65,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (String number) {
                _con.po.mobile = number;
                number.length == 11 && number.isNotEmpty
                    ? validateNumber = true
                    : validateNumber = false;
                setState(() {});
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
                errorStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PlayfairDisplay',
                    color: Colors.black54),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1,color: Colors.grey)
                ),
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
          dynamicList.isNotEmpty //&& validateNumber&& validateAddress&&validateName
              ? InkWell(
                  onTap: validateNumber&& validateAddress&&validateName
                      ? () async {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                backgroundColor: Colors.white70,
                                content: SingleChildScrollView(
                                  child: Container(
                                    // height: MediaQuery.of(context).size.height * 1,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    decoration:
                                        const BoxDecoration(color: Colors.grey),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Card(
                                          elevation: 10,
                                          shadowColor: Colors.black,
                                          // color: Colors.amberAccent,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*1,
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
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                    "Name: "
                                                    "${_con.po.name}",
                                                    style: TextStyle(
                                                        // color: Color(0xff525252),
                                                        fontSize: 18,
                                                        color: const Color(
                                                                0xff525252)
                                                            .withOpacity(.75),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                    "Contact: "
                                                    "${_con.po.mobile}",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: const Color(
                                                                0xff525252)
                                                            .withOpacity(.75),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                    "Address: "
                                                    "${_con.po.address}",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: const Color(
                                                                0xff525252)
                                                            .withOpacity(.75),
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: ListView.separated(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                separatorBuilder:
                                                    (context, index) {
                                                  return const Divider();
                                                },
                                                shrinkWrap: true,
                                                itemCount: _con.po.items
                                                    .length, //_con.orderHistory.length,
                                                itemBuilder: (_, index) =>
                                                    Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 6),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            child: Icon(
                                                              Icons
                                                                  .card_giftcard,
                                                              color:
                                                                  Colors.teal,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              // "Order ID : ${_con.orderHistory[index].customer_name}",
                                                              "${_con.po.items[index].productName}",
                                                              softWrap: false,
                                                              maxLines: 2,
                                                              style: const TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      //
                                                      _con.po.items[index]
                                                                  .height !=
                                                              0
                                                          ? Text(
                                                              "Dimension : ${_con.po.items[index].height} x ${_con.po.items[index].width} x ${_con.po.items[index].length}",
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            )
                                                          : Container(),
                                                      Text(
                                                        "x ${_con.po.items[index].quantity}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: const Color(
                                                                    0xff525252)
                                                                .withOpacity(
                                                                    .85),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Text(
                                                        "Discount: ${_con.po.items[index].discount}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: const Color(
                                                                    0xff525252)
                                                                .withOpacity(
                                                                    .85),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      _con.po.items[index]
                                                                  .fabID !=
                                                              0
                                                          ? Text(
                                                              "Fabric Name: ${_con.po.items[index].fabName}",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: const Color(
                                                                          0xff525252)
                                                                      .withOpacity(
                                                                          .85),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        GestureDetector(
                                          onTap: () async {
                                            await _con.submitOrder(context);
                                          },
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Text(
                                            "Confirm Order?",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                          // await _con.submitOrder(context);
                        }
                      : null,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 125),
                    width: 150,
                    decoration: BoxDecoration(
                      color: validateNumber&& validateAddress&&validateName? Colors.green : Colors.grey,
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
