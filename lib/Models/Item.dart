import 'dart:convert';

class Item{
  late int ? productID = 0;
   double height = 0;
   double width = 0;
   double length = 0;
  late int quantity;
  late int? fabID = 0;

  Item();

  String toMap() {
    var map = new Map<String, dynamic>();
    map["product_id"]=productID;
    map["height"] = height;
    map["width"] = width;
    map["length"] = length;
    map["qty"] = quantity;
    map["fab_id"] = fabID;
    return jsonEncode(map);
  }
}