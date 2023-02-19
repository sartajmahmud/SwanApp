import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../Models/Fabric.dart';
import '../Models/OrderHistory.dart';
import '../Models/Product.dart';
import '../Models/ProductOrder.dart';
import '../Repositories/OrderRepository.dart';
import '../Repositories/ProductRepository.dart';
import '../Models/Order.dart';
import '../Repositories/FabricRepository.dart';

class OrderController extends ControllerMVC {
  ProductOrder po = ProductOrder();
  List<Product> products = [];

  List<Order> orders = [];

  List<OrderHistory> orderHistory = [];
  late Product? currentSelectedValue;

  List<OrderHistory> orderProducts = [];

  List<Order> chalans = [];
  List<Fabric> fabrics = [];
  getProducts() async {
    products = await getAllProducts();
    // for(Product product in products){
    //   print(product.product_name);
    // }
  }

  setInitProduct() async {
    currentSelectedValue = products[0];
    po.items[0].productID = products[0].id;
  }

  getChalanHistory() async {
    chalans = await getTodaysChalans();
    // for(Order order in chalans){
    //   print(order.product_name);
    // }
  }

  getUniqueOrderData(int OrderId) async {
    orderProducts = [];
    orderProducts = await getuniqueOrderProducts(OrderId);
    setState(() {});
  }

  getOrderHistory() async {
    orderHistory = await getTodaysOrders();
    for (OrderHistory order in orderHistory) {
      //  print(order.customer_name);
    }
    setState(() {});
  }

  getFabrics() async {
    fabrics = await getAllFabrics();
    // for(Fabric fabric in fabrics){
    //   // print(fabric.fabric_name);
    // }
  }

  submitOrder(BuildContext context) async {
    // po.printData();
    print(po.toMap());
    await createOrder(po).then((value) {
      Navigator.pushNamed(context, '/orderHistory');
    });
  }

  getChallanDoc(int ID) async {
    await getChallanPDF(ID);
  }

  getInvoiceDoc(int ID) async {
    var data = await getInvoicePDF(ID);
    await Printing.layoutPdf(onLayout: (_) => data.bodyBytes);
  }

  dispatch() async {}
}
