import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/Product.dart';

import '../Controllers/OrderController.dart';
import '../Models/Fabric.dart';

class ProductDetailsField extends StatefulWidget {
  late int serialNo;
  late OrderController _con;

  ProductDetailsField(this.serialNo, this._con) : super();
  @override
  State createState() => _ProductDetailsFieldState();
}

class _ProductDetailsFieldState extends StateMVC<ProductDetailsField> {
  // TextEditingController Product = new TextEditingController();
  // TextEditingController quantity = new TextEditingController();

  late Product? _currentSelectedValue = widget._con.products[0];
  var _SelectedFabric;

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
                  "Product ${widget.serialNo + 1} :",
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
                          widget._con.po.items[widget.serialNo].productID = newValue?.id;
                          _currentSelectedValue = newValue;
                        });
                      },
                      items: widget._con.products.map((Product value) {
                        return DropdownMenuItem<Product>(
                          value: value,
                          child: Text(value.product_name+'('+value.size+')'),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          // customProducts.contains(_currentSelectedValue)
          _currentSelectedValue!.unit == 'cft'
              ? Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 45,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (String password) {
                          widget._con.po.items[widget.serialNo].quantity = int.parse(password);

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
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 45,
                      child: TextField(
                        onChanged: (String password) {
                          widget._con.po.items[widget.serialNo].discount = int.parse(password);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Discount',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
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
                                widget._con.po.items[widget.serialNo].height = double.parse(password);
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
                                widget._con.po.items[widget.serialNo].width = double.parse(password);
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
                                widget._con.po.items[widget.serialNo].length = double.parse(password);
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
                      child: FormField<Fabric>(
                        builder: (FormFieldState<Fabric> state) {
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
                                    widget._con.po.items[widget.serialNo].fabID = newValue?.id;

                                    _SelectedFabric = newValue;
                                  });
                                },
                                items: widget._con.fabrics.map((Fabric value) {
                                  return DropdownMenuItem<Fabric>(
                                    value: value,
                                    child: Text(value.fabric_name),
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
              : _currentSelectedValue!.unit == 'sft'
                  ? Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 45,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (String password) {
                    widget._con.po.items[widget.serialNo].quantity = int.parse(password);

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
              Container(
                margin: const EdgeInsets.all(10),
                height: 45,
                child: TextField(
                  onChanged: (String password) {
                    widget._con.po.items[widget.serialNo].discount = int.parse(password);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Discount',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
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
                          widget._con.po.items[widget.serialNo].height = double.parse(password);
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
                          widget._con.po.items[widget.serialNo].width = double.parse(password);
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
                          widget._con.po.items[widget.serialNo].length = double.parse(password);
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
                child: FormField<Fabric>(
                  builder: (FormFieldState<Fabric> state) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Fabric',
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
                              widget._con.po.items[widget.serialNo].fabID = newValue?.id;

                              _SelectedFabric = newValue;
                            });
                          },
                          items: widget._con.fabrics.map((Fabric value) {
                            return DropdownMenuItem<Fabric>(
                              value: value,
                              child: Text(value.fabric_name+'-'+value.fabric_type+'('+value.fabric_dimension+')'),
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
                  : _currentSelectedValue!.unit == 'pcs'
                      ? Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(10),
                              height: 45,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (String password) {
                                  widget._con.po.items[widget.serialNo].quantity = int.parse(password);
                                  print(password);
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
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 45,
                            child: TextField(
                              onChanged: (String password) {
                                widget._con.po.items[widget.serialNo].discount = int.parse(password);
                                print(password);
                              },
                              decoration: const InputDecoration(
                                labelText: 'Discount',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500, fontFamily: 'PlayfairDisplay'),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Container()
        ],
      ),
    );
  }
}
