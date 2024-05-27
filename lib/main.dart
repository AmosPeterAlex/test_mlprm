import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_nexteons/screen/login/responsive/lap_login_view.dart';
import 'package:test_nexteons/screen/login/view.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LapLogin(),
    );

    // return GetMaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   // routeInformationParser: router.routeInformationParser,
    //   // routerDelegate: router.routerDelegate,
    //   // routeInformationProvider: router.routeInformationProvider,
    // );
  }
}
