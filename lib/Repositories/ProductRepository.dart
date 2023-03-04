import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swanapp/Models/DispatchProduct.dart';
import 'package:swanapp/Models/Product.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'package:swanapp/constants.dart';

Future<List<Product>> getAllProducts() async {
  // print(currentUser.value.token);
  Uri url = Uri.http(serverUrl, 'api/products',);


  http.Response response = await http.get(url,headers: {"Authorization":"Bearer ${currentUser.value.token}"});
  // print(response.body);
  Map<String,dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  // print(result['data']);
  return result2.map((e) => Product.fromJSON(e)).toList();

}


Future DispatchProducts (DispatchProduct dp) async {
  dp.products = [];
  var products = await dp.getProducts();
  var post = {
    // 'customer_name': po.name,
    // 'customer_address': po.address,
    // 'customer_mobile': po.mobile,
    // 'pos_area': currentUser.value.currentZone,
    // 'discount': po.discount,
    'products': products,
  };
  print(post);
  var bytes = utf8.encode(json.encode(post));
  print(bytes);

  Uri url = Uri.http(serverUrl, 'api/dispatch');
  http.Response response = await http.post(url,
      // body: po.toMap(),
      body: bytes,
      headers: {
        "Authorization": "Bearer ${currentUser.value.token}",
        "content-type": "application/json;encoding=utf-8",
      });
  print(response.body);
}