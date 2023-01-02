class Fabric{
  int id = 0;
  int fabric_rate = 0;
  String fabric_type = '';
  String created_at = '';
  String updated_at = '';
  String fabric_name = '';


  Fabric();

  Fabric.fromJSON(Map<String, dynamic> jsonMap) {

    jsonMap['id'] != null ? id  = jsonMap['id'] : id = 0;
    jsonMap['fabric_rate'] != null ? fabric_rate = jsonMap['fabric_rate'] : fabric_rate = 0;
    jsonMap['fabric_type'] != null ? fabric_type = jsonMap['fabric_type'] : fabric_type = '';
    jsonMap['fabric_name'] != null ? fabric_name = jsonMap['fabric_name'] : fabric_name = '';
    jsonMap['created_at'] != null ? created_at = jsonMap['created_at'] : created_at = '';
    jsonMap['updated_at'] != null ? updated_at = jsonMap['updated_at'] : updated_at = '';
    // phoneNumber = jsonMap['mobile'];

  }
}