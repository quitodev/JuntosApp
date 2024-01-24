part of 'widgets.dart';

class CustomImageAnimation extends StatefulWidget {
  const CustomImageAnimation({
    required this.image,
    required this.width,
    this.milliseconds,
    this.boxFit,
    super.key,
  });

  final String image;
  final double width;
  final int? milliseconds;
  final BoxFit? boxFit;

  @override
  State<CustomImageAnimation> createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.milliseconds ?? 1500,
      ),
    );
    //_controller.repeat();
    _controller
      ..forward()
      ..repeat(
        reverse: true,
      );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // .scale para zoom in zoom out (scale) y .rotate para rotar (angle)
        return Transform.scale(
          scale: 1 + 0.1 * _controller.value,
          //angle: _controller.value * 360 * (3.1415927 / 180),
          child: widget.image.contains('assets/images')
              ? CustomImageAsset(
                  imageUrl: widget.image,
                  boxFit: widget.boxFit ?? BoxFit.scaleDown,
                  width: widget.width,
                )
              : CustomImageNetwork(
                  imageUrl: widget.image,
                  boxFit: widget.boxFit ?? BoxFit.scaleDown,
                  width: widget.width,
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
