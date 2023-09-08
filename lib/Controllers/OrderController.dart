import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:swanapp/Models/Chalaan.dart';
import 'package:swanapp/Models/DispatchLocation.dart';
import 'package:swanapp/Models/DispatchProduct.dart';
import 'package:swanapp/Models/OrderChalaan.dart';
import '../Models/Fabric.dart';
import '../Models/OrderHistory.dart';
import '../Models/Product.dart';
import '../Models/ProductOrder.dart';
import '../Repositories/OrderRepository.dart';
import '../Repositories/ProductRepository.dart';
import '../Models/Order.dart';
import '../Repositories/FabricRepository.dart';

class OrderController extends ControllerMVC {
  DispatchProduct dp = DispatchProduct();
  ProductOrder po = ProductOrder();
  List<Product> products = [];

  List<Order> orders = [];

  List<OrderHistory> orderHistory = [];
  List<OrderHistory> factoryOrderHistory = [];
  late Product? currentSelectedValue;
  late DispatchLocation? currentSelectedLocation;
  late Fabric? currentSelectedFabric;

  List<OrderHistory> orderProducts = [];

  List<Chalaan> chalans = [];
  List<OrderChalaan> orderchalans = [];
  List<Fabric> fabrics = [];
  List<DispatchLocation> dispatchLocations = [];

  bool loading = false;

  updateChalaanDataWithSelectedDate(String date) async {
    await getChalanHistory(date);
    // await getOrderHistory(date);
    setState(() {});
  }

  updateOrderDataWithSelectedDate(String date) async {
    await getOrderHistory(date);
    setState(() {});
  }

  getDispatchLoc() async {
    dispatchLocations = await getAllDispatchLocation();
    for (DispatchLocation product in dispatchLocations) {
      print(product.name);
      print(product.mobile_no);
    }
  }

  getProducts() async {
    products = await getAllProducts();
    // for(Product product in products){
    //   print(product.product_name);
    // }
  }
  // setInitDispatchLocation() async {
  //   currentSelectedLocation = dispatchLocations[0];
  //   print(dispatchLocations);
  //   print("007");
  //   // po.items[0].productID = products[0].id;
  // }

  setInitProduct() async {
    currentSelectedValue = products[0];
    po.items[0].productID = products[0].id;
  }

  Future setInitLocation() async {
    currentSelectedLocation = dispatchLocations[0];
    po.items[0].dispatchLocation = dispatchLocations[0].mobile_no;
  }
  Future setInitFabric() async {
    currentSelectedFabric = fabrics[0];
    po.items[0].fabID = fabrics[0].id;
  }

  getUniqueOrderData(int OrderId) async {
    orderProducts = [];
    orderProducts = await getuniqueOrderProducts(OrderId);
    setState(() {});
    for (OrderHistory oh in orderProducts) {
      dp.dispatchItems.add([oh.id, 0]);
    }
  }

  getOrderData(int OrderId) async {
    orderProducts = [];
    orderProducts = await getOrderProducts(OrderId);
    setState(() {});
    for (OrderHistory oh in orderProducts) {
      dp.dispatchItems.add([oh.id, 0]);
    }
  }

  getOrderHistory(String date) async {
    setState(() {
      loading = true;
    });
    orderHistory = await getTodaysOrders(date);
    // for (OrderHistory order in orderHistory) {
    //   //  print(order.customer_name);
    // }
    setState(() {
      loading = false;
    });
  }

  getChalanHistory(String date) async {
    setState(() {
      loading = true;
    });
    print("chalan");
    chalans = await getTodaysChalans(date);
    print("chalan");
    // for(Chalaan order in chalans){
    //   print(order.chalaan_id);
    // }
    setState(() {
      loading = false;
    });
  }

  getOrderChalan(String ID) async {
    setState(() {
      loading = true;
    });
    orderchalans = await getOrderChalans(ID);
    // for (OrderChalaan order in orderchalans) {
    //   print(order.chalaan_id);
    // }
    setState(() {
      loading = false;
    });
  }

  getPreviousOrderHistory(String date) async {
    orderHistory = await getTodaysOrders(date);
    for (OrderHistory order in orderHistory) {
      //  print(order.customer_name);
    }
    setState(() {});
  }

  // getFactoryOrderHistory(String date) async {
  //   factoryOrderHistory = await getTodaysFactoryOrders(date);
  //   for (OrderHistory order in factoryOrderHistory) {
  //     // print(order.total_amount);
  //   }
  //   setState(() {});
  // }

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

  getChallanDoc(String ID) async {
    var data = await getChallanPDF(ID);
    await Printing.layoutPdf(onLayout: (_) => data.bodyBytes);
  }

  getInvoiceDoc(int ID) async {
    var data = await getInvoicePDF(ID);
    await Printing.layoutPdf(onLayout: (_) => data.bodyBytes);
  }

  dispatch() async {
    await DispatchProducts(dp);
  }
}
