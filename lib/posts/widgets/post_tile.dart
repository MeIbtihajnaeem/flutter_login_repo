import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_example/app/bloc/app_auth_bloc.dart';
import 'package:ms_example/theme.dart';
import 'package:option_repository/option_repository.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key, required this.post}) : super(key: key);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAuthBloc, AppAuthState>(
      builder: (context, state) {
        return Card(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title.toString(),
                style: state.user.id == post.userId
                    ? theme.textTheme.subtitle2
                    : theme.textTheme.subtitle1,
              ),
              heightSpace20,
              Text(
                post.body.toString(),
                style: state.user.id == post.userId
                    ? theme.textTheme.bodyText2
                    : theme.textTheme.bodyText1,
              ),
            ],
          ),
        ));
      },
    );
  }
}
