import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_nexteons/screen/global_widgets/text_field.dart';
import 'package:test_nexteons/screen/login/controller/login_controller.dart';
import 'package:test_nexteons/utils/constants/color_constants.dart';

class MobLogin extends StatelessWidget {
  final LoginController controller;
  MobLogin({super.key, required this.controller});
  // var emailC = TextEditingController();
  // var passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final controller = LoginController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: size.height * .15,
                  width: size.width * .15,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/81d7/428b/5352d4f67d0896ac8aa863578040dfef?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nFi8OojmIKmMaZgDsV4OD4PZwVuB36-t~4w3A8axCMECQw2MRUqAAS8N9FHeIpUX3uXCTwDb8vAhD0stfIg9WM8YO1H~1-TynkATAMzEsNx5vLa5VSWtO~gCrjAtsc25LKQymhHX1fOQvoxMAJTWWToGJ7omhvQ5uMqUu80AOsn1ucGrdK6TK01g-KwTOOD5WNCHCl9hXQE~EEww5ltK5OLUwk~uBiKDd7Xvoj0IqCYJgpByKI69R20X-w40kEwvXYhm8GRVMq9XIp~mo1hXHux-bMoDl57v41c5e1XC-SOD7wvDdt4-IU4tiQytZdKbHroqYtXimO5it3dYm6nz1A__"),
                  )),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              TextFieldWidget(
                controller: controller.emailC,
                hintText: "Email",
                fillColor: ColorConstants.textFieldColor,
                height: size.height * .1,
                width: size.width * .8,
              ),
              // TextFormField(
              //   // controller: emailC,
              //   decoration: InputDecoration(
              //       // fillColor: Colors.red,
              //       fillColor: ColorConstants.textFieldColor,
              //       filled: true,
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10))),
              // ),
              SizedBox(
                height: size.height * .03,
              ),
              TextFieldWidget(
                  controller: controller.passC,
                  hintText: "Password",
                  fillColor: ColorConstants.textFieldColor,
                  height: size.height * .1,
                  width: size.width * .8),
              SizedBox(
                height: size.height * .03,
              ),
              // TextFormField(
              //   // controller: passC,
              //   decoration: InputDecoration(
              //       fillColor: ColorConstants.textFieldColor,
              //       filled: true,
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10))),
              // ),
              // SizedBox(
              // height: 15,
              // ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("Forgot Password"),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                height: size.height * .054,
                width: size.width * .8,
                child: MaterialButton(
                //  onPressed: controller.fnOnLogin(controller.emailC.text, controller.passC.text),
                  onPressed: () {
                    controller.fnOnLogin(
                        controller.emailC.text, controller.passC.text);
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
    );
  }
}
