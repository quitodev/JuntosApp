part of 'navigation_bar_cubit.dart';

class NavigationBarState extends Equatable {
  const NavigationBarState({
    required this.index,
    required this.showBadge,
  });

  final int index;
  final bool showBadge;

  NavigationBarState copyWith({
    int? index,
    bool? showBadge,
  }) {
    return NavigationBarState(
      index: index ?? this.index,
      showBadge: showBadge ?? this.showBadge,
    );
  }

  @override
  List<Object> get props => [
        index,
        showBadge,
      ];
}
