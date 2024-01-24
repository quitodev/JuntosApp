import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/domain/entities/entities.dart';
import 'package:juntos_app/app/core/domain/usecases/usecases.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required SignIn signIn,
    required GetUser getUser,
  })  : _signIn = signIn,
        _getUser = getUser,
        super(
          LoginState(
            status: LoginLoading(),
            email: '',
            password: '',
            showPassword: false,
            rememberSession: false,
            account: Account.empty(),
          ),
        );

  final SignIn _signIn;
  final GetUser _getUser;

  void _showLoading() {
    emit(
      state.copyWith(
        status: LoginLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: LoginError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: LoginInitial(),
      ),
    );
  }

  void writeEmail(String value) {
    emit(
      state.copyWith(
        email: value,
      ),
    );
  }

  void writePassword(String value) {
    emit(
      state.copyWith(
        password: value,
      ),
    );
  }

  void showPassword(bool value) {
    emit(
      state.copyWith(
        showPassword: value,
      ),
    );
  }

  void rememberSession(bool value) {
    emit(
      state.copyWith(
        rememberSession: value,
      ),
    );
  }

  Future<void> checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('email') != null &&
        prefs.getString('password') != null) {
      emit(
        state.copyWith(
          email: prefs.getString('email'),
          password: prefs.getString('password'),
          rememberSession: true,
        ),
      );
      await signIn();
      return;
    }
    emit(
      state.copyWith(
        status: LoginInitial(),
      ),
    );
  }

  Future<void> signIn() async {
    _showLoading();
    final either = await _signIn.call(state.email, state.password);
    either.fold(
      (failure) => _showError(failure),
      (_) async {
        final prefs = await SharedPreferences.getInstance();
        if (state.rememberSession) {
          await prefs.setString('email', state.email);
          await prefs.setString('password', state.password);
        } else {
          await prefs.remove('email');
          await prefs.remove('password');
        }
        await getUser();
      },
    );
  }

  Future<void> getUser() async {
    final either = await _getUser.call();
    either.fold(
      (failure) => _showError(failure),
      (result) async {
        emit(
          state.copyWith(
            status: LoginSuccess(),
            account: result,
          ),
        );
      },
    );
  }
}
