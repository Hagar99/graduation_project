import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextForm2({
  String? label,
  String? hint,
  Widget? suffixICon,
  bool isPassword = false,
  Function()? onTap,
  TextEditingController? controller,
}) =>
    Center(
      child: TextField(
        maxLines: null,
        cursorColor: Colors.black87,
        textAlign: TextAlign.left,
        obscuringCharacter: '*',
        keyboardType: TextInputType.multiline,
        obscureText: isPassword,
        onTap: onTap,

        style: const TextStyle(
          //height: .05,
          color: Colors.black,
        ),
        controller: controller,

        decoration: InputDecoration(
          border: InputBorder.none,
          alignLabelWithHint: true,
          suffixIcon: suffixICon,


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

        ),
      ),
    );