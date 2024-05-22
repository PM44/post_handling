abstract class PostEvent {}

class GetPosts extends PostEvent {
  GetPosts();
}

class GetPostsDetails extends PostEvent {
  final int id;
  GetPostsDetails(this.id);
}
