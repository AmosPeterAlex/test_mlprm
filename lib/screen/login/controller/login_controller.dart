import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go_router/go_router.dart';
import 'package:test_nexteons/config/app_config.dart';
import 'package:test_nexteons/service/login/login_service.dart';
import 'package:test_nexteons/utils/constants/app_constants.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var emailC = TextEditingController();
  var passC = TextEditingController();
  var url = "${AppConfig.baseUrl}api/user/login";

  fnOnLogin(String emailC, String passC) async {
    if (formKey.currentState!.validate()) {
      var body = {"email": emailC, "password": passC};
      var resBody = await LoginService.loginService(url, body);

      if (resBody['data']['_id'] != null) {
        var id = resBody['data'];
        var name = resBody['data']['_email'];
        log('---------{$id}'); //working
        log('---------{$name}');
        // Get.to(HomeView());
        // Get.off(()=>HomeView());//working with getx alone
        GoRouter.of(navigatorKey.currentContext!).goNamed("Home");
      } else {
        log("else in controller");
      }
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