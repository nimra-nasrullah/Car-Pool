import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../views/options_view.dart';
import 'signIn.dart';


class OtpPin extends StatefulWidget {
  final String phoneNumber;

  const OtpPin({super.key, required this.phoneNumber});

  @override
  State<OtpPin> createState() => _OtpPinState();
}

class _OtpPinState extends State<OtpPin> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  bool wrongOTP = false;
  bool loading = false;

  void _handleVerify() async {
    final AuthService authService = AuthService();
    bool isUserSignedUp = await authService.isSignedUp(widget.phoneNumber);
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
    if (isUserSignedUp) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OptionsView()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OptionsView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/verification.jpg',
                width: 250,
                height: 250,
              ),
              const Text(
                'Phone Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Enter the code sent to your number',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: 45,
                      child: TextFormField(
                        controller: _otpControllers[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (wrongOTP) {
                            setState(() {
                              wrongOTP = false;
                            });
                          }
                          if (index < 5 && value.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (wrongOTP)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Wrong OTP entered. Please try again.',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              loading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                    width: 350,
                  height: 55,
                    child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          try {
                            String code = _otpControllers
                                .map((controller) => controller.text)
                                .join();
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                              verificationId: SignInScreen.verify,
                              smsCode: code,
                            );
                            await auth.signInWithCredential(credential);
                            _handleVerify();
                          } catch (e) {
                            if (kDebugMode) {
                              print('wrong otp: $e');
                            }
                            setState(() {
                              wrongOTP = true;
                              loading = false;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(80, 200, 120, 1),
                        ),
                        child: const Text('Verify Phone Number', style: TextStyle(color: Colors.white),),
                      ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
