import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Controllers/OrderController.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getProducts();
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
      product_quantity = [];
      product_height = [];
      product_width = [];
      fabric_id = [];
      dynamicList = [];
    }
    setState(() {});
    dynamicList.add(new ProductDetailsField());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Order'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 45,
            child: TextField(
              onChanged: (String name) {
                // this.email = name;
              },
              decoration: const InputDecoration(
                labelText: 'Customer Name',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 45,
            child: TextField(
              onChanged: (String password) {
                // this.password = password;
              },
              decoration: const InputDecoration(
                labelText: 'Customer Address',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 45,
            child: TextField(
              onChanged: (String password) {
                // this.password = password;
              },
              decoration: const InputDecoration(
                labelText: 'Customer Mobile',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 45,
            child: TextField(
              onChanged: (String password) {
                // this.password = password;
              },
              decoration: const InputDecoration(
                labelText: 'Discount',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // ProductDetailsField(),
          Flexible(
            // flex: 1,
            // fit:FlexFit.loose,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dynamicList.length,
              itemBuilder: (_, index) => dynamicList[index],
            ),
          ),
          InkWell(
            onTap: () {
              addProductDetailsField();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 80),
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Expanded(
                        flex: 8,
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/createOrder');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 120),
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
          ),
        ],
      ),
    );
  }
}
