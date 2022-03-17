import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_example/app/bloc/app_auth_bloc.dart';

import '../../theme.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthBloc, AppAuthState>(
      builder: (context, state) {
        return ListView(
          children: [
            _getRow("Name", state.user.name.toString()),
            _getRow("Username", state.user.username.toString()),
            _getRow("Address", state.user.address.toString()),
            _getRow(
                "ZipCode",
                state.user.address != null
                    ? state.user.address!.zipcode.toString()
                    : ""),
          ],
        );
      },
    );
  }
}

Widget _getRow(String title, String value) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.subtitle1,
          ),
          Text(
            value,
            style: theme.textTheme.bodyText1,
          )
        ],
      ),
    ),
  );
}
