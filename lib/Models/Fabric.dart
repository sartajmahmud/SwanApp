class Fabric{
  int id = 0;
  String fabric_name = '';
  String fabric_type = '';
  String fabric_dimension = '';
  int fabric_rate = 0;
  String created_at = '';
  String updated_at = '';


  Fabric();

  Fabric.fromJSON(Map<String, dynamic> jsonMap) {

    jsonMap['id'] != null ? id  = jsonMap['id'] : id = 0;
    jsonMap['fabric_name'] != null ? fabric_name = jsonMap['fabric_name'] : fabric_name = '';
    jsonMap['fabric_type'] != null ? fabric_type = jsonMap['fabric_type'] : fabric_type = '';
    jsonMap['fabric_dimension'] != null ? fabric_dimension = jsonMap['fabric_dimension'] : fabric_dimension = '';
    jsonMap['fabric_rate'] != null ? fabric_rate = jsonMap['fabric_rate'] : fabric_rate = 0;
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