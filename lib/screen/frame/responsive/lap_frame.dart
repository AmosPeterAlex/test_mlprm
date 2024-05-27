import 'package:flutter/material.dart';
import 'package:test_nexteons/utils/constants/color_constants.dart';

class LapFrame extends StatelessWidget {
  const LapFrame({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: ColorConstants.primaryColor,
      height: size.height * .35,
      width: size.width,
      child: Text("lap/ipad frame"),
    );
  }
}
