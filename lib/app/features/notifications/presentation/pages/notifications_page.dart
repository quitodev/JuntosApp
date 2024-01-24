part of 'pages.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationsCubit(
        getNotifications: getIt<GetNotifications>(),
      )..getNotifications(),
      child: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {
          if (state.status is NotificationsError) {
            AppUtils.showSnackbar(
              context,
              (state.status as NotificationsError).text,
            );
          }
        },
        builder: (context, state) {
          if (state.status is NotificationsSuccess) {
            return const _NotificationsContent();
          }
          if (state.status is NotificationsEmpty) {
            return const CustomEmpty();
          }
          return const CustomProgress();
        },
      ),
    );
  }
}

class _NotificationsContent extends StatelessWidget {
  const _NotificationsContent();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          NotificationsList(),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
