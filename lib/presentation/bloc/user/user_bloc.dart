import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_house/domain/repositories/user_repostitory.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<GetUserEvent>(_onGetUser);
    on<UpdateUsernameEvent>(_onUpdateUsername);
    on<UpdatePasswordEvent>(_onUpdatePassword);
  }

  _onGetUser(event, emit) async {
    emit(UserLoading());

    await userRepository.getUser();
    emit(UserLoaded());
  }

  _onUpdateUsername(event, emit) async {
    emit(UserLoading());

    await userRepository.updateUsername(event.username);
    emit(UserLoaded());
  }

  _onUpdatePassword(event, emit) async {
    emit(UserLoading());

    await userRepository.updatePassword(event.password);
    emit(UserLoaded());
  }
}
