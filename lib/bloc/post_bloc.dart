import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_handling/api_client.dart';
import 'package:post_handling/bloc/post_event.dart';
import 'package:post_handling/bloc/post_state.dart';

import '../models/post_model.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> postList = <PostModel>[];
  PostModel? post;

  PostBloc() : super(PostLoading()) {
    on<GetPosts>(((event, emit) async {
      emit(PostLoading());
      try {
        final response = await APIClient.instance.request(
          'posts',
          DioMethod.get,
        );
        if (response.statusCode == 200) {
          postList.clear();
          Iterable<PostModel> list = List.from(
            response.data?.map(
                  (e) => PostModel.fromJson(e),
            ),
          );
          postList.addAll(list);
          emit(PostFetchedState(postList));
        } else {
          emit(PostErrorState(response.statusMessage??""));
        }
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    }));
    on<GetPostsDetails>(((event, emit) async {
      emit(PostLoading());
      try {
        final response = await APIClient.instance.request(
          'posts/${event.id}',
          DioMethod.get,
        );
        if (response.statusCode == 200) {
          post=PostModel.fromJson(response.data);
          emit(PostDetailsState(post));
        } else {
          emit(PostErrorState(response.statusMessage??""));
        }
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    }));
  }
}

