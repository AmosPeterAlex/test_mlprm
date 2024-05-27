import 'package:flutter/material.dart';

import 'utils/constants/size_functions.dart';
// import 'package:nexteons_internship_task/utils/constants/size_check.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget mobView;
  final Widget tabView;
  final Widget lapView;

  ResponsiveLayoutBuilder(
      {super.key,
      required this.lapView,
      required this.mobView,
      required this.tabView});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return Scaffold();
    return LayoutBuilder(
      builder: (context, constraints) {
        if (fnCheckIphone(size.width)) {
          return mobView;
        } else if (fnCheckIPad(size.width)) {
          return tabView;
        } else {
          return lapView;
        }
      },
    );
  }
}
