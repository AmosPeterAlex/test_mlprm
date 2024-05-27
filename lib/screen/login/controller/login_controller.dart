import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// class LoginController extends GetxController {
//   var response = {};
// }
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:test_nexteons/config/app_config.dart';
import 'package:test_nexteons/screen/home/view_home.dart';
import 'package:test_nexteons/service/login/login_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:your_project_name/services/login_service.dart'; // Adjust the import path as necessary
// import 'package:your_project_name/config/app_config.dart'; // Adjust the import path as necessary

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
        //  GoRouter.of(navigatorKey.currentContext!).goNamed(RouteNames.listPage);
      } else {
        log("else in controller");
      }
    }
  }
}



/*
working without validation
class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var emailC = TextEditingController();
  var passC = TextEditingController();
  // var header = Constants.headerWithoutToken;
  // var body = Payload.loginPayload();
  // final baseUrl = "https://migrainetracker.api.salonsyncs.com/";
  var url = "${AppConfig.baseUrl}api/user/login";

  fnOnLogin(String email, String pass) async {
    var body = {"email": emailC.text, "password": passC.text};
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
*/


 // fnStoreToken(token) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // sharedPreferences.setString(Constants.kLoginData, token);
  // }

  // getToken() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var token = preferences.getString(Constants.kLoginData);
  //   return token;
  // }