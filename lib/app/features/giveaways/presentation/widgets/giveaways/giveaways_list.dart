part of '../widgets.dart';

class GiveawaysList extends StatelessWidget {
  const GiveawaysList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<GiveawaysCubit, GiveawaysState>(
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.giveaways.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemBuilder: (context, index) {
              return GiveawayItem(
                giveaway: state.giveaways[index],
              );
            },
          );
        },
      ),
    );
  }
}
