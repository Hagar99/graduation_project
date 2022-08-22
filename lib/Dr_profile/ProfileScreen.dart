import 'package:miss_nurse/Datebase/databse.dart';
import 'package:miss_nurse/data_list.dart';
import 'package:miss_nurse/shared_color/gradient_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../MyNavigationBar.dart';
import '../Nav_drawer/Nav_drawer.dart';
import 'package:get/get.dart';
import 'package:miss_nurse/locale/locale_controller.dart';
class ProfileScreen extends StatefulWidget {
  //const ProfileScreen({required Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    Locale_controller controllerLang =Get.find();

    List RoomsName =
    [
      "r1".tr,
      "r2".tr,
      "r3".tr,
      "r4".tr,
      "r5".tr,
      "r6".tr,
      "r7".tr,
      "r8".tr,
      "r9".tr,
      "r10".tr
    ];

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: gradientColor(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.asset("asset/icons/male-avatar.png")),
              ),
               Text(
               '${usersData[0]['name']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 12,),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => buttonWithIcon(
                        backGround: Colors.white,
                        txt: RoomsName[index],
                        imagePath: "asset/images/bed.png",
                        onPress: () {}),
                    itemCount: RoomsName.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonWithIcon({
    Color backGround = Colors.white,
    required String txt,
    required Function() onPress,
    required String imagePath,
  }) =>
      ElevatedButton.icon(
        onPressed: () {
          GetPatients(database, txt);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyNavigationBar(),
              ));
        },
        icon: CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFF32A5F8),
          // 0xFF for spcifying  transparency
          child: Image.asset(
            imagePath,
            matchTextDirection: true,
            width: 40,
            height: 40,
          ),
        ),
        label: Text(
          txt,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff041e3e),
            fontSize: 22.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          alignment: AlignmentDirectional.centerStart,
          primary: backGround,
          padding: const EdgeInsetsDirectional.only(start: 0.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      );
}
