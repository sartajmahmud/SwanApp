import 'package:swanapp/Repositories/AuthRepository.dart';

class DispatchProduct{

  late int product_id;
  late int qty;
  late String pos_area;
  late String mobile;
  List dispatchItems = [];
  DispatchProduct();

  List products = <Map<String, dynamic>>[
  ];

  getProducts() async {
    for ( var item in dispatchItems){
      products.add({
        'product_id':item[0],
        'qty':item[1],
        'pos_area':currentUser.value.currentZone,
        'mobile':currentUser.value.email,
      });
    }
    return products;
  }
}