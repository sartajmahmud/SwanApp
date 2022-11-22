
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Order'),
      ),
    );
  }
}
