class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? sectionName;
  String? idNumber;
  String? phoneNumber;

  UserModel({this.uid, this.email, this.userName, this.sectionName,
    this.idNumber, this.phoneNumber}); // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      sectionName: map['sectionName'],
      idNumber: map['idNumber'],
      phoneNumber: map['phoneNumber'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'sectionName': sectionName,
      'idNumber': idNumber,
      'phoneNumber': phoneNumber,
    };
  }
}