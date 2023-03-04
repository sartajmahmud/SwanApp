class Chalaan{
  late String invoice_id;
  late String chalaan_id;
  late String customer_name;
  late String customer_mobile;


  Chalaan();
  Chalaan.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['invoice_id'] != null ? invoice_id  = jsonMap['invoice_id'] : invoice_id = '';
    jsonMap['chalaan_id'] != null ? chalaan_id = jsonMap['chalaan_id'] : chalaan_id = '';
    jsonMap['customer_name'] != null ? customer_name = jsonMap['customer_name'] : customer_name = '';
    jsonMap['customer_mobile'] != null ? customer_mobile = jsonMap['customer_mobile'] : customer_mobile = '';
    // phoneNumber = jsonMap['mobile'];

  }
}