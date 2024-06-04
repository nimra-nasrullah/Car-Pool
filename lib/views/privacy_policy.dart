import 'package:flutter/material.dart';

class Privacy_PolicyScreen extends StatelessWidget {
  const Privacy_PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy', style: TextStyle(fontSize: 20)),
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
        child: Text('Privacy Policy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'At Scuzzi, we are committed to protecting your privacy and ensuring the confidentiality of your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data when you use our app. By using our services, you consent to the practices described in this policy.',
          style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'When you create an account or book a car ride, we may collect personal information such as your name, contact details, and payment information. To provide our services, we may collect limited personal information about your child, including their name, school name, and pick-up/drop-off locations. With your consent, we collect location data to facilitate the car ride service, including tracking your child\'s location during the ride. Additionally, we collect information on how you interact with our app, including your preferences, settings, and activities within the app.',
          style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)),
        ),
      ),
    ),
  ],
),

    );
  }
}