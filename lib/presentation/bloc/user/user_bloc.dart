import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_house/domain/repositories/user_repostitory.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<GetUserEvent>(_onGetUser);
  }

  _onGetUser(event, emit) async {
    emit(UserLoading());

    await userRepository.getUser();
    emit(UserLoaded());
  }
}
