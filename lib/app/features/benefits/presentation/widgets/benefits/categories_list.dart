part of '../widgets.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<BenefitsCubit, BenefitsState>(
        builder: (context, state) {
          return SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.categories.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: state.categories[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
