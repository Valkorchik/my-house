import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../exceptions/http_exception.dart';

class AuthRepository with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  final apiKey = dotenv.env['API_KEY']!;

  bool get isAuth => token != null;

  String? get userId => _userId;

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return null;
  }

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$apiKey');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      // _autoLogout();
      notifyListeners();
      // final prefs = await SharedPreferences.getInstance();
      // final userData = json.encode(
      //   {
      //     'token': _token,
      //     'userId': _userId,
      //     'expiryDate': _expiryDate!.toIso8601String(),
      //   },
      // );
      // prefs.setString('userData', userData);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    return authenticate(email, password, 'signInWithPassword');
  }

  Future<void> signup(String email, String password) async {
    return authenticate(email, password, 'signUp');
  }
}
