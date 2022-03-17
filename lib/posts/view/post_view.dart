import 'package:flutter/material.dart';
import 'package:ms_example/posts/widgets/post_tile.dart';
import 'package:option_repository/option_repository.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PostRepository().getAllPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            List<PostModel> _allPost = snapshot.data;

            return ListView.builder(
                itemCount: _allPost.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  PostModel post = _allPost[index];
                  return PostTile(post: post);
                });
          }
        });
  }
}
