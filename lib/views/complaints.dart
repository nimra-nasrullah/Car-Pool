import 'package:flutter/material.dart';

import '../authentication/signIn.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  _ComplaintsScreenState createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  String dropdownValue =
      'Vehicle not clean'; 

  String complaintText = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Complaints', style: TextStyle(fontSize: 20)),
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
          Image.asset(
              'assets/complaints.png'), 

          const SizedBox(height: 20), 
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(), 
              ),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Vehicle not clean',
                'Driver is not punctual',
                'Other complaint about driver or car'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    complaintText = value;
                  });
                },
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Write your complaint here (minimum 10 characters)',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            width: 380,
            height: 50.43,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(80, 200, 120, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (complaintText.length >= 10) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Minimum 10 characters required')));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
