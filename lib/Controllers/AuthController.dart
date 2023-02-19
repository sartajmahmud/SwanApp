import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Models/User.dart';
import '../Repositories/AuthRepository.dart';

class AuthController extends ControllerMVC{

  User user = User();
  Future <bool> login(String email, String password) async {
    user.email = email;
    user.password = password;
    bool response = await userLogin(user);
    return response;
  }

   getUser(BuildContext context) async {
    await getCurrentUser();
    if(currentUser.value.auth){
      await getUserZones();
      Navigator.pushReplacementNamed(context, '/zones');
    }else{
      Navigator.pushReplacementNamed(context, '/login');

    }
  }
}