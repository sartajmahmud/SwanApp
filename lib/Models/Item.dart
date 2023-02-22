import 'dart:convert';

class Item {
  late int? productID = 0;
  double height = 0;
  double width = 0;
  double length = 0;
  late int discount;

  late int quantity;
  late int qty_remains;
  late int? fabID = 0;

  Item();

  String toMap() {
    var map = new Map<String, dynamic>();
    map["product_id"] = productID;
    map["discount"] = discount;
    map["height"] = height;
    map["width"] = width;
    map["length"] = length;
    map["qty"] = quantity;
    map["qty_remains"] = qty_remains;
    map["fab_id"] = fabID;

    return jsonEncode(map);
  }
}
