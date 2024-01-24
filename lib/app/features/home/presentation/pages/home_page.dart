part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NavigationBarCubit(),
        ),
        BlocProvider(
          create: (_) => HomeCubit(
            getUser: getIt<GetUser>(),
            getWinners: getIt<GetWinners>(),
            getBanners: getIt<GetBanners>(),
          )..getUser(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status is HomeError || state.status is HomeUserSuspended) {
            context.pushReplacementNamed(Routes.routeLogin.name);
          }
          if (state.status is HomeCompleteRegistration) {
            context.pushReplacementNamed(
              Routes.routeCompleteRegistration.name,
              extra: state.account,
            );
          }
          if (state.status is HomeUserWinner) {
            AppUtils.showOverlay(
              context,
              HomeWinnerImage(
                imageUrl: state.winner.banner,
                onTap: () {
                  context.read<HomeCubit>().closeWinner();
                },
              ),
            );
          }
          if (state.status is HomeInitial) {
            AppUtils.hideOverlay();
          }
        },
        builder: (context, state) {
          if (state.status is HomeLoading ||
              state.status is HomeCompleteRegistration) {
            return const CustomProgress();
          }
          return const _HomeContent();
        },
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const HomeAppBar(),
      drawer: const HomeDrawerMenu(),
      bottomNavigationBar: const HomeNavigationBar(),
      body: BlocBuilder<NavigationBarCubit, NavigationBarState>(
        builder: (context, state) {
          switch (state.index) {
            case 1:
              return const GiveawaysPage();
            case 2:
              return const BenefitsPage();
            case 3:
              return const NotificationsPage();
            case 4:
              return const RadioPage();
            default:
              return const BoardPage();
          }
        },
      ),
    );
  }
}
