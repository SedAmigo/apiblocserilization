import 'package:equatable/equatable.dart';
import 'package:serelization/model/post_model/post.dart';

abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {
  const PostInitial();
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostLoaded extends PostState with EquatableMixin {
  final List<Post> posts;
  PostLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostError extends PostState with EquatableMixin {
  final String errorMessage;

  PostError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
