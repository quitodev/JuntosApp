part of 'widgets.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    required this.banners,
    super.key,
  });

  final List<entity.Banner> banners;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentIndex = ValueNotifier(0);
    final controller = CarouselController();

    return SizedBox(
      height: (1.sw * 0.50) + 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              width: 1.sw,
              child: CarouselSlider(
                items: banners.map((banner) {
                  return CustomImageNetwork(
                    imageUrl: banner.logo,
                    width: 1.sw,
                    boxFit: BoxFit.cover,
                  );
                }).toList(),
                carouselController: controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    currentIndex.value = index;
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: banners.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => controller.animateToPage(entry.key),
                      child: Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colorScheme.primary.withOpacity(
                            value == entry.key ? 0.9 : 0.4,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
