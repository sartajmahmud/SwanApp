import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swanapp/Models/OrderHistory.dart';
import 'package:swanapp/Models/ProductOrder.dart';
import '../Models/Order.dart';
import '../constants.dart';
import 'AuthRepository.dart';

Future<List<OrderHistory>> getTodaysOrders() async {
  // print(currentUser.value.token);
  Uri url = Uri.http(serverUrl, 'api/orders',);


  http.Response response = await http.get(url,headers: {"Authorization":"Bearer ${currentUser.value.token}"});
  print(response.body);
  Map<String,dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  print(result['data']);
  return result2.map((e) => OrderHistory.fromJSON(e)).toList();

}

Future createOrder(ProductOrder po) async {
  po.products = [];
  var products = await po.getProducts();
  var post = {
    'customer_name': po.name,
    'customer_address': po.address,
    'customer_mobile': po.mobile,
    'discount': po.discount,
    'products': products,
  };
  var bytes = utf8.encode(json.encode(post));
  print(
    bytes
  );
  // Map postData = po.toMap();
   // postData.remove('products');
  // print("test  "+postData.toString());
  // String temp = po.toMap()['products'];
  // print(jsonEncode(temp));
  // for(int i = 0; i< temp.length; i++){
  //   // temp[i] = jsonEncode(temp[i]);
  //   print(temp[i]);
  // }
  // print(temp);

  // String endodedbody = jsonEncode(postData);
  // print(endodedbody.substring(0,endodedbody.length-1)+", \"products\":"+temp+'}');
  // postData['products'] = temp;
  // print(postData);
  Uri url = Uri.http(serverUrl, 'api/orders');
  // print(currentUser.value.token);
  // print(url);
  // print(po.toMap());
  // print(jsonEncode(endodedbody.substring(0,endodedbody.length-1)+", \"products\":"+temp+'}'));
  // Map post = Map();
  // post['data'] = jsonEncode(endodedbody.substring(0,endodedbody.length-1)+", \"products\":"+temp+'}');
  http.Response response = await http.post(url,
      // body: po.toMap(),
      body:bytes,
    headers: {"Authorization":"Bearer ${currentUser.value.token}",
      "content-type": "application/json;encoding=utf-8",
    }
  );
  // Map result = jsonDecode(response.body);
  print(response.body);



  // result['message'] == "User login successfully." ? x = true : x = false;
  //
  // return x;

}

Future<List<Order>> getTodaysChalans() async {
  // print(currentUser.value.token);
  Uri url = Uri.http(serverUrl, 'api/chalans',);


  http.Response response = await http.get(url,headers: {"Authorization":"Bearer ${currentUser.value.token}"});
  // print(response.body);
  Map<String,dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  // print(result['data']);
  return result2.map((e) => Order.fromJSON(e)).toList();

}

 getChallanPDF(int ID)async {
   Uri url = Uri.http(serverUrl, 'api/get-challan/$ID',);


   http.Response response = await http.get(url,headers: {"Authorization":"Bearer ${currentUser.value.token}"});
   print(response.body);
   // Map<String,dynamic> result = jsonDecode(response.body);
   // List result2 = result['data'];
   // // print(result['data']);
   // return result2.map((e) => Order.fromJSON(e)).toList();
}

getInvoicePDF(int ID)async {
  Uri url = Uri.http(serverUrl, 'api/get-invoice/$ID',);


  // http.Response response = await http.get(url,headers: {"Authorization":"Bearer ${currentUser.value.token}"});
  return http.get(url,headers: {"Authorization":"Bearer ${currentUser.value.token}"});
  // print(response.body);
  // Map<String,dynamic> result = jsonDecode(response.body);
  // List result2 = result['data'];
  // // print(result['data']);
  // return result2.map((e) => Order.fromJSON(e)).toList();
}