import 'dart:convert';
import 'package:http/http.dart' as http;
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