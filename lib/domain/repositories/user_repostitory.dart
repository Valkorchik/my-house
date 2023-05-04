import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../exceptions/http_exception.dart';

class UserRepository {
  static final apiKey = dotenv.env['API_KEY']!;
  String? username;
  String? email;
  String? password;
  String? userId;

  Future<void> getUser() async {
    final ref = FirebaseDatabase.instance.ref();
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    userId = extractedUserData['userId'];
    final emailSnapshot = await ref.child('users/$userId/email').get();
    final passwordSnapshot = await ref.child('users/$userId/password').get();
    final usernameSnapshot = await ref.child('users/$userId/username').get();

    email = emailSnapshot.value.toString();

    password = passwordSnapshot.value.toString();

    username = usernameSnapshot.value.toString();
  }

  Future<void> updateUsername(String username) async {
    final ref = FirebaseDatabase.instance.ref();
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    userId = extractedUserData['userId'];
    final Map<String, Map> updates = {};
    await getUser();
    final postData = {
      'email': email,
      'username': username,
      'password': password,
    };

    updates['users/$userId'] = postData;

    ref.update(updates);
    this.username = username;
  }

  Future<void> updatePassword(String password) async {
    final ref = FirebaseDatabase.instance.ref();
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    userId = extractedUserData['userId'];

    final Map<String, Map> updates = {};
    await getUser();
    final postData = {
      'email': email,
      'username': username,
      'password': password,
    };

    updates['users/$userId'] = postData;
    ref.update(updates);
    this.password = password;
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=$apiKey');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'idToken': extractedUserData['token'],
            'password': password,
            'returnSecureToken': false,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      rethrow;
    }
  }
}
