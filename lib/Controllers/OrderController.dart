import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/Fabric.dart';
import 'package:swanapp/Models/OrderHistory.dart';
import 'package:swanapp/Models/Product.dart';
import 'package:swanapp/Models/ProductOrder.dart';
import 'package:swanapp/Repositories/OrderRepository.dart';
import 'package:swanapp/Repositories/ProductRepository.dart';

import '../Models/Order.dart';
import '../Repositories/FabricRepository.dart';

class OrderController extends ControllerMVC{

  ProductOrder po = ProductOrder();
  List<Product> products = [];
  // List<ProductOrder> productOrders = [];
  List<Order> orders = [];

  List<OrderHistory> orderHistory = [];

  List<Order> chalans = [];
  List<Fabric> fabrics = [];
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
    orderHistory = await getTodaysOrders();
    for(OrderHistory order in orderHistory){
      print(order.customer_name);
    }
    setState(() { });
  }

  getFabrics() async {
    fabrics = await getAllFabrics();
    for(Fabric fabric in fabrics){
      print(fabric.fabric_name);
    }
  }

  submitOrder()async{
    // po.printData();
    // print(po.toMap());
    await createOrder(po);

  }
}