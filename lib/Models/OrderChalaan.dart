class OrderChalaan {
  late String invoice_id;
  late String chalaan_id;

  OrderChalaan();
  OrderChalaan.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['invoice_id'] != null
        ? invoice_id = jsonMap['invoice_id']
        : invoice_id = '';
    jsonMap['chalaan_id'] != null
        ? chalaan_id = jsonMap['chalaan_id']
        : chalaan_id = '';
  }
}
