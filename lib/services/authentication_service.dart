import 'dart:developer';

import '../exceptions/exceptions.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class AuthenticationService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  final String api = 'http://vpn.coding-lodge.com';

  @override
  Future<User> getCurrentUser() async {
    return null; // return null for now
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    // await Future.delayed(Duration(seconds: 1)); // simulate a network delay

    final url = "$api/signin";

    Map<String, String> body = {
      'email': email,
      'password': password,
    };

    final jsonBody = jsonEncode(body);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      return User(
          token: apiResponse['token'], email: apiResponse['user']['email']);
    }

    throw AuthenticationException(message: 'Wrong username or password');
  }

  @override
  Future<void> signOut() {
    return null;
  }
}
