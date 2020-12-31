import 'package:meta/meta.dart';

class User {
  final String email;
  final String token;

  User({this.token, @required this.email});

  @override
  String toString() => 'User { token: $token, email: $email}';
}
