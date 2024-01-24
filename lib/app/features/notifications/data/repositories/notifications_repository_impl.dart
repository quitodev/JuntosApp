part of 'repositories_impl.dart';

class NotificationsRepositoryImpl implements INotificationsRepository {
  NotificationsRepositoryImpl(this.giveawaysDatasource);

  final INotificationsDatasource giveawaysDatasource;

  @override
  Future<Either<Failure, List<Notification>>> getNotifications() async {
    try {
      return Right(
        await giveawaysDatasource.getNotifications(),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryNotifications,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryNotifications);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
