import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_handling/bloc/post_bloc.dart';
import 'package:post_handling/bloc/post_event.dart';
import 'package:post_handling/bloc/post_state.dart';
import 'package:post_handling/screen/post_card.dart';
import 'package:post_handling/screen/post_details.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  _PostList createState() => _PostList();
}

class _PostList extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
        listener: (BuildContext context, PostState? state) {
      if (state is PostDetailsState) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PostDetails(
                  title: state.post?.title ?? '',
                  subTitle: state.post?.body ?? '',
                )));
      }
    }, builder: (BuildContext context, PostState state) {
      return Scaffold(
          body: state is PostDetailsState || state is PostFetchedState
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: context.read<PostBloc>().postList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<PostBloc>().add(
                              GetPostsDetails(context.read<PostBloc>().postList[index].id ?? 1));
                        },
                        child: PostCard(
                          title: context.read<PostBloc>().postList[index].title ?? '',
                          subTitle: context.read<PostBloc>().postList[index].body ?? '',
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }
}
