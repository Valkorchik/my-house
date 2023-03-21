import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_house/domain/repositories/auth_repository.dart';
import '../../../exceptions/http_exception.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthInitial());

  Future<void> signup(String email, String password, String username) async {
    emit(const AuthLoading());
    try {
      await _authRepository.signup(email, password, username);
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

  Future<void> login(String email, String password) async {
    emit(const AuthLoading());
    try {
      await _authRepository.login(email, password);
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

  Future<void> logout() async {
    emit(const AuthLoading());
    await _authRepository.logout();
    emit(const AuthLogout());
  }
}
