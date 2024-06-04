import 'package:flutter/material.dart';

class Terms_conditionScreen extends StatelessWidget {
  const Terms_conditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Condition', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const  Column(
  children: [
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Terms & Condition', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Please read these Terms and Conditions carefully before using our Scuzzi app. These terms govern your use of the app and outline the rights and responsibilities of both users and the app provider. By using our services, you agree to comply with these terms.',
          style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Our app is intended for use by parents or legal guardians who have the authority to book car rides for school-going kids. By using the app, you represent and warrant that you have the necessary legal authority. You may be required to create an account to access certain features of the app, and you are responsible for maintaining the confidentiality of your account credentials. You must provide accurate and up-to-date information during the account creation process.',
          style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'By using our Scuzzi app, you acknowledge that you have read, understood, and agreed to these Terms and Conditions. If you do not agree to any part of these terms, please refrain from using the app.',
          style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)),
        ),
      ),
    ),
  ],
),

    );
  }
}