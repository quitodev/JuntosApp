import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit()
      : super(
          const NavigationBarState(
            index: 0,
            showBadge: true,
          ),
        );

  void setCurrentIndex(int value) {
    emit(
      state.copyWith(
        index: value,
      ),
    );
  }

  void showBadge(bool value) {
    emit(
      state.copyWith(
        showBadge: value,
      ),
    );
  }
}
