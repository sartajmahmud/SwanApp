import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Order.dart';
import '../constants.dart';
import 'AuthRepository.dart';

Future<List<Order>> getTodaysOrders() async {
  // print(currentUser.value.token);
  Uri url = Uri.http(serverUrl, 'api/orders',);


  http.Response response = await http.get(url,headers: {"Authorization":"Bearer ${currentUser.value.token}"});
  // print(response.body);
  Map<String,dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  // print(result['data']);
  return result2.map((e) => Order.fromJSON(e)).toList();

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