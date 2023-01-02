class OrderHistory {
  int id = 0;
  String customer_name = '';
  String customer_address = '';
  String customer_mobile = '';
  String total_amount = '';
  String discount = '';
  String invoice_id = '';
  int isPrinted = 0;
  String description = '';
  int sale_rate = 0;
  String height = '';
  String width = '';
  String length = '';
  String unit = '';
  int qty = 0;
  int product_amount = 0;
  String order_id = '';
  String created_at = '';
  String updated_at = '';

  OrderHistory();

  OrderHistory.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['id'] != null ? id = jsonMap['id'] : id = 0;
    jsonMap['customer_name'] != null
        ? customer_name = jsonMap['customer_name']
        : customer_name = '';
    jsonMap['customer_address'] != null
        ? customer_address = jsonMap['customer_address']
        : customer_address = '';
    jsonMap['customer_mobile'] != null
        ? customer_mobile = jsonMap['customer_mobile']
        : customer_mobile = '';
    jsonMap['total_amount'] != null
        ? total_amount = jsonMap['total_amount']
        : total_amount = '';
    jsonMap['discount'] != null
        ? discount = jsonMap['discount']
        : discount = '';
    jsonMap['invoice_id'] != null
        ? invoice_id = jsonMap['invoice_id']
        : invoice_id = '';
    jsonMap['isPrinted'] != null
        ? isPrinted = jsonMap['isPrinted']
        : isPrinted = 0;
    jsonMap['description'] != null
        ? description = jsonMap['description']
        : description = '';
    jsonMap['sale_rate'] != null
        ? sale_rate = jsonMap['sale_rate']
        : sale_rate = 0;
    jsonMap['height'] != null ? height = jsonMap['height'] : height = '';
    jsonMap['width'] != null ? width = jsonMap['width'] : width = '';
    jsonMap['length'] != null ? length = jsonMap['length'] : length = '';
    jsonMap['unit'] != null ? unit = jsonMap['unit'] : unit = '';
    jsonMap['qty'] != null ? qty = jsonMap['qty'] : qty = 0;
    jsonMap['product_amount'] != null
        ? product_amount = jsonMap['product_amount']
        : product_amount = 0;
    jsonMap['order_id'] != null
        ? order_id = jsonMap['order_id']
        : order_id = '';
    jsonMap['created_at'] != null
        ? created_at = jsonMap['created_at']
        : created_at = '';
    jsonMap['updated_at'] != null
        ? updated_at = jsonMap['updated_at']
        : updated_at = '';
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
