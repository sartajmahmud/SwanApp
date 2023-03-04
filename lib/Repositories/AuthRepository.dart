import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/User.dart';
import '../constants.dart';

ValueNotifier<User> currentUser = new ValueNotifier(User());

void setCurrentUser(jsonString, email) async {
  print("this is current user ");
  try {
    if (json.decode(jsonString)['data'] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map x = json.decode(jsonString)['data'];
      x['email'] = email;
      await prefs.setString('current_user', json.encode(x));
    }
  } catch (e) {
    print("this is current user catch");
    // print(CustomTrace(StackTrace.current, message: jsonString).toString());
    throw new Exception(e);
  }
}

Future<User> getCurrentUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.clear();
  if (prefs.containsKey('current_user')) {
    currentUser.value =
        User.fromJSON(json.decode(await prefs.get('current_user').toString()));
    currentUser.value.auth = true;
  } else {
    currentUser.value.auth = false;
  }
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  currentUser.notifyListeners();
  return currentUser.value;
}

Future<List> getUserZones() async {
  // print(currentUser.value.email);
  // print(currentUser.value.token);
  Uri url = Uri.https(
    serverUrl,
    'api/get-area/${currentUser.value.email}',
  );

  http.Response response = await http.post(url,
      headers: {"Authorization": "Bearer ${currentUser.value.token}"});
  // print(response.body);
  Map<String, dynamic> result = jsonDecode(response.body);
  List result2 = result['data'];
  // print(result['data']);
  currentUser.value.zones = result2.map((e) => e['name']).toList();
  // print("curuser == ${currentUser.value.zones}");
  return result2.map((e) => e['name']).toList();
  // return result2.map((e) => OrderHistory.fromJSON(e)).toList();
}

Future<bool> userLogin(User user) async {
  Uri url = Uri.http(serverUrl, 'api/login');

  bool x = false;

  http.Response response = await http.post(url, body: user.toMap());
  Map result = jsonDecode(response.body);
  // print(result);

  if (response.statusCode == 200) {
    // print(User.fromJSON(result['data']).name);
    setCurrentUser(response.body, user.email);

    currentUser.value = User.fromJSON(result['data']);
    currentUser.value.email = user.email;
  }

  result['message'] == "User login successfully." ? x = true : x = false;

  return x;
}

Future<void> logout() async {
  currentUser.value = new User();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('current_user');
}
