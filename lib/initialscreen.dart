import 'package:miss_nurse/Datebase/databse.dart';
import 'package:miss_nurse/logInScreen/logInScreen.dart';
import 'package:miss_nurse/shared_color/gradient_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miss_nurse/locale/locale_controller.dart';

class InitialScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Locale_controller controllerLang =Get.find();
    return Scaffold(
        body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:gradientColor(),

    child: Align(

    alignment: Alignment.center,
      child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Image.asset('asset/icons/logo.png')),
        ),
        const SizedBox(height: 25),

        ElevatedButton(
      child:  Text("ar".tr),
      onPressed: () {
        controllerLang.changeLang("ar");
        Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => LoginScreen(),
    ));
    },

      ),
      TextButton(
      onPressed: () {
  controllerLang.changeLang("en");
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => LoginScreen(),
  ));
  },


      child:Text("en".tr),

      ),]),
    ),),);
  }
}