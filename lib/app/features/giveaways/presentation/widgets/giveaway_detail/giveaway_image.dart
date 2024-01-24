part of '../widgets.dart';

class GiveawayImage extends StatelessWidget {
  const GiveawayImage({
    required this.giveaway,
    super.key,
  });

  final Giveaway giveaway;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageNetwork(
          imageUrl: giveaway.referentialPhoto,
          boxFit: BoxFit.cover,
          height: 1.sw,
          width: 1.sw,
        ),
        Positioned(
          top: 8,
          left: 8,
          child: CustomImageNetwork(
            imageUrl: giveaway.iconSponsorCompany,
            boxFit: BoxFit.cover,
            height: 120,
            width: 120,
          ),
        ),
      ],
    );
  }
}
