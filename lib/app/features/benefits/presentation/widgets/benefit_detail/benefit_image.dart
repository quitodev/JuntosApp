part of '../widgets.dart';

class BenefitImage extends StatelessWidget {
  const BenefitImage({
    required this.benefit,
    super.key,
  });

  final Benefit benefit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageNetwork(
          imageUrl: benefit.photo,
          boxFit: BoxFit.cover,
          height: 1.sw,
          width: 1.sw,
        ),
        Positioned(
          top: 8,
          left: 8,
          child: CustomImageNetwork(
            imageUrl: benefit.trade.logo,
            boxFit: BoxFit.cover,
            height: 120,
            width: 120,
          ),
        ),
      ],
    );
  }
}
