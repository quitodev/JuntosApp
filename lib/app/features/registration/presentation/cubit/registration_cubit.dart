import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juntos_app/app/core/domain/entities/entities.dart';
import 'package:juntos_app/app/core/domain/usecases/usecases.dart';
import 'package:juntos_app/app/core/utils/utils.dart';
import 'package:juntos_app/app/features/registration/domain/usecases/usecases.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({
    required FindDocument findDocument,
    required GetDepartments getDepartments,
    required GetProvinces getProvinces,
    required GetInstitutions getInstitutions,
    required SignUp signUp,
  })  : _findDocument = findDocument,
        _getDepartments = getDepartments,
        _getProvinces = getProvinces,
        _getInstitutions = getInstitutions,
        _signUp = signUp,
        super(
          RegistrationState(
            status: RegistrationInitial(),
            account: Account.empty(),
            departments: List.empty(),
            provinces: List.empty(),
            institutions: List.empty(),
            showPassword: false,
            showRepeatedPassword: false,
          ),
        );

  final FindDocument _findDocument;
  final GetDepartments _getDepartments;
  final GetProvinces _getProvinces;
  final GetInstitutions _getInstitutions;
  final SignUp _signUp;

  void _showLoading() {
    emit(
      state.copyWith(
        status: RegistrationLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: RegistrationError(
          failure.message,
        ),
      ),
    );
    emit(
      state.copyWith(
        status: RegistrationInitial(),
      ),
    );
  }

  void writeTypeDocument(String value) {
    emit(
      state.copyWith(
        account: state.account.copyWith(
          typeDocument: value,
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

  Future<void> findDocument(String numberDocument) async {
    _showLoading();
    final either = await _findDocument.call(numberDocument);
    either.fold(
      (failure) => _showError(failure),
      (result) {
        emit(
          state.copyWith(
            status: RegistrationInitial(),
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
        getInstitutions();
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
            institutions: result,
          ),
        );
      },
    );
  }

  Future<void> signUp() async {
    _showLoading();
    final either = await _signUp.call(state.account);
    either.fold(
      (failure) => _showError(failure),
      (_) {
        emit(
          state.copyWith(
            status: RegistrationSuccess(),
          ),
        );
      },
    );
  }
}
