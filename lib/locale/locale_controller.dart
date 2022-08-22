
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Locale_controller extends GetxController{
void changeLang(String codeLang){

Locale locale=Locale(codeLang);
Get.updateLocale(locale);
}


}