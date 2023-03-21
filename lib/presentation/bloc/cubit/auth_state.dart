part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthDone extends AuthState {
  const AuthDone();
}

class AuthError extends AuthState {
  final String errorMessage;
  const AuthError(this.errorMessage);
}

class AuthLogout extends AuthState {
  const AuthLogout();
}
