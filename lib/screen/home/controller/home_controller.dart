import 'dart:developer';
import 'package:get/get.dart';
import '../../../config/app_config.dart';
import '../../../model/home_model.dart';
import '../../../service/login/login_service.dart';

class HomeController extends GetxController {
  var homeModel = HomeModel().obs;
  var isLoading = false.obs;

  var url = "${AppConfig.baseUrl}api/emergency-kit/list";

  var data = {
    "sortType": 0,
    "sortOrder": -1,
    "statusArray": [1],
    "screenType": [0],
    "emergencyKitIds": [],
    "userIds": ["6634db7665f74a0faeb0abc9"],
    "limit": -1,
    "skip": -1,
    "searchingText": ""
  };
  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  void fetchHomeData() async {
    try {
      isLoading.value = true;
      var response = await ApiService.fnService(url, data);
      if (response != null) {
        homeModel.value = HomeModel.fromJson(response);
      } else {
        log("----Error fetching data");
      }
    } catch (e) {
      log("---->>>> $e");
    } finally {
      isLoading.value = false;
    }
  }
}
