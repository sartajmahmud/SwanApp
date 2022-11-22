import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:swanapp/Models/Product.dart';
import 'package:swanapp/Repositories/ProductRepository.dart';

class OrderController extends ControllerMVC{

  List<Product> products = [];

  getProducts() async {
    products = await getAllProducts();
    for(Product product in products){
      print(product.product_name);
    }
  }
}