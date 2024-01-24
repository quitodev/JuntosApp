part of '../widgets.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BlocBuilder<BenefitsCubit, BenefitsState>(
        builder: (context, state) {
          final isSelected = state.categorySelected.id == category.id;
          return CustomButton(
            height: 40,
            text: category.name,
            textColor: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.primary,
            backgroundColor: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onPrimary,
            icon: AppSvg
                .restaurant, // TODO(me): Reemplazar por iconUrl: category.icon cuando solucionen íconos
            iconSize: 16,
            iconColor: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.primary,
            radius: 50,
            borderWidth: 0,
            onTap: () {
              context.read<BenefitsCubit>().selectCategory(category);
            },
          );
        },
      ),
    );
  }
}
