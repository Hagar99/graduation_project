import 'package:flutter/material.dart';

BoxDecoration  gradientColor ()
{
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff042246),
        Color(0xff041e3e),
        Color(0xff1a5aa0),
        Color(0xff01060c),
        Color(0xff01070e)
      ],
      stops: [0.0, 0.0, 0.01, 0.760, 9.80],
    ),
  );
}