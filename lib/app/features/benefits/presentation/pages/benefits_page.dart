part of 'pages.dart';

class BenefitsPage extends StatelessWidget {
  const BenefitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BenefitsCubit(
        getCategories: getIt<GetCategories>(),
        getBenefits: getIt<GetBenefits>(),
      )..getCategories(),
      child: BlocConsumer<BenefitsCubit, BenefitsState>(
        listener: (context, state) {
          if (state.status is BenefitsError) {
            AppUtils.showSnackbar(
              context,
              (state.status as BenefitsError).text,
            );
          }
        },
        builder: (context, state) {
          if (state.status is BenefitsSuccess) {
            return const _BenefitsContent();
          }
          if (state.status is BenefitsEmpty) {
            return const CustomEmpty();
          }
          return const CustomProgress();
        },
      ),
    );
  }
}

class _BenefitsContent extends StatelessWidget {
  const _BenefitsContent();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannersCarousel(),
          CategoriesList(),
          BenefitsList(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
