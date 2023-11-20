import 'dart:convert';

class Item {
  late int? productID = 0;
  double height = 0;
  double width = 0;
  double length = 0;
  late double discount;

  late int quantity;
  late String? fabName;
  late int? attribute = 0;
  late int? fabID = 0;
  late String? dispatchLocation = '';
  late String? productName = '';

  Item();

  String toMap() {
    var map = new Map<String, dynamic>();
    map["product_id"] = productID;
    map["product_name"] = productName;
    map["discount"] = discount;
    map["height"] = height;
    map["width"] = width;
    map["length"] = length;
    map["qty"] = quantity;
    map["dispatch_location'"] = dispatchLocation;

    map["fab_id"] = fabID;

    return jsonEncode(map);
  }
}
