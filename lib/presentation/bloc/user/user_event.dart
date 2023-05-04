part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  const GetUserEvent();
}

class UpdateUsernameEvent extends UserEvent {
  final String username;

  const UpdateUsernameEvent(this.username);
}

class UpdatePasswordEvent extends UserEvent {
  final String password;

  const UpdatePasswordEvent(this.password);
}
