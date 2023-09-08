import 'dart:convert';

class Item {
  late int? productID = 0;
  double height = 0;
  double width = 0;
  double length = 0;
  int discount = 0;

  int quantity = 0;

  late int? fabID = 0;
  late String? dispatchLocation = '';

  Item();

  String toMap() {
    var map = new Map<String, dynamic>();
    map["product_id"] = productID;
    map["discount"] = discount;
    map["height"] = height;
    map["width"] = width;
    map["length"] = length;
    map["qty"] = quantity;
    map["dispatch_location"] = dispatchLocation;

    map["fab_id"] = fabID;

    return jsonEncode(map);
  }
}
