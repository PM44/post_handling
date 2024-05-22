import 'package:post_handling/models/post_model.dart';

abstract class PostState {}

class PostLoading extends PostState {
  PostLoading();
}

class PostFetchedState extends PostState {
  final List<PostModel> postList;

  PostFetchedState(this.postList);
}

class PostErrorState extends PostState {
  final String error;

  PostErrorState(this.error);
}

class PostDetailsState extends PostState {
  final PostModel? post;
  PostDetailsState(this.post);
}
