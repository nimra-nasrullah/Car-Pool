import 'package:flutter/material.dart';

import '../authentication/signIn.dart';
import 'editProfile.dart';
import 'history.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {},
        ),
        title: const Text(
          'My Account',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(children: [
              Image.asset(
                'assets/profile.png',
                width: 100,
                height: 100,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Frank Smith',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(left: 23.0),
                    child: Text(
                      'frank.smith@gmail.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color.fromRGBO(80, 200, 120, 1),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '+921234567891',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Active Subscriptions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image(image: AssetImage('assets/card1.png')),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Trail',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              Text(
                                '3 days free trail',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Unsubscribe',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Container(
                    width: 220,
                    height: 50.43,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(80, 200, 120, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Text(
                        'Upgrade',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 50),
            child: Row(
              children: [
                Text(
                  'QUICK LINKS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.history_rounded,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
                const SizedBox(width: 8),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryScreen()),
                      );
                    },
                    child: const Text(
                      'History',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, ),
            child: Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ))),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Container(
                width: 380,
                height: 50.43,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(80, 200, 120, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
