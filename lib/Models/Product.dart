class Product{
  int id = 0;
  String product_name = '';
  String product_category = '';
  int rate = 0;
  String size = '';
  String unit = '';
  int attribute = 0;
  String created_at = '';
  String updated_at = '';


  Product();

  Product.fromJSON(Map<String, dynamic> jsonMap) {

  jsonMap['id'] != null ? id  = jsonMap['id'] : id = 0;
  jsonMap['product_name'] != null ? product_name = jsonMap['product_name'] : product_name = '';
  jsonMap['product_category'] != null ? product_category = jsonMap['product_category'] : product_category = '';
  jsonMap['rate'] != null ? rate = jsonMap['rate'] : rate = 0;
  jsonMap['attribute'] != null ? attribute = jsonMap['attribute'] : attribute = 0;
  jsonMap['unit'] != null ? unit = jsonMap['unit'] : unit = '';
  jsonMap['size'] != null ? size = jsonMap['size'] : size = '';
  jsonMap['created_at'] != null ? created_at = jsonMap['created_at'] : created_at = '';
  jsonMap['updated_at'] != null ? updated_at = jsonMap['updated_at'] : updated_at = '';
  // phoneNumber = jsonMap['mobile'];

  }


  Map toMap() {
  var map = new Map<String, dynamic>();
  // map["mobile"]=phoneNumber;
  // map["email"] = email;
  // map["name"] = name;
  // map["password"] = password;
  return map;
  }

}