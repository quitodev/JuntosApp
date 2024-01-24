part of 'pages.dart';

class BenefitDetailPage extends StatelessWidget {
  const BenefitDetailPage({
    required this.benefit,
    super.key,
  });

  final Benefit benefit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocProvider(
      create: (_) => BenefitDetailCubit(
        benefitUsed: getIt<BenefitUsed>(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.background,
        appBar: CustomAppBar(
          title: l10n.benefitsNav,
        ),
        body: BlocConsumer<BenefitDetailCubit, BenefitDetailState>(
          listener: (context, state) {
            if (state.status is BenefitDetailSuccess) {
              context.pushReplacementNamed(
                Routes.routeAnimation.name,
                extra: {
                  'benefit': benefit,
                },
              );
            }
            if (state.status is BenefitDetailError) {
              AppUtils.showSnackbar(
                context,
                (state.status as BenefitDetailError).text,
              );
            }
          },
          builder: (context, state) {
            if (state.status is BenefitDetailInitial) {
              return _BenefitDetailContent(
                benefit: benefit,
              );
            }
            return const CustomProgress();
          },
        ),
        bottomSheet: BlocBuilder<BenefitDetailCubit, BenefitDetailState>(
          builder: (context, state) {
            return CustomBottomSheet(
              text: l10n.orderNow,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: theme.colorScheme.onPrimary,
                  builder: (_) {
                    return BenefitModal(
                      benefit: benefit,
                      onTap: () {
                        context
                            .read<BenefitDetailCubit>()
                            .benefitUsed(benefit.id);
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _BenefitDetailContent extends StatelessWidget {
  const _BenefitDetailContent({
    required this.benefit,
  });

  final Benefit benefit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BenefitImage(
            benefit: benefit,
          ),
          BenefitTitle(
            benefit: benefit,
          ),
          BenefitDescription(
            benefit: benefit,
          ),
          const SizedBox(
            height: 96,
          ),
        ],
      ),
    );
  }
}
