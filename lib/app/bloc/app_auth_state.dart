part of 'app_auth_bloc.dart';

enum TestStatus {
  authenticated,
  unauthenticated,
  loading,
}

@immutable
abstract class AppAuthState {
  const AppAuthState({
    required this.status,
    required this.user,
  });

  final TestStatus status;
  final UserModel user;
}

class TestInitial extends AppAuthState {
  const TestInitial({required TestStatus status, required UserModel user})
      : super(status: status, user: user);
}

class TestUnAuthenticated extends AppAuthState {
  const TestUnAuthenticated(
      {required TestStatus status, required UserModel user})
      : super(status: status, user: user);
}

class TestAuthenticated extends AppAuthState {
  const TestAuthenticated({required TestStatus status, required UserModel user})
      : super(status: status, user: user);
}
