import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
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
      body: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(onPressed: (){}, child: const Text('Completed')),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/card1.png'),  
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Trail'),
                            Text('3 days free trail',style : TextStyle(color: Colors.grey),),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text('02/05/2023', style: TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Card(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton(onPressed: (){}, child: const Text('Cancel', style: TextStyle(color: Colors.red))),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/card1.png'),  
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Junior'),
                              Text('15 days', style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 8),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text('08/05/2023', style: TextStyle(color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
