part of 'pages.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocProvider(
      create: (_) => PurchasesCubit(
        getPurchases: getIt<GetPurchases>(),
      )..getPurchases(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.background,
        appBar: CustomAppBar(
          title: l10n.myPurchases,
        ),
        body: BlocConsumer<PurchasesCubit, PurchasesState>(
          listener: (context, state) {
            if (state.status is PurchasesError) {
              AppUtils.showSnackbar(
                context,
                (state.status as PurchasesError).text,
              );
            }
          },
          builder: (context, state) {
            if (state.status is PurchasesSuccess) {
              return const _PurchasesContent();
            }
            if (state.status is PurchasesEmpty) {
              return const CustomEmpty();
            }
            return const CustomProgress();
          },
        ),
      ),
    );
  }
}

class _PurchasesContent extends StatelessWidget {
  const _PurchasesContent();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          PurchasesList(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
