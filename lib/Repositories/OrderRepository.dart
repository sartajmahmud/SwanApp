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
  // print(response.body);
  Map<String,dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  print(result['data']);
  return result2.map((e) => OrderHistory.fromJSON(e)).toList();

}

Future createOrder(ProductOrder po) async {
  Uri url = Uri.http(serverUrl, 'api/orders');
  print(currentUser.value.token);
  print(url);
  print(po.toMap());
  http.Response response = await http.post(url,
      body: po.toMap(),
    headers: {"Authorization":"Bearer ${currentUser.value.token}"}
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