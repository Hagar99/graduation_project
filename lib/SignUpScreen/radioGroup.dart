import 'package:miss_nurse/SignUpScreen/signUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miss_nurse/locale/locale_controller.dart';



class RadioGroup extends StatefulWidget
{

  Locale_controller controllerLang =Get.find();
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}


class RadioGroupWidget extends State {
  // Default Radio Button Selected Item When App Starts.

  // Group Value for Radio Button.
  int id = 1;

  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          value: 1,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              radioButtonItem = "D";
              id = 1;
            });
          },
        ),
        Text(
          "doctor".tr,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20,),
        Radio(
          value: 2,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              radioButtonItem = "N";
              id = 2;
            });
          },
        ),
        Text(
          "nurse".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
