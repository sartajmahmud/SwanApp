class User{

  String token = '';
  String name = '';
  String email = '';
  String password = '';
  // String phoneNumber = '';
  bool auth = false;
  String currentZone = '';
  List zones = [];


  User();
  User.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['token'] != null ? token  = jsonMap['token'] : token = '';
    jsonMap['name'] != null ? name = jsonMap['name'] : name = '';
    jsonMap['email'] != null ? email = jsonMap['email'] : email = '';
    // phoneNumber = jsonMap['mobile'];

  }


  Map toMap() {
    var map = new Map<String, dynamic>();
    // map["mobile"]=phoneNumber;
    map["email"] = email;
    map["name"] = name;
    map["password"] = password;
    return map;
  }
}