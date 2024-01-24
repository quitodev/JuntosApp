part of 'pages.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RadioCubit(
        getRadio: getIt<GetRadio>(),
      )..getRadio(),
      child: BlocConsumer<RadioCubit, RadioState>(
        listener: (context, state) {
          if (state.status is RadioError) {
            AppUtils.showSnackbar(
              context,
              (state.status as RadioError).text,
            );
          }
        },
        builder: (context, state) {
          if (state.status is RadioSuccess) {
            return const _RadioContent();
          }
          return const CustomProgress();
        },
      ),
    );
  }
}

class _RadioContent extends StatelessWidget {
  const _RadioContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BannersCarousel(),
        RadioImage(),
      ],
    );
  }
}
