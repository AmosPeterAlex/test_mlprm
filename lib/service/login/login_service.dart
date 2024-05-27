import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  static fnService(url, body) async {
    try {
      var response =
          await Dio().post(url, data: body);
      if (response.statusCode == 200 || response.statusCode ==201) {
        log("---------${response.statusCode}");
        return response.data;
      } else {
        log("${response.statusCode}");
        log("else ----");
        return response.data;
      }
    } catch (e) {
      log('---------$e');
      log("");
    }
  }
}
