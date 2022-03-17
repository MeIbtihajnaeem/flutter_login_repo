import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_example/app/bloc/app_auth_bloc.dart';
import 'package:ms_example/login/cubit/login_cubit.dart';

import '../../login/view/login_form.dart';
import '../../theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppAuthBloc(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
        ],
        child: const LoginForm(),
      ),
    );
  }
}
