import 'package:flutter/material.dart';

import 'my_account.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Screen',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Image.asset('assets/profile.png'),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                _buildInputField(Icons.person_3_outlined, 'Name'),
                _buildInputField(Icons.email_outlined, 'Email'),
                _buildInputField(Icons.phone, 'Phone'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 340.0),
            child: SizedBox(
              height: 55,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(80, 200, 120, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
