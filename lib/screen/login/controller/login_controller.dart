import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// class LoginController extends GetxController {
//   var response = {};
// }
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_nexteons/config/app_config.dart';
import 'package:test_nexteons/service/login/login_service.dart';

class LoginController extends GetxController {
  // var header = Constants.headerWithoutToken;
  // var body = Payload.loginPayload();
  // final baseUrl = "https://migrainetracker.api.salonsyncs.com/";
  var url = "${AppConfig.baseUrl}api/user/login";

  fnOnLogin(String email, String pass) async {
    var body = {"email": "fayiz1727@gmail.com", "password": "1234"};
    // var body = {"email": "fayiz1727@gmail.com", "password": "1234"};
    var resBody = await LoginService.loginService(url, body);

    if (resBody['data'] != null) {
      var id = resBody['data'];
      var name = resBody['data']['_email'];
      log('---------{$id}'); //working
      log('---------{$name}');
      // Get.to(HomePage);
    } else {
      log("else in controller");
    }
  }
}


 // fnStoreToken(token) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // sharedPreferences.setString(Constants.kLoginData, token);
  // }

  // getToken() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var token = preferences.getString(Constants.kLoginData);
  //   return token;
  // }