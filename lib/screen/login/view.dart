import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_nexteons/responsive_layout_builder.dart';
import 'package:test_nexteons/screen/login/controller/login_controller.dart';
import 'package:test_nexteons/screen/login/responsive/lap_login_view.dart';
import 'package:test_nexteons/screen/login/responsive/mob_login_view.dart';
import 'package:test_nexteons/screen/login/responsive/tab_login.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;
  final String tag = DateTime.now().toString();

  @override
  void initState() {
    controller = Get.put(LoginController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        macView: LapLogin(
          controller: controller,
        ),
        iPhoneView: MobLogin(
          controller: controller,
        ),
        iPadView: TabLogin(
          controller: controller,
        ));
  }
}
