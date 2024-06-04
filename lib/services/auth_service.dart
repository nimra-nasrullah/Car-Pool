import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/User_Model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<UserModel?> getLoggedInUser() async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('Customer')
          .where('phoneNumber', isEqualTo: currentUser?.phoneNumber)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData = querySnapshot.docs.first.data();
        print('user found: ${userData.toString()}');

        UserModel user = UserModel(
          age: userData['age'],
          childFullName: userData['childFullName'],
          fullName: userData['fullName'],
          phoneNumber: userData['phoneNumber'],
          schoolAddress: userData['schoolAddress'],
          schoolName: userData['schoolName'],
          schoolPhone: userData['schoolPhone'],
        );
        return user;
      } else {
        throw 'Account not found';
      }
    } catch (e) {
      print('error while getting the user/account: $e');
      return null;
    }
  }

  Future<bool> register(UserModel user) async {
    try {
      Map<String, dynamic> userData = {
        'age': user.age,
        'childFullName': user.childFullName,
        'fullName': user.fullName,
        'phoneNumber': user.phoneNumber,
        'schoolAddress': user.schoolAddress,
        'schoolName': user.schoolName,
        'schoolPhone': user.schoolPhone,
      };

      await FirebaseFirestore.instance.collection('Customer').add(userData);
      print('user account created!');
      return true;
    } catch (e) {
      print('error while registering a user: $e');
      return false;
    }
  }

  Future<bool> isSignedUp(String phone) async {
    try {
      var userCollection = FirebaseFirestore.instance.collection('Customer');
      var querySnapshot =
          await userCollection.where('phoneNumber', isEqualTo: phone).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('error while checking if user is signed up: $e');
      return false;
    }
  }

  Future<UserModel?> signIn(String phoneNumber, String schoolPhone) async {
    if (phoneNumber != null) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('Customer')
            .where('phoneNumber', isEqualTo: phoneNumber)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot userDocument = querySnapshot.docs.first;
          Map<String, dynamic> userData =
              userDocument.data() as Map<String, dynamic>;
          String storedSchoolPhone = userData['schoolPhone'];

          if (schoolPhone == storedSchoolPhone) {
            UserModel user = UserModel(
              age: userData['age'],
              childFullName: userData['childFullName'],
              fullName: userData['fullName'],
              phoneNumber: userData['phoneNumber'],
              schoolAddress: userData['schoolAddress'],
              schoolName: userData['schoolName'],
              schoolPhone: userData['schoolPhone'],
            );

            return user;
          } else {
            print('Incorrect school phone');
            return null;
          }
        } else {
          print('No user found for the provided phone number.');
          return null;
        }
      } catch (e) {
        print('Error querying Firestore: $e');
        return null;
      }
    } else {
      print('Current user phone number is null.');
      return null;
    }
  }
}
