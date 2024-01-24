part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.status,
    required this.account,
    required this.avatar,
    required this.departments,
    required this.provinces,
    required this.institutions,
    required this.showPassword,
    required this.showRepeatedPassword,
  });

  final ProfileStatus status;
  final Account account;
  final Avatar avatar;
  final List<Department> departments;
  final List<Province> provinces;
  final List<Institution> institutions;
  final bool showPassword;
  final bool showRepeatedPassword;

  ProfileState copyWith({
    ProfileStatus? status,
    Account? account,
    Avatar? avatar,
    List<Department>? departments,
    List<Province>? provinces,
    List<Institution>? institutions,
    bool? showPassword,
    bool? showRepeatedPassword,
  }) {
    return ProfileState(
      status: status ?? this.status,
      account: account ?? this.account,
      avatar: avatar ?? this.avatar,
      departments: departments ?? this.departments,
      provinces: provinces ?? this.provinces,
      institutions: institutions ?? this.institutions,
      showPassword: showPassword ?? this.showPassword,
      showRepeatedPassword: showRepeatedPassword ?? this.showRepeatedPassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        account,
        avatar,
        departments,
        provinces,
        institutions,
        showPassword,
        showRepeatedPassword,
      ];
}

abstract class ProfileStatus {}

class ProfileInitial extends ProfileStatus {}

class ProfileLoading extends ProfileStatus {}

class ProfileSuccess extends ProfileStatus {}

class ProfileError extends ProfileStatus {
  ProfileError(this.text);

  final String text;
}
