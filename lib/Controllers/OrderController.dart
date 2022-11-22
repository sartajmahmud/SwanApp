import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/Product.dart';
import 'package:swanapp/Repositories/OrderRepository.dart';
import 'package:swanapp/Repositories/ProductRepository.dart';

import '../Models/Order.dart';

class OrderController extends ControllerMVC{

  List<Product> products = [];

  List<Order> orders = [];
  List<Order> chalans = [];
  getProducts() async {
    products = await getAllProducts();
    for(Product product in products){
      print(product.product_name);
    }
  }

  getChalanHistory() async {
    chalans = await getTodaysChalans();
    for(Order order in chalans){
      print(order.product_name);
    }
  }

  getOrderHistory() async {
    orders = await getTodaysOrders();
    for(Order order in orders){
      print(order.product_name);
    }
  }
}