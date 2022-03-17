import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_example/posts/post.dart';

import '../../app/bloc/app_auth_bloc.dart';
import '../../theme.dart';
import '../widgets/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppAuthBloc>().add(TestStatusRequested());

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: Container(), // Populate the Drawer in the next step.
          ),
          appBar: AppBar(
            backgroundColor: theme.primaryColor,
            bottom: TabBar(
              indicatorColor: theme.backgroundColor,
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("All POSTS"),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("PROFILE"),
                ),
              ],
            ),
            title: const Text('Lorem Ipsum'),
          ),
          body: const TabBarView(
            children: [
              PostView(),
              ProfileWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
