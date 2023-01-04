import 'Item.dart';

class ProductOrder{
  late String name;
  late String address;
  late String mobile;
  late String discount;
  List <Item> items = [];
  List products = <Map<String, dynamic>>[
  ];
  ProductOrder();

   getProducts() async {
    for (Item item in items){
      products.add({
        'product_id':item.productID,
        'height':item.height,
        'width':item.width,
        'length':item.length,
        'qty':item.quantity,
        'fab_id':item.fabID,
      });
    }
    return products;
}
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["customer_name"]=name;
    map["customer_address"] = address;
    map["customer_mobile"] = mobile;
    map["discount"] = discount;
    map["products"] = items.map((e) => e.toMap()).toList().toString();
    return map;
  }
  printData(){
    print(name);
    print(address);
    print(mobile);
    print(discount);
    for(Item item in items){
      print(item.productID);
      print(item.height);
      print(item.width);
      print(item.length);
      print(item.quantity);
      print(item.fabID);
    }
  }
}