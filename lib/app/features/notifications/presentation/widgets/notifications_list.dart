part of 'widgets.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.notifications.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 4,
              );
            },
            itemBuilder: (context, index) {
              return NotificationItem(
                notification: state.notifications[index],
              );
            },
          );
        },
      ),
    );
  }
}
