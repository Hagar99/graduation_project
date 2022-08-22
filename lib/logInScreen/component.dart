import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButtton({
  Color? backGround,
  String? txt,
  Function()? onPress,
}) =>
    ElevatedButton(
      child: Text(
        txt!,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 22.0,
        ),
      ),


      style: ElevatedButton.styleFrom(
        //onSurface: surfaceColor,
        minimumSize: const Size(double.infinity, 50),
        primary: backGround,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
      onPressed: onPress,
    );

Widget defaultTextForm({
  String? label,
  String? hint,
  String? imagePath,

  TextInputType? type,
  Widget? suffixICon,
  bool isPassword = false,
  Function()? onTap,
  TextEditingController? controller,
}) =>
    Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white12,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Center(
        child: Center(
          child: TextFormField(

            validator: (value){
              if(value==null||value.isEmpty){
                return'please enter '+ label!;
              }
              return null;
            },
            cursorColor: Colors.white,

            textAlign: TextAlign.start,
            obscuringCharacter: '*',
            keyboardType: type,
            obscureText: isPassword,
            onTap: onTap,
            style: const TextStyle(
              //height: .05,
              color: Colors.white,
            ),
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              alignLabelWithHint: true,
              suffixIcon: suffixICon,
              floatingLabelBehavior:FloatingLabelBehavior.auto,
              // focusedBorder: const OutlineInputBorder(
              //   borderSide: BorderSide(color: Color(0xFF32A5F8),),
              //   borderRadius: BorderRadius.all(Radius.circular(5)),
              // ),
              // enabledBorder: const OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.white,),
              //   borderRadius: BorderRadius.all(Radius.circular(5)),
              // ),

              hintText: hint,
              labelText: label,

              labelStyle: const TextStyle(
                fontSize: 15,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),

              hintStyle: const TextStyle(
                color: Colors.grey,
                textBaseline: TextBaseline.alphabetic,
                fontSize: 15,
              ),
              //  icon:

              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 20),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xFF32A5F8),
                  // 0xFF for spcifying  transparency
                  child: Image.asset(
                    imagePath!,
                    alignment: AlignmentDirectional.center,
                    width: 38,
                    height: 37,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
