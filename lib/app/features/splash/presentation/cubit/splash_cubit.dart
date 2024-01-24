import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : super(
          SplashState(
            status: SplashInitial(),
          ),
        );

  Future<void> goLogin() async {
    await Future.delayed(const Duration(seconds: 1), () {
      emit(
        state.copyWith(
          status: SplashInitial(),
        ),
      );
    });
    await Future.delayed(const Duration(seconds: 5), () {
      emit(
        state.copyWith(
          status: SplashSuccess(),
        ),
      );
    });
  }
}
