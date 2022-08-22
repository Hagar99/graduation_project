
import 'package:miss_nurse/shared_color/gradient_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Datebase/databse.dart';
import '../Section/SectionScreen.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../SignUpScreen/signUpScreen.dart';



class confirmationPage extends StatefulWidget {
  final String phone;
  confirmationPage(this.phone);
  @override
  _confirmationPageState createState() => _confirmationPageState();
}

class _confirmationPageState extends State<confirmationPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Container(
        decoration: gradientColor(),
        child: Column(
          children:
          [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: Center(
                child: Column(
                  children:
                  [
                    Image.asset('asset/icons/confirmIcon.png'),
                    const SizedBox(height: 10),
                    const Text(
                      'Confirm Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                keyboardType: TextInputType.none,
                onSubmit: (pin) async
                {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SectionScreen()),
                                (route) => false);
                      }
                      else
                      {
                        Fluttertoast.showToast(msg: 'Not A Valid Phone Number');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    _scaffoldkey.currentState!
                        .showSnackBar( const SnackBar(content: Text('invalid OTP')));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              InsertToUsers(
                  idNumberController.text,
                  userNameController.text,
                  radioButtonItem,
                  passwordController.text,
                  phoneNumberController.text,
                  sectionNameController.text,
                  emailController.text);

              signUp(emailController.text, passwordController.text);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SectionScreen()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Fluttertoast.showToast(msg:'The provided phone number is not valid.');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ));
          }
          else {
            Fluttertoast.showToast(msg:'The provided phone number is not correct.');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ));
            print(e.message);
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          String smsCode = 'xxxxxx';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          Fluttertoast.showToast(msg:'The provided phone number is not yours.');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ));
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout:const Duration(seconds: 60));
  }

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
