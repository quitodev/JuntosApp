part of 'pages.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({
    this.logo,
    this.benefit,
    super.key,
  });

  final String? logo;
  final Benefit? benefit;

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _controller.repeat();
    // _controller
    //   ..forward()
    //   ..repeat(
    //     reverse: true,
    //   );
    Future.delayed(const Duration(seconds: 5), () {
      context.pushReplacementNamed(
        widget.benefit != null
            ? Routes.routeBenefitDetail.name
            : Routes.routeHome.name,
        extra: widget.benefit,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.background,
      appBar: widget.benefit != null
          ? CustomAppBar(
              title: l10n.transactionAccepted,
              paddingLeft: 56,
              showBackButton: false,
            )
          : null,
      body: _AnimationContent(
        controller: _controller,
        logo: widget.logo,
        benefit: widget.benefit,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _AnimationContent extends StatelessWidget {
  const _AnimationContent({
    required this.controller,
    this.logo,
    this.benefit,
  });

  final AnimationController controller;
  final String? logo;
  final Benefit? benefit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Stack(
      children: [
        Container(
          height: 1.sh,
          width: 1.sw,
          color: theme.colorScheme.onPrimary,
        ),
        Center(
          child: SizedBox(
            height: 1.sh - 100,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    // .scale para zoom in zoom out (scale) y .rotate para rotar (angle)
                    return Transform.scale(
                      scale: 1.70,
                      child: Transform.rotate(
                        //scale: 1 + controller.value,
                        angle: controller.value * 360 * (3.1415927 / 180),
                        //angle: rotationAngle,
                        child: const CustomImageAsset(
                          imageUrl: AppImages.animation,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: CustomImageAnimation(
                    image: benefit != null ? AppImages.appLogo : logo!,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: benefit != null ? null : 0,
          top: benefit != null ? 0 : null,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomText(
              text: benefit != null
                  ? l10n.yourPayHasBeenReceived
                  : l10n.weAreLoading,
              fontSize: 16.spMax,
              color: theme.colorScheme.primary,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
