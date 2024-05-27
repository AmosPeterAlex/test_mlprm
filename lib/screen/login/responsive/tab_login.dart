import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_nexteons/screen/global_widgets/text_field.dart';
import 'package:test_nexteons/screen/login/controller/login_controller.dart';
import 'package:test_nexteons/utils/constants/color_constants.dart';

class TabLogin extends StatelessWidget {
  final LoginController controller;
  TabLogin({super.key, required this.controller});
  // var emailC = TextEditingController();
  // var passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final controller = Get.put(LoginController());
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height,
            // width: size.width * .6,
            width: 400,
            color: ColorConstants.primaryColor,
            // dec
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: size.height * .5,
                  width: size.width * .4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/81d7/428b/5352d4f67d0896ac8aa863578040dfef?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nFi8OojmIKmMaZgDsV4OD4PZwVuB36-t~4w3A8axCMECQw2MRUqAAS8N9FHeIpUX3uXCTwDb8vAhD0stfIg9WM8YO1H~1-TynkATAMzEsNx5vLa5VSWtO~gCrjAtsc25LKQymhHX1fOQvoxMAJTWWToGJ7omhvQ5uMqUu80AOsn1ucGrdK6TK01g-KwTOOD5WNCHCl9hXQE~EEww5ltK5OLUwk~uBiKDd7Xvoj0IqCYJgpByKI69R20X-w40kEwvXYhm8GRVMq9XIp~mo1hXHux-bMoDl57v41c5e1XC-SOD7wvDdt4-IU4tiQytZdKbHroqYtXimO5it3dYm6nz1A__"),
                  )),
                ),
                Text(
                  "MISSION MIGRAINE",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Empower yourself with a Migraine-Free\n Academic Journey!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            // child: Image.network("https://s3-alpha-sig.figma.com/img/81d7/428b/5352d4f67d0896ac8aa863578040dfef?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nFi8OojmIKmMaZgDsV4OD4PZwVuB36-t~4w3A8axCMECQw2MRUqAAS8N9FHeIpUX3uXCTwDb8vAhD0stfIg9WM8YO1H~1-TynkATAMzEsNx5vLa5VSWtO~gCrjAtsc25LKQymhHX1fOQvoxMAJTWWToGJ7omhvQ5uMqUu80AOsn1ucGrdK6TK01g-KwTOOD5WNCHCl9hXQE~EEww5ltK5OLUwk~uBiKDd7Xvoj0IqCYJgpByKI69R20X-w40kEwvXYhm8GRVMq9XIp~mo1hXHux-bMoDl57v41c5e1XC-SOD7wvDdt4-IU4tiQytZdKbHroqYtXimO5it3dYm6nz1A__"),
          ),
          Center(
            child: Container(
              // color: Colors.amber,
              height: size.height - 50,
              width: size.width * .3,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Back! Glad to\nsee you again"),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      TextFieldWidget(
                        controller: controller.emailC,
                        hintText: "Email",
                        fillColor: ColorConstants.textFieldColor,
                        height: size.height * .1,
                        width: size.width * .28,
                      ),
                      // Container(
                      // height: size.height * .1,
                      // width: size.width * .28,
                      //   child: TextFormField(
                      //     controller: emailC,
                      //     // validator: this field is required,
                      //     decoration: InputDecoration(
                      //         fillColor: ColorConstants.textFieldColor,
                      //         filled: true,
                      //         hintText: "Email",
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide: BorderSide.none)),
                      //   ),
                      // ),
                      SizedBox(
                        height: size.height * .022,
                      ),
                      // Container(
                      //   height: size.height * .1,
                      //   width: size.width * .28,
                      //   child: TextFormField(
                      //     controller: passC,
                      //     decoration: InputDecoration(
                      //         fillColor: ColorConstants.textFieldColor,
                      //         filled: true,
                      //         hintText: "Password",
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide: BorderSide.none)),
                      //   ),
                      // ),
                      TextFieldWidget(
                          controller: controller.passC,
                          hintText: "Password",
                          fillColor: ColorConstants.textFieldColor,
                          height: size.height * .1,
                          width: size.width * .28),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Forgot Password"),
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Container(
                        height: size.height * .054,
                        width: size.width * .2,
                        child: MaterialButton(
                          // onPressed: controller.fnOnLogin(controller.emailC.text, controller.passC.text),
                          onPressed: () {
                            // controller.fnOnLogin(
                            //     controller.emailC.text, controller.passC.text);
                          },
                          child: Text("Login"),
                          color: ColorConstants.primaryColor,
                          // color: ,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * .03,
          )
        ],
      ),
    );
  }
}
/*
mob inte pole ola view
Center(
        child: Column(
          children: [
            TextFormField(
              controller: emailC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                c.fnOnLogin(emailC.text, passC.text);
              },
              child: Text("Login"),
              // color: ,
            )
          ],
        ),
      ),
*/