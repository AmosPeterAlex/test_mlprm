import 'package:flutter/material.dart';
import 'package:test_nexteons/utils/constants/color_constants.dart';

class MobileFrame extends StatelessWidget implements PreferredSizeWidget {
  MobileFrame({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: ColorConstants.primaryColor,
      height: size.height * .1,
      width: size.width,
      // child: Text("mob frame"),
    );
  }
}
