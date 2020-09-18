import 'package:bloc/bloc.dart';
import 'package:serelization/api/post_api.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostApi networkService;

  PostCubit({this.networkService}) : super(PostInitial());

  Future<void> clear() async {
    emit(PostInitial());
  }

  Future<void> getPost() async {
    emit(PostLoading());
    await networkService.getPost().then((posts) {
      emit(PostLoaded(posts));
    }).catchError(() {
      emit(PostError(errorMessage: "Some error"));
    });
  }
}
