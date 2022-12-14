import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Controllers/OrderController.dart';

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

  // List of items in our dropdown menu
  var _currentSelectedValue;
  final _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
  var _SelectedFabric;
  final _fabricID = ["1", "2", "3", "4", "5"];

  final customProducts = ["Medical", "Rent", "Movie", "Salary"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PlayfairDisplay'),
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
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PlayfairDisplay'),
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
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PlayfairDisplay'),
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
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PlayfairDisplay'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  const Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 5),
                        child: Divider(
                          color: Color(0xff707070).withOpacity(0.5),
                          thickness: 1.75,
                          height: 30,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 60,
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'PlayfairDisplay'),
                      border: OutlineInputBorder(),
                    ),
                    // isEmpty: _currentSelectedValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                          });
                        },
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
            customProducts.contains(_currentSelectedValue)
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 45,
                        child: TextField(
                          onChanged: (String password) {
                            // this.password = password;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Quantiy',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'PlayfairDisplay'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 45,
                              child: TextField(
                                onChanged: (String password) {
                                  // this.password = password;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Height',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'PlayfairDisplay'),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 45,
                              child: TextField(
                                onChanged: (String password) {
                                  // this.password = password;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Width',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'PlayfairDisplay'),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 45,
                              child: TextField(
                                onChanged: (String password) {
                                  // this.password = password;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Length',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'PlayfairDisplay'),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 55,
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: const InputDecoration(
                                labelText: 'Fabric ID',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'),
                                border: OutlineInputBorder(),
                              ),
                              // isEmpty: _currentSelectedValue == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _SelectedFabric,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _SelectedFabric = newValue;
                                    });
                                  },
                                  items: _fabricID.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: const EdgeInsets.all(10),
                    height: 45,
                    child: TextField(
                      onChanged: (String password) {
                        // this.password = password;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Quantiy',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PlayfairDisplay'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
            InkWell(
              onTap: () {
                // Navigator.pushNamed(context, '/createOrder');
              },
              child: Container(
                margin: const EdgeInsets.all(10),
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
                            'Add Another Product',
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
                margin: const EdgeInsets.all(10),
                width: 150,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
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
      ),
    );
  }
}
