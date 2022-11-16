// ignore_for_file: unused_local_variable

import 'package:e_leaning2/user_info/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserGetData {
  var userData = UserData();
  Future<void> dataGet() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      userData.userName = user.displayName;
      userData.userEmail = user.email;

      // Check if user's email is verified
      userData.emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;
    }
  }
}


















  // var collection = FirebaseFirestore.instance.collection('User');
    // var querySnapshot = await collection.get();

    // for (var queryDocumentSnapshot in querySnapshot.docs) {
    //   Map<String, dynamic> data = queryDocumentSnapshot.data();
    //   var email = data['email'];
    //   var userName = data['userName'];
    //   var password = data['password'];
    //   print(email + userName + password);
    // }