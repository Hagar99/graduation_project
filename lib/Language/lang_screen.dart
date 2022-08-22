import 'package:miss_nurse/Dr_profile/ProfileScreen.dart';
import 'package:miss_nurse/locale/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../shared_color/gradient_color.dart';

class langScreen extends StatelessWidget{
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
                    if(controllerLang == "en")controllerLang.changeLang("ar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
                  },
                ),
                TextButton(
                  child:Text("en".tr),
                  onPressed: () {
                    if(controllerLang == "ar")controllerLang.changeLang("en");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
                  },
                ),]),
        ),),);
  }
}