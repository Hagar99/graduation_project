import 'package:miss_nurse/shared_color/gradient_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miss_nurse/locale/locale_controller.dart';
class DialogExample extends StatefulWidget {
  @override
  _DialogExampleState createState() =>  _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  String _text = "initial";
  late TextEditingController _c;

  @override
  initState() {
    _c =  TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale_controller controllerLang =Get.find();
    return Scaffold(
        body: Container(
          decoration: gradientColor(),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child:  Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    "prescription".tr,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 320,
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  height: 350,
                  child:  Text(
                    _text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        overflow: TextOverflow.clip),
                    maxLines: 30,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                builder: (context) =>  Dialog(
                  child: Container(
                    height: 200,
                    child:  Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 150,
                          padding: const EdgeInsets.all(20),
                          child:  TextField(
                            style: const TextStyle(fontSize: 20),
                            decoration:  InputDecoration(
                                hintText: "updateinfo".tr),
                            controller: _c,
                            maxLines: 5,
                            autocorrect: true,
                          ),
                        ),
                        TextButton(
                          child:  Text("save".tr),
                          onPressed: () {
                            setState(() {
                              _text = _c.text;
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                context: context);
          },
          child: const Icon(Icons.edit),
        ));
  }
}