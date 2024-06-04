import 'package:flutter/material.dart';

import '../authentication/signIn.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _currentIndex = 0;
  final List<String> titles = [
    'Flexible Booking',
    'Tracking Realtime',
    'Try Before You Buy'
  ];
  final List<String> descriptions = [
    'Book for a week, month, or multiple months.',
    'Flexible real-time tracking for parent to',
    'Pay your driver after 3 days of trial'
  ];
  final List<String> descriptions1 = [
    'A flexible and comfortable option',
    'ensure their kid\'s safety.',
    '',
  ];
  final List<String> images = [
    'assets/screen1.png',
    'assets/screen2.png',
    'assets/screen3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  titles[_currentIndex],
                  style: const TextStyle(
                    fontSize: 35,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  descriptions[_currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  descriptions1[_currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  images[_currentIndex],
                  height: 250,
                  width: 250,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < titles.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == i
                        ? Colors.grey
                        : Colors.grey.withOpacity(0.5),
                    
                  ),
                  
                ),
            ],
          ),
          const SizedBox(height: 100),
          SizedBox(
            width: 150,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(80, 200, 120, 1),
              ),
              onPressed: () {
                if (_currentIndex < titles.length - 1) {
                  setState(() {
                    _currentIndex++;
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                }
              },
              child: Text(
                _currentIndex == titles.length - 1 ? 'Get Started' : 'Get Started',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
