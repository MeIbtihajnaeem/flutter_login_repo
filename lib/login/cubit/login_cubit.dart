import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final AuthRepository _authRepository = AuthRepository();

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(email: email, status: Formz.validate([email])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
        state.copyWith(password: password, status: Formz.validate([password])));
  }

  Future<void> submit() async {
    if (state.status.isInvalid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authRepository.login(state.email.value, state.password.value);

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: e.toString(), status: FormzStatus.submissionFailure));
    }
  }
}
