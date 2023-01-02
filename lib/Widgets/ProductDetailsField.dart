import 'package:flutter/material.dart';
import 'package:swanapp/Models/Product.dart';

import '../Models/Fabric.dart';

class ProductDetailsField extends StatefulWidget {
  late int serialNo;
  late List <Product> products;
  late List <Fabric> fabrics;
  ProductDetailsField(this.serialNo, this.products, this.fabrics) : super();
  @override
  State<ProductDetailsField> createState() => _ProductDetailsFieldState();
}

class _ProductDetailsFieldState extends State<ProductDetailsField> {

  var _SelectedFabric;

  late Product _currentSelectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentSelectedValue = widget.products.first;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: DropdownButton<Product>(
                      value: _currentSelectedValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onChanged: (Product? newValue) {
                        setState(() {
                          _currentSelectedValue = newValue!;
                        });
                      },
                      items: widget.products.map((Product value) {
                        return DropdownMenuItem<Product>(
                          value: value,
                          child: Text(value.product_name),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          _currentSelectedValue.attribute != 2
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
                          labelText: 'Quantity',
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
                              child: DropdownButton<Fabric>(
                                value: _SelectedFabric,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                onChanged: (Fabric? newValue) {
                                  setState(() {
                                    _SelectedFabric = newValue;
                                  });
                                },
                                items: widget.fabrics.map((Fabric value) {
                                  return DropdownMenuItem<Fabric>(
                                    value: value,
                                    child: Text(value.fabric_name + value.fabric_type+'-BDT'+value.fabric_rate.toString()),
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
                      labelText: 'Quantity',
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
