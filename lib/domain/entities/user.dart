import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String email;
  final String userId;

  const User(this.username, this.email, this.userId);

  @override
  List<Object?> get props => [username, email, userId];
}
