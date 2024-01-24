import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/domain/entities/entities.dart';
import 'package:juntos_app/app/core/domain/usecases/usecases.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/profile/domain/usecases/usecases.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required GetUser getUser,
    required FindDocument findDocument,
    required GetDepartments getDepartments,
    required GetProvinces getProvinces,
    required GetInstitutions getInstitutions,
    required UploadAvatar uploadAvatar,
    required UpdateUser updateUser,
  })  : _getUser = getUser,
        _findDocument = findDocument,
        _getDepartments = getDepartments,
        _getProvinces = getProvinces,
        _getInstitutions = getInstitutions,
        _uploadAvatar = uploadAvatar,
        _updateUser = updateUser,
        super(
          ProfileState(
            status: ProfileLoading(),
            account: Account.empty(),
            avatar: Avatar.empty(),
            departments: List.empty(),
            provinces: List.empty(),
            institutions: List.empty(),
            showPassword: false,
            showRepeatedPassword: false,
          ),
        );

  final GetUser _getUser;
  final FindDocument _findDocument;
  final GetDepartments _getDepartments;
  final GetProvinces _getProvinces;
  final GetInstitutions _getInstitutions;
  final UploadAvatar _uploadAvatar;
  final UpdateUser _updateUser;

  void _showLoading() {
    emit(
      state.copyWith(
        status: ProfileLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: ProfileError(
          failure.message,
        ),
      ),
    );
  }

  void writeNumberDocument(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          numberDocument: value,
        ),
      ),
    );
  }

  void writeFullName(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          fullName: value,
        ),
      ),
    );
  }

  void writeFirstName(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          firstName: value,
        ),
      ),
    );
  }

  void writeLastName(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          lastName: value,
        ),
      ),
    );
  }

  void writeAddress(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          address: value,
        ),
      ),
    );
  }

  void writeDepartment(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          department: value,
          province: '',
          district: '',
        ),
      ),
    );
    getProvinces();
  }

  void writeProvince(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          province: value,
          district: '',
        ),
      ),
    );
  }

  void writeDistrict(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          district: value,
        ),
      ),
    );
  }

  void writePhoneNumber(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          phoneNumber: value,
        ),
      ),
    );
  }

  void writeEmail(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          email: value,
        ),
      ),
    );
  }

  void writePassword(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          password: value,
        ),
      ),
    );
  }

  void showPassword(bool value) {
    emit(
      state.copyWith(
        showPassword: value,
      ),
    );
  }

  void showRepeatedPassword(bool value) {
    emit(
      state.copyWith(
        showRepeatedPassword: value,
      ),
    );
  }

  void writeInstitution(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          institutionId: value,
        ),
      ),
    );
  }

  Future<void> getUser() async {
    _showLoading();
    final either = await _getUser.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            account: result,
          ),
        );
        getDepartments();
      },
    );
  }

  Future<void> findDocument(String numberDocument) async {
    _showLoading();
    final either = await _findDocument.call(numberDocument);
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: ProfileInitial(),
            account: state.account.copyWith(
              numberDocument: numberDocument,
              fullName: result.names,
              firstName: result.firstName,
              lastName: result.lastName,
              address:
                  result.address.isEmpty ? result.fullAddress : result.address,
              district: result.ubigeo[0],
              province: result.ubigeo[1],
              department: result.ubigeo[2],
            ),
          ),
        );
      },
    );
  }

  Future<void> getDepartments() async {
    final either = await _getDepartments.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            departments: result,
          ),
        );
        getProvinces();
      },
    );
  }

  Future<void> getProvinces() async {
    final either = await _getProvinces.call(state.account.department);
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            provinces: result,
          ),
        );
        getInstitutions();
      },
    );
  }

  Future<void> getInstitutions() async {
    final either = await _getInstitutions.call();
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: ProfileInitial(),
            institutions: result,
          ),
        );
      },
    );
  }

  Future<void> uploadAvatar(File value) async {
    _showLoading();
    emit(
      state.copyWith(
        avatar: state.avatar.copyWith(
          avatar: value,
          filename: state.account.numberDocument,
        ),
      ),
    );
    final either = await _uploadAvatar.call(state.avatar);
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: ProfileSuccess(),
            account: state.account.copyWith(
              avatar: result,
            ),
          ),
        );
      },
    );
  }

  Future<void> updateUser() async {
    _showLoading();
    final either = await _updateUser.call(state.account);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: ProfileSuccess(),
          ),
        );
      },
    );
  }
}
