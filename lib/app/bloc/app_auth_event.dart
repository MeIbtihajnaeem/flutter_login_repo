part of 'app_auth_bloc.dart';

@immutable
abstract class AppAuthEvent {}

class TestStatusRequested extends AppAuthEvent {}

class TestLogoutRequested extends AppAuthEvent {}

class TestLoginRequested extends AppAuthEvent {}
