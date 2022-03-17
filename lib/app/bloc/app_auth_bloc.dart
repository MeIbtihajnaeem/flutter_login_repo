import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_auth_event.dart';
part 'app_auth_state.dart';

class AppAuthBloc extends Bloc<AppAuthEvent, AppAuthState> {
  AppAuthBloc()
      : super(const TestInitial(
            status: TestStatus.unauthenticated, user: UserModel.empty)) {
    on<TestStatusRequested>(_test);
    on<TestLogoutRequested>(_onLogoutRequested);
  }

  final AuthRepository _authRepository = AuthRepository();

  FutureOr<void> _test(
      TestStatusRequested event, Emitter<AppAuthState> emit) async {
    UserModel? user = await _authRepository.getCurrentUser();
    if (user == null) {
      emit(const TestUnAuthenticated(
          user: UserModel.empty, status: TestStatus.unauthenticated));
    }
    if (user != null) {
      emit(TestAuthenticated(status: TestStatus.authenticated, user: user));
    }
  }

  Future<FutureOr<void>> _onLogoutRequested(
      TestLogoutRequested event, Emitter<AppAuthState> emit) async {
    emit(const TestAuthenticated(
        status: TestStatus.unauthenticated, user: UserModel.empty));
    emit(const TestUnAuthenticated(
        status: TestStatus.unauthenticated, user: UserModel.empty));
    await _authRepository.logout();
  }
}
