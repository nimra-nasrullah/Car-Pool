import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('About', style: TextStyle(fontSize: 20)),
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
        child: Text('About Us', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'A child’s safety is one of the top priorities of parents and the administration of the school they go to. Due to this concern parents rest their trust in the school’s van system. However, these vans or buses are overfilled to the brink and especially in summer pose a threat to the child’s health due to risks of suffocation. Moreover, the arrival times to and from school have drastically increased as well. Keeping all of these issues in mind we are introducing an app called Scuzzi which aims towards eradicating all of the mentioned issues and more',
          style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'At Scuzzi, we believe in making the journey to and from school stress-free for both parents and children. Our goal is to offer a reliable and efficient transportation service that gives parents peace of mind, knowing that their child is in safe hands.',
          style: TextStyle(color: Color.fromRGBO(111, 111, 111, 1)),
        ),
      ),
    ),
  ],
),

    );
  }
}