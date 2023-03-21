part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignupEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  const SignupEvent(this.email, this.password, this.username);
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}
