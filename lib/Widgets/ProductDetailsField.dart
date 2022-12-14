import 'package:flutter/material.dart';

class ProductDetailsField extends StatefulWidget {
  late int serialNo;
  ProductDetailsField(this.serialNo) : super();
  @override
  State<ProductDetailsField> createState() => _ProductDetailsFieldState();
}

class _ProductDetailsFieldState extends State<ProductDetailsField> {
  // TextEditingController Product = new TextEditingController();
  // TextEditingController quantity = new TextEditingController();

  var _currentSelectedValue;

  final _currencies = [
    "Product 1",
    "Product 2",
    "Product 3",
    "Product 4",
    "Product 5",
    "Product 6",
    "Product 7",
    "Product 8"
  ];

  var _SelectedFabric;

  final _fabricID = ["1", "2", "3", "4", "5"];

  final customProducts = [ "Product 5", "Product 6", "Product 7", "Product 8"];

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: new EdgeInsets.all(8.0),
      child: ListBody(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text(
                  "Product ${widget.serialNo+1} :",
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
        ],
      ),
    );
  }
}
