import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ride_share/views/home_view/home_view.dart';

import 'otp.dart';
import 'signUp.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  var phone = "";

  Future<void> checkPhoneNumberAndNavigate() async {
    String phoneNumber = phone.trim();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('Customer')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: phoneNumber,
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: (FirebaseAuthException e) {
      //    
      //   },
      //   codeSent: (String verificationId, int? resendToken) {
      //     SignInScreen.verify = verificationId;
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => OtpPin(
      //           phoneNumber: phoneNumber,
      //         ),
      //       ),
      //     );
      //   },
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // ); 
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Incorrect phone number. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/logo.png',
                      width: 150,
                      height: 100,
                    ),
                    const Text(
                      'Drive Pool',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(167, 134, 172, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30.0),
              Center(
                child: IntlPhoneField(
                  controller: phoneNumberController,
                  onChanged: (value) {
                    phone = value.completeNumber;
                  },
                  initialCountryCode: 'PK',
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Center(
                child: SizedBox(
                  width: 350,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(80, 200, 120, 1),
                    ),
                    onPressed: checkPhoneNumberAndNavigate,
                    child: const Text(
                      'Send Code',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
