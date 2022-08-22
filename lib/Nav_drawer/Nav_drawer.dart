
import 'package:miss_nurse/Language/lang_screen.dart';
import 'package:miss_nurse/data_list.dart';
import 'package:miss_nurse/shared_color/gradient_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miss_nurse/initialscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class NavDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            navBox(),
            const SizedBox(
              height: 20,
            ),
            navItem(
              onTap:(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> langScreen()));} ,
              txt: const Text('Language'),
              icon: const Icon(
                Icons.language,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            navItem(
              txt: const Text('Settings'),
              icon: const Icon(
                Icons.settings,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            navItem(
              onTap: (() async{
                await _auth.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> InitialScreen()));
              }),
              txt: const Text('Log out'),
              icon: const Icon(
                Icons.logout,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

Widget navItem({
  Widget? txt,
  Widget? icon,
  Function()? onTap,
}) =>
    ListTile(
      title: txt,
      leading: icon,
      onTap: onTap,
    );

Widget navBox() => Container(
  decoration: gradientColor(),
  height: 250,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset('asset/shapes/circle.png'),
          Image.asset('asset/icons/male-avatar.png'),
        ],
      ),
       Padding(
        padding:const EdgeInsets.only(
          top: 15,
        ),
        child:  Text(
          'k',
        //
          //  '${usersData[0]['name']}',
          style:const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ) // from database
    ],
  ),
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
            cursorColor: Colors.white,
            textAlign: TextAlign.left,
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
                    imagePath = '',
                    alignment: AlignmentDirectional.center,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

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
        minimumSize: const Size(double.infinity, 45),
        primary: backGround,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      onPressed: onPress,
    );