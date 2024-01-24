part of '../widgets.dart';

class PurchasesList extends StatelessWidget {
  const PurchasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<PurchasesCubit, PurchasesState>(
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.purchases.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 4,
              );
            },
            itemBuilder: (context, index) {
              return PurchaseItem(
                purchase: state.purchases[index],
              );
            },
          );
        },
      ),
    );
  }
}
