import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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

  getChallanDoc(int ID) async {
    await getChallanPDF(ID);
  }

  getInvoiceDoc(int ID) async {

      var data = await getInvoicePDF(ID);
    await Printing.layoutPdf(onLayout: (_) => data.bodyBytes);
  }
}