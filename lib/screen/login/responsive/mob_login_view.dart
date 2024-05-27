import 'package:flutter/material.dart';
import 'package:test_nexteons/screen/login/controller/login_controller.dart';
import 'package:test_nexteons/utils/constants/color_constants.dart';

class MobLogin extends StatelessWidget {
  const MobLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final c = LoginController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              // controller: emailC,
              decoration: InputDecoration(
                  // fillColor: Colors.red,
                  fillColor: ColorConstants.textFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              // controller: passC,
              decoration: InputDecoration(
                  fillColor: ColorConstants.textFieldColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                // c.fnOnLogin(email, pass)
              },
              child: Text("Login"),
              // color: ,
            )
          ],
        ),
      ),
    );
  }
}
