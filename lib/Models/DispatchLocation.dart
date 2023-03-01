class DispatchLocation {
  String name = '';
  String mobile_no = '';

  DispatchLocation();

  DispatchLocation.fromJSON(Map<String, dynamic> jsonMap) {
    jsonMap['name'] != null ? name = jsonMap['name'] : name = '';
    jsonMap['mobile_no'] != null
        ? mobile_no = jsonMap['mobile_no']
        : mobile_no = '';
    // phoneNumber = jsonMap['mobile'];
  }
}
