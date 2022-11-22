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
      Navigator.pushNamed(context, '/home');
    }else{
      Navigator.pushNamed(context, '/login');

    }
  }
}