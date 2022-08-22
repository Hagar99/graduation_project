import 'dart:async';

import 'package:miss_nurse/data_list.dart';
import 'package:miss_nurse/logInScreen/logInScreen.dart';
import 'package:sqflite/sqflite.dart';


var database;

void GetUsers(database) async
{
  print(email);
  usersData =  await database.rawQuery('SELECT * FROM user WHERE email = "${email}"');
  print(usersData);
}


void GetPatients(database, String r) async
{
   patientsData = await database.rawQuery('SELECT * FROM patient WHERE room = "${r}"');
   print(patientsData);
}


void CreateDatabase() async {
   database = await openDatabase
     (
      'missNurse.db', // name of database
      version: 1,

      onCreate: (database, version) async
      {
        print('Database created');
        // When creating the db, create the table
        await database.execute(
            'CREATE TABLE user (id TEXT PRIMARY KEY, name TEXT ,type TEXT, password TEXT, phone TEXT, email TEXT, department TEXT)')
            .then((value){
             print('table created');

           }).catchError((error){

             print('error on create table ${error.toString()}');
        });

        await database.execute(
            'CREATE TABLE patient (id TEXT PRIMARY KEY, name TEXT, age INTEGER, gender TEXT,'
                ' currentDiagnosis TEXT, chronicDiseases TEXT, forbidden TEXT, room TEXT,'
                ' oxygen NUMERIC, temp NUMERIC , bloodPressure TEXT , heartBeats NUMERIC, department TEXT)') // pressure not exist
            .then((value) {
            print('table created');

          }).catchError((error){

            print('error on create table ${error.toString()}');
        });
      },

      onOpen: (database) {
        print('Database opened');
      //  GetUsers(database);
      });

        /// insert initially to database (IT work :_)

        ///insert users
   database.transaction((txn) async
   {
             await txn.rawInsert(
               'INSERT INTO user(id, name, type, password, phone, email, department) VALUES("26909011222727","Hagar AbduSalam", "D", "@Hagar99", "01007358527", "hagora@gmail.com","Dermatology")');
             print('inserted1');


           await txn.rawInsert(
               'INSERT INTO user(id, name, type, password, phone, email, department) VALUES("21907011222727","Hosna Sayed", "N", "@Hosna99", "01057358527","haora@gmail.com","Physiotherapy")');
           print('inserted2');


           await txn.rawInsert(
               'INSERT INTO user(id, name, type, password, phone, email, department) VALUES("22907011222727","Hagar Alaa", "D", "@Hegra99", "01077358527","horka@gmail.com", "Internal Medicine")');
           print('inserted3');


           await txn.rawInsert(
               'INSERT INTO user(id, name, type, password, phone, email,department) VALUES("23907011222727","Sohila Tarek", "N", "@soso99", "01017358527","hagor@gmail.com", "Cardiology")');
           print('inserted4');


           await txn.rawInsert(
               'INSERT INTO user(id, name, type, password, phone, email, department) VALUES("24907011222727","Doaa Fakher", "D", "@dodo99", "01047358527","hglga@gmail.com", "Clinical Pathology")');
           print('inserted5');

                      /////// insert patients

           await txn.rawInsert(
               'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
                   ' VALUES("24907011222728","Samah Morad", "20","F",  "", "","", "A1", 97, 37.2, "120/80", 80, "Radiology")');
           print('inserted6');


           await txn.rawInsert(
               'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
                   'VALUES("24907011222721","Karima Mohsen", "49", "F", "", "","", "B2", 98, 37.2, "120/80", 80, "Physiotherapy")');
           print('inserted7');


           await txn.rawInsert(
               'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
                   'VALUES("24907011222722","Mamdouh Ahmed", "31", "M", "", "","", "C3", 99, 37.2, "120/80", 90, "Physiotherapy")');
           print('inserted8');


           await txn.rawInsert(
               'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
                   ' VALUES("24907011222723","Fahd Sameh", "25","M", "", "","", "A3", 97, 37.2, "120/80", 70, "Internal Medicine")');
           print('inserted9');


           await txn.rawInsert(
               'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
                   ' VALUES("24907011222720","Engy Momen", "21","F","", "","","B1", 99, 37.2, "120/80", 80, "Physiotherapy")');
           print('inserted10');


     await txn.rawInsert(
         'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
             ' VALUES("24907011298728","Thorya Masood", "60","F",  "", "","", "A2", 97, 37.2, "120/80", 80, "Oncology")');
     print('inserted okk');



     await txn.rawInsert(
         'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
             ' VALUES("24907011493728","Said Nageh", "40","M",  "", "","", "B1", 97, 37.2, "120/80", 80, "Radiology")');
     print('inserted okk2');



     await txn.rawInsert(
         'INSERT INTO patient (id , name , age, gender, currentDiagnosis , chronicDiseases, forbidden, room, oxygen, temp, bloodPressure, heartBeats, department)'
             ' VALUES("24907011228928","Fady Karim", "34","M",  "", "","", "A2", 97, 37.2, "120/80", 80, "Cardiology")');
     print('inserted okk');

   });
   }


Future? InsertToUsers(String id, String name, String type, String password, String phone, String depart, String email) async{
     await database.transaction((txn) {
    txn.rawInsert(
  'INSERT INTO user(id, name ,type, password, phone ,email, department) VALUES("$id", "$name", "$type", "$password", "$phone", "$email", "$depart")')
        .then((){
     print("Inserted Successfully");
   })
        .catchError((err){
    print("error Catched ${err.toString()}");
   });
  });

  }

