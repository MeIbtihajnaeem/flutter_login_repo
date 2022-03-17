import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ms_example/routes/router.gr.dart';

class AuthGuard extends AutoRedirectGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    UserModel? user = await AuthRepository().getCurrentUser();
    if (user != null) {
      resolver.next();
    } else {
      router.push(const LoginRoute());
    }
  }
}
