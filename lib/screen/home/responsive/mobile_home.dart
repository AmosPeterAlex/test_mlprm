import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:test_nexteons/screen/home/controller/home_controller.dart';

import '../../../utils/constants/color_constants.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Container(
                  color: ColorConstants.primaryColor,
                  height: size.height * .25,
                  width: size.width,
                ),
              ),
              Positioned(
                left: 30,
                top: 13,
                child: Container(
                  height: size.height * .1,
                  width: size.width * .1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/81d7/428b/5352d4f67d0896ac8aa863578040dfef?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nFi8OojmIKmMaZgDsV4OD4PZwVuB36-t~4w3A8axCMECQw2MRUqAAS8N9FHeIpUX3uXCTwDb8vAhD0stfIg9WM8YO1H~1-TynkATAMzEsNx5vLa5VSWtO~gCrjAtsc25LKQymhHX1fOQvoxMAJTWWToGJ7omhvQ5uMqUu80AOsn1ucGrdK6TK01g-KwTOOD5WNCHCl9hXQE~EEww5ltK5OLUwk~uBiKDd7Xvoj0IqCYJgpByKI69R20X-w40kEwvXYhm8GRVMq9XIp~mo1hXHux-bMoDl57v41c5e1XC-SOD7wvDdt4-IU4tiQytZdKbHroqYtXimO5it3dYm6nz1A__"),
                  )),
                ),
              ),
              Positioned(
                right: 30,
                top: 13,
                child: Container(
                    height: size.height * .1,
                    width: size.width * .1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://s3-alpha-sig.figma.com/img/0732/937e/b001854929de7b074e01862eb564ea3f?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EuOnzcRCzriysUDtjrfrjbPH2OJNla9yo9CShnEIPomG8YTUqoWQzY4kKL~nZl7p68GwZgTlW6wlsBXU~E3ZoMdYjYL39zE1lsEWdY9OYxKnE39KyaOkBFsmR3J-LOiqnokASZzhglMEeKOENx38vTEfhywkaVHBTzIH8uI0uPKWM1CQ~50wxZpUfZSgqgyVzts0a5B3KuRmDcUu64DqGBxLqrTTsam0Oc0TuldZBEbX32lVx4mgbi8f49VCf0Oc13sGls3e~pXcZwjzJDrWqBtwczr0hibAaiSHWRfDDzUVDPGTo3sO2ou-hYBhIZurbhLKq5ux2WP4IFDjsq92sA__")),
                    )),
              ),
              Positioned(
                  top: 55,
                  left: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Emergency Kit",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        "We know migraines at school can be a real bummer, but you're a superhero for handling \nthem like a champ!\n\n Your emergency kit is here to save the day and make you feel better.",
                        style: TextStyle(fontSize: 9.8),
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: size.height * .01,
          ),
          SizedBox(
            height: size.height*.64,
            child: Expanded(
              child: Obx(() {
                if (homeController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (homeController.homeModel.value.data?.list?.isEmpty ??
                    true) {
                  return Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: homeController.homeModel.value.data!.list!.length,
                    itemBuilder: (context, index) {
                      var listItem =
                          homeController.homeModel.value.data!.list![index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listItem.name ?? 'No Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                listItem.details ?? 'No Details',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          )
        ],
      ),
      //set a frame to shell route all buttons
// floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.primaryColor,
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
