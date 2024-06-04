import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'signIn.dart';

class childInfo extends StatelessWidget {
  final String fullName;
  final String email;
  final String phoneNumber;
  final TextEditingController childFullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController schoolAddressController = TextEditingController();
  final TextEditingController schoolPhoneController = TextEditingController();

  childInfo({super.key, 
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

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
                'About Your Child',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 50.0),
              TextField(
                controller: childFullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: schoolNameController,
                decoration: const InputDecoration(
                  labelText: 'School Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: schoolAddressController,
                decoration: const InputDecoration(
                  labelText: 'School Address',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: schoolPhoneController,
                decoration: const InputDecoration(
                  labelText: 'School Phone',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.phone,
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
                    onPressed: () async {
                      if (childFullNameController.text.isNotEmpty &&
                          ageController.text.isNotEmpty &&
                          schoolNameController.text.isNotEmpty &&
                          schoolAddressController.text.isNotEmpty &&
                          schoolPhoneController.text.isNotEmpty) {
                        await FirebaseFirestore.instance.collection('Customer').add({
                          'fullName': fullName,
                          'email': email,
                          'phoneNumber': phoneNumber,
                          'childFullName': childFullNameController.text,
                          'age': int.tryParse(ageController.text) ?? 0,
                          'schoolName': schoolNameController.text,
                          'schoolAddress': schoolAddressController.text,
                          'schoolPhone': schoolPhoneController.text,
                        });

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      } else {
                        // Handle empty fields
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                          ),
                        );
                      }
                    },
                    child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    child: const Text('Sign In'),
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
