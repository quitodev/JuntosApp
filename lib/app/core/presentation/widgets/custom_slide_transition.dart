part of 'widgets.dart';

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({
    required super.child,
    super.key,
  }) : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          // transitionsBuilder: (_, animation, __, child) {
          //   return SlideTransition(
          //     position: animation.drive(
          //       Tween(
          //         begin: const Offset(1.5, 0),
          //         end: Offset.zero,
          //       ).chain(
          //         CurveTween(curve: Curves.ease),
          //       ),
          //     ),
          //     child: child,
          //   );
          // },
        );
}
