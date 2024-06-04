import 'package:flutter/material.dart';

class LeftRightLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
          },
        ),
      ),
      backgroundColor: Colors.green,
      body: Column(
        children: [
           SizedBox(
            height: 130,
            child: Image.asset('assets/profile.png'),
          ),
          const Text('Frank Smith', style: TextStyle(fontSize: 20, color: Colors.white),),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                 Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    
                      child: TextButton(
                        onPressed: () {},
                        
                        child: const Text(
                          'My Account',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    
                  ),
                 Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    
                      child: TextButton(
                        onPressed: () {},
                        
                        child: const Text(
                          'FAQ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    
                      child: TextButton(
                        onPressed: () {},
                        
                        child: const Text(
                          'Make Complaints',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    
                      child: TextButton(
                        onPressed: () {},
                        
                        child: const Text(
                          'About',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    
                      child: TextButton(
                        onPressed: () {},
                        
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    
                      child: TextButton(
                        onPressed: () {},
                        
                        child: const Text(
                          'Terms & Condition',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
