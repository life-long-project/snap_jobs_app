import 'package:equatable/equatable.dart';

class SignUpParameters extends Equatable {
  final String email;
  final String password;
  final String username;
  final int age;
  final String city;
  final String country;

  const SignUpParameters({
    required this.password,
    required this.username,
    required this.age,
    required this.city,
    required this.country,
    required this.email,
  });

  @override
  List<Object> get props => [email, password, username, age, city, country];
}
