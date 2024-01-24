part of '../widgets.dart';

class BenefitsList extends StatelessWidget {
  const BenefitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<BenefitsCubit, BenefitsState>(
        builder: (context, state) {
          final itemCount = state.benefitsFiltered.length;
          const itemsPerPage = 5;
          final totalPages = (itemCount / itemsPerPage).ceil();

          return Column(
            children: List.generate(totalPages, (pageIndex) {
              final startIndex = pageIndex * itemsPerPage;
              final endIndex = (startIndex + itemsPerPage) < itemCount
                  ? (startIndex + itemsPerPage)
                  : itemCount;

              final pageItems = List.generate(endIndex - startIndex, (index) {
                return BenefitItem(
                  benefit: state.benefitsFiltered[index],
                );
              });

              return SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: pageItems.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemBuilder: (context, index) {
                    return pageItems[index];
                  },
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
