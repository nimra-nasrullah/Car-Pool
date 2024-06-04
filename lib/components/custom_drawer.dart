import 'package:flutter/material.dart';

import '../authentication/signIn.dart';
import '../views/about.dart';
import '../views/complaints.dart';
import '../views/faq.dart';
import '../views/my_account.dart';
import '../views/privacy_policy.dart';
import '../views/terms_condition.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(80, 200, 120, 1),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/profile.png",
                    height: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Frank Smith',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add space between image/text and buttons
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyAccount()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                child: const Text('My Account',
                    style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FAQScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                child: const Text('FAQ', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ComplaintsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                child: const Text('Make Complaints',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                child:
                const Text('About', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Privacy_PolicyScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                child: const Text('Privacy Policy',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Terms_conditionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                child: const Text('Terms & Conditions',
                    style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 200),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                child:
                const Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}