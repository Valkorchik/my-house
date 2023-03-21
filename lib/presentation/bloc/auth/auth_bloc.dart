import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../exceptions/http_exception.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthInitial()) {
    on<SignupEvent>(_onSignup);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  _onSignup(event, emit) async {
    emit(const AuthLoading());
    try {
      await _authRepository.signup(event.email, event.password, event.username);
      emit(const AuthDone());
    } on HttpException catch (error) {
      var errorMessage = 'Аутентификация не удалась.';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'Эта электронная почта уже используется.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Электронная почта не подходит.';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'Пароль слишком слабый.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Неверный пароль.';
      }
      emit(AuthError(errorMessage));
    } catch (error) {
      const errorMessage =
          'Не получается аутентифицировать Вас. Пожалуйста, попробуйте позже.';
      emit(const AuthError(errorMessage));
    }
  }

  _onLogin(event, emit) async {
    emit(const AuthLoading());
    try {
      await _authRepository.login(event.email, event.password);
      emit(const AuthDone());
    } on HttpException catch (error) {
      var errorMessage = 'Аутентификация не удалась.';
      if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Электронная почта не подходит.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Невозможно найти пользователя с такой почтой.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Неверный пароль.';
      }
      emit(AuthError(errorMessage));
    } catch (error) {
      const errorMessage =
          'Не получается аутентифицировать Вас. Пожалуйста, попробуйте позже.';
      emit(const AuthError(errorMessage));
    }
  }

  _onLogout(event, emit) async {
    emit(const AuthLoading());
    await _authRepository.logout();
    emit(const AuthLogout());
  }
}
