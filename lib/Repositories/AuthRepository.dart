

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/User.dart';
import '../constants.dart';


ValueNotifier <User> currentUser = new ValueNotifier(User());


void setCurrentUser(jsonString) async {
  print("this is current user ");
  try {
    if (json.decode(jsonString)['data'] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('current_user', json.encode(json.decode(jsonString)['data']));
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
    currentUser.value = User.fromJSON(json.decode(await prefs.get('current_user').toString()));
    currentUser.value.auth = true;
  } else {
    currentUser.value.auth = false;
  }
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  currentUser.notifyListeners();
  return currentUser.value;
}

Future <bool> userLogin(User user) async {

  Uri url = Uri.http(serverUrl, 'api/login');

  bool x = false;

  http.Response response = await http.post(url,
      body: user.toMap()
  );
  Map result = jsonDecode(response.body);
  print(result);

  if (response.statusCode == 200) {
    // print(User.fromJSON(result['data']).name);
    setCurrentUser(response.body);

    currentUser.value = User.fromJSON(result['data']);
  }

  result['message'] == "User login successfully." ? x = true : x = false;

  return x;


}

Future<void> logout() async {
  currentUser.value = new User();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('current_user');
}

