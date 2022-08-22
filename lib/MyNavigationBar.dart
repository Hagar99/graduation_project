import 'package:miss_nurse/Measurements/measurements.dart';
import 'package:miss_nurse/prescriptionScreen/prescriptionPage.dart';
import 'package:flutter/material.dart';

import 'Nav_drawer/Nav_drawer.dart';
import 'Patient_profile/patient_profile.dart';

class MyNavigationBar extends StatefulWidget {
  // MyNavigationBar ({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions =
  <Widget> [
    DialogExample(),
    patientDiagnosis(),
    Measurements(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('MISS NURSE'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/medicine.png'),
            label: 'Prescription',
            backgroundColor: const Color.fromRGBO(21, 74, 132, 1),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/profile.png'),
            label: 'Profile',
            backgroundColor: const Color.fromRGBO(21, 74, 132, 1),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/medicalhistory.png'),
            label: 'measurements',
            backgroundColor: const Color.fromRGBO(21, 74, 132, 1),
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize: 20,
        onTap: _onItemTapped,
        elevation: 2,
      ),
    );
  }
}
