import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static final apiKey = dotenv.env['API_KEY']!;
  String? username;
  String? email;
  String? password;
  String? userId;

  Future<void> getUser() async {
    final ref = FirebaseDatabase.instance.ref();
    final emailSnapshot = await ref.child('users/$userId/email').get();
    final passwordSnapshot = await ref.child('users/$userId/password').get();
    final usernameSnapshot = await ref.child('users/$userId/username').get();

    email = emailSnapshot.value.toString();

    password = passwordSnapshot.value.toString();

    username = usernameSnapshot.value.toString();
  }

  Future<void> updateUser(String username, String password) async {
    final ref = FirebaseDatabase.instance.ref();
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    userId = extractedUserData['userId'];
    final Map<String, Map> updates = {};
    final postData = {
      'username': username,
      'password': password,
    };
    updates['users/$userId/username'] = postData;
    updates['users/$userId/password'] = postData;
    ref.update(updates);
  }
}
