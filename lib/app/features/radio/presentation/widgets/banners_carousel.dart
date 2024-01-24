part of 'widgets.dart';

class BannersCarousel extends StatelessWidget {
  const BannersCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomCarousel(
          banners: state.banners,
        );
      },
    );
  }
}
