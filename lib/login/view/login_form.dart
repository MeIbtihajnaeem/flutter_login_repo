import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ms_example/app/bloc/app_auth_bloc.dart';
import 'package:ms_example/login/cubit/login_cubit.dart';
import 'package:ms_example/routes/router.gr.dart';

import '../../theme.dart';
import '../../utils/custom_snakbar.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            debugPrint("Status is " + state.errorMessage.toString());
            CustomSnakBar().showSnakBarError(
                context, state.errorMessage ?? "Authentication failed");
          }
          if (state.status.isSubmissionSuccess) {
            context.read<AppAuthBloc>().add(TestStatusRequested());
            AutoRouter.of(context).push(const HomeRoute());
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.jpeg",
                    height: 300,
                    width: 300,
                  ),
                  heightSpace20,
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.white,
                      border: Border.all(color: theme.primaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: theme.primaryColor,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              heightSpace20,
                              BlocBuilder<LoginCubit, LoginState>(
                                buildWhen: (previous, current) =>
                                    previous.email != current.email,
                                builder: (context, state) {
                                  return Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: secondayColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        // VerticalDivider(
                                        //   color: Colors.black.withOpacity(0.7),
                                        // ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: TextField(
                                              onChanged: (email) => context
                                                  .read<LoginCubit>()
                                                  .emailChanged(email),
                                              decoration: InputDecoration(
                                                errorText: state.email.invalid
                                                    ? "Invalid Email"
                                                    : null,
                                                counterText: "",
                                                border: InputBorder.none,
                                                hintText: "Email",
                                                hintStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 1),
                                                isDense: true,
                                              ),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              heightSpace20,
                              BlocBuilder<LoginCubit, LoginState>(
                                buildWhen: (previous, current) =>
                                    previous.password != current.password,
                                builder: (context, state) {
                                  return Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: secondayColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        // VerticalDivider(
                                        //   color: Colors.black.withOpacity(0.7),
                                        // ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: TextField(
                                              onChanged: (password) => context
                                                  .read<LoginCubit>()
                                                  .passwordChanged(password),
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                errorText:
                                                    state.password.invalid
                                                        ? "Invalid password"
                                                        : null,
                                                counterText: "",
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 1),
                                                isDense: true,
                                              ),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              heightSpace20,
                              heightSpace20,
                              BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () => state.status.isValidated
                                        ? context.read<LoginCubit>().submit()
                                        : () => {
                                              CustomSnakBar().showSnakBarError(
                                                  context,
                                                  "All Fields are required")
                                            },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      height: 60,
                                      child: Center(
                                        child: state
                                                .status.isSubmissionInProgress
                                            ? const CircularProgressIndicator()
                                            : const Text(
                                                "Login",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              heightSpace20,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
