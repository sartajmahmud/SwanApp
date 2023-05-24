import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swanapp/Models/Chalaan.dart';
import 'package:swanapp/Models/OrderChalaan.dart';
import '../Models/DispatchLocation.dart';
import '../Models/OrderHistory.dart';
import '../Models/ProductOrder.dart';
import '../Models/Order.dart';
import '../constants.dart';
import 'AuthRepository.dart';

Future<List<OrderHistory>> getuniqueOrderProducts(int OrderId) async {
  // print(currentUser.value.token);
  Uri url = Uri.http(
    serverUrl,
    'api/customer-ordered-products/$OrderId',
  );

  http.Response response = await http.get(url,
      headers: {"Authorization": "Bearer ${currentUser.value.token}"});
  print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  print(result['data']);
  return result2.map((e) => OrderHistory.fromJSON(e)).toList();
}

Future<List<OrderHistory>> getOrderProducts(int OrderId) async {
  // print(currentUser.value.token);
  Uri url = Uri.http(
    serverUrl,
    'api/order-history/$OrderId',
  );

  http.Response response = await http.get(url,
      headers: {"Authorization": "Bearer ${currentUser.value.token}"});
  print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  print(result['data']);
  return result2.map((e) => OrderHistory.fromJSON(e)).toList();
}

Future<List<DispatchLocation>> getAllDispatchLocation() async {
  // print(currentUser.value.token);
  Uri url = Uri.http(
    serverUrl,
    'api/dispatch-locations',
  );

  http.Response response = await http.get(url,
      headers: {"Authorization": "Bearer ${currentUser.value.token}"});
  print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  // print(result['data']);
  return result2.map((e) => DispatchLocation.fromJSON(e)).toList();
}

Future<List<OrderHistory>> getTodaysOrders(String date) async {
  // print(currentUser.value.token);

  Uri url = Uri.http(
    serverUrl,
    'api/get-orders',
  );
  DateTime _now = DateTime.now();
  String time = date == '' ? "${_now.year}-${_now.month}-${_now.day}" : date;
  http.Response response = await http.post(url, headers: {
    "Authorization": "Bearer ${currentUser.value.token}"
  }, body: {
    'date': time,
    'zone': currentUser.value.currentZone,
    'type': currentUser.value.address_type
  });
  print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  print(result['data']);
  return result2.map((e) => OrderHistory.fromJSON(e)).toList();
}

// Future<List<OrderHistory>> getTodaysFactoryOrders(String date) async {
//   // print(currentUser.value.token);
//   Uri url = Uri.http(
//     serverUrl,
//     'api/get-factory-orders',
//   );
//   DateTime _now = DateTime.now();
//   String time = date == '' ? "${_now.year}-${_now.month}-${_now.day}" : date;
//   http.Response response = await http.post(url,
//       headers: {"Authorization": "Bearer ${currentUser.value.token}"},
//       body: {'date': time});
//   print(response.body);
//   Map<String, dynamic> result = jsonDecode(response.body);
//   List result2 = result['data'];
//   print(result['data']);
//   return result2.map((e) => OrderHistory.fromJSON(e)).toList();
// }

Future createOrder(ProductOrder po) async {
  po.products = [];
  var products = await po.getProducts();
  var post = {
    'customer_name': po.name,
    'customer_address': po.address,
    'customer_mobile': po.mobile,
    'pos_area': currentUser.value.currentZone,
    // 'discount': po.discount,
    'products': products,
  };
  print(post);
  var bytes = utf8.encode(json.encode(post));
  print(bytes);

  Uri url = Uri.http(serverUrl, 'api/orders');
  http.Response response = await http.post(url,
      // body: po.toMap(),
      body: bytes,
      headers: {
        "Authorization": "Bearer ${currentUser.value.token}",
        "content-type": "application/json;encoding=utf-8",
      });
  print(response.body);
}

getChallanPDF(String ID) async {
  Uri url = Uri.http(
    serverUrl,
    'api/make-chalaan',
  );

  return http.post(url,
      headers: {"Authorization": "Bearer ${currentUser.value.token}"},
      body: {'chalaan_id': ID});
  http.Response response = await http.post(url,
      headers: {"Authorization": "Bearer ${currentUser.value.token}"},
      body: {'chalaan_id': ID});
  print(response.body);
  return response;
  // Map<String,dynamic> result = jsonDecode(response.body);
  // List result2 = result['data'];
  // // print(result['data']);
  // return result2.map((e) => Order.fromJSON(e)).toList();
}

getInvoicePDF(int ID) async {
  Uri url = Uri.http(
    serverUrl,
    'api/get-invoice/$ID',
  );
  return http.get(url,
      headers: {"Authorization": "Bearer ${currentUser.value.token}"});
  // print(response.body);
  // Map<String,dynamic> result = jsonDecode(response.body);
  // List result2 = result['data'];
  // // print(result['data']);
  // return result2.map((e) => Order.fromJSON(e)).toList();
}

Future<List<Chalaan>> getTodaysChalans(String date) async {
  // print(currentUser.value.token);
  Uri url = Uri.http(
    serverUrl,
    'api/get-chalaan',
  );

  DateTime _now = DateTime.now();
  // String time = "${_now.year}-${_now.month}-${_now.day}";
  String time = date == '' ? "${_now.year}-${_now.month}-${_now.day}" : date;

  http.Response response = await http.post(url, headers: {
    "Authorization": "Bearer ${currentUser.value.token}"
  }, body: {
    'date': time,
    // 'mobile': currentUser.value.email,
    'zone': currentUser.value.currentZone,
  });
  print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  // print(result['data']);
  return result2.map((e) => Chalaan.fromJSON(e)).toList();
}

Future<List<OrderChalaan>> getOrderChalans(String ID) async {
  // print(currentUser.value.token);
  print("get order chalans ID ::::: " + ID);
  Uri url = Uri.http(
    serverUrl,
    'api/get-order-chalaan',
  );

  http.Response response = await http.post(url, headers: {
    "Authorization": "Bearer ${currentUser.value.token}"
  }, body: {
    'ID': ID,
    // 'mobile': currentUser.value.email,
    // 'zone': currentUser.value.currentZone,
  });
  // print(ID);
  print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  // print(result['data']);
  return result2.map((e) => OrderChalaan.fromJSON(e)).toList();
}
