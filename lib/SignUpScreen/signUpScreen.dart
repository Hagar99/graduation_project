import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miss_nurse/SignUpScreen/radioGroup.dart';
import 'package:miss_nurse/locale/locale_controller.dart';
import 'package:miss_nurse/confirmationScreen/confirmationPage.dart';
import 'package:miss_nurse/shared_color/gradient_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';
import 'package:get/get.dart';

String radioButtonItem = "D";
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController userNameController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController idNumberController = TextEditingController();
final TextEditingController sectionNameController = TextEditingController();

Locale_controller controllerLang = Get.find();

class SignUpScreen extends StatefulWidget {
  Locale_controller controllerLang = Get.find();
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final _auth = FirebaseAuth.instance;
String? errorMessage;

final _formKey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: gradientColor(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 25),
                  Center(
                    child: Text(
                      "signup".tr,
                      style: const TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      onSaved: (value) {
                        userNameController.text = value!;

                      },
                      textInputAction: TextInputAction.next,

                      // onChanged: (textValue){
                      //   userName=textValue;
                      // },
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return "1".tr;
                        }
                        if (!regex.hasMatch(value)) {
                          return "2".tr;
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 20),
                          child: CircleAvatar(
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 50,
                              ),
                              backgroundColor: Color.fromRGBO(50, 165, 248, 1),
                              radius: 30),
                        ),
                        labelText: "username".tr,
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: idNumberController,
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      onSaved: (value) {
                        idNumberController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      // onChanged: (idValue){
                      //      idNumber=idValue;
                      //      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter ID number';
                        }
                        else if(value.length != 14)
                          {
                            return 'please enter valid ID number';
                          }
                        return null;
                      },
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 20),
                          child: CircleAvatar(
                              child: Icon(
                                Icons.web_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              backgroundColor: Color.fromRGBO(50, 165, 248, 1),
                              radius: 30),
                        ),
                        labelText: "id Number".tr,
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                        {
                          return 'please enter email';
                        }
                           else if(!value.isEmail)
                        {
                            return 'Enter Vaild Email';
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 20),
                          child: CircleAvatar(
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 40,
                              ),
                              backgroundColor: Color.fromRGBO(50, 165, 248, 1),
                              radius: 30),
                        ),
                        labelText: "email".tr,
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      autofocus: false,
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 20),
                          child: CircleAvatar(
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 40,
                              ),
                              backgroundColor: Color.fromRGBO(50, 165, 248, 1),
                              radius: 30),
                        ),
                        labelText: "password".tr,
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      onSaved: (value) {
                        phoneNumberController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter phone Number';
                        }
                       else if(!value.isPhoneNumber)
                         {
                           return 'please enter a correct number';
                         }
                        return null;
                      },
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsetsDirectional.only(end: 20),
                          child: CircleAvatar(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 40,
                              ),
                              backgroundColor: Color.fromRGBO(50, 165, 248, 1),
                              radius: 30),
                        ),
                        labelText: "phone Number".tr,
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  DropdownButton(
                    hint:  sectionNameController.text == ""
                        ? const Text('Section Name', style: TextStyle(color: Colors.white,fontSize: 20),
                    )
                        : Text(
                      sectionNameController.text,
                      style:const TextStyle(color: Colors.white ,fontSize: 20),

                    ),
                    isExpanded: true,
                    iconSize: 40.0,
                    style: const TextStyle(color: Colors.indigo),
                    items: ["Dermatology", "Oncology", "Physiotherapy", "Organ Transplantation", "Internal Medicine", "Cardiology", "Cosmetic Surgery", "Radiology", "Clinical Pathology"].map(
                          (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          sectionNameController.text = val.toString();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  RadioGroup(),
                  const SizedBox(height: 25),
                  //
                  ElevatedButton(
                      child: Text(
                        "confirm".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        //onSurface: surfaceColor,
                        fixedSize: const Size(double.infinity, 60),
                        primary: Colors.blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      onPressed: () {

                        Navigator.pushAndRemoveUntil(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => confirmationPage(phoneNumberController.text)),
                                (route) => false);

                      }
                      // ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

void signUp(String email, String password) async {
  if (_formKey.currentState!.validate()) {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "3".tr;
          break;
        case "wrong-password":
          errorMessage = "4".tr;
          break;
        case "user-not-found":
          errorMessage = "5".tr;
          break;
        case "user-disabled":
          errorMessage = "6".tr;
          break;
        case "too-many-requests":
          errorMessage = "7".tr;
          break;
        case "operation-not-allowed":
          errorMessage = "8".tr;
          break;
        default:
          errorMessage = "9".tr;
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}

postDetailsToFirestore() async {
  // calling our firestore
  // calling our user model
  // sedning these values

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = _auth.currentUser;

  UserModel userModel = UserModel();

  // writing all the values
  userModel.email = user!.email;
  userModel.uid = user.uid;
  userModel.userName = userNameController.text;
  userModel.sectionName = sectionNameController.text;
  userModel.idNumber = idNumberController.text;
  userModel.phoneNumber = phoneNumberController.text;

  await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "10 ".tr);

  // Navigator.pushAndRemoveUntil(
  //     (context),
  //     MaterialPageRoute(
  //         builder: (context) => confirmationPage(phoneNumberController.text)),
  //     (route) => false);
}