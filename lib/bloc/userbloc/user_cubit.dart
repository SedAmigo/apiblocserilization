import 'package:bloc/bloc.dart';
import 'package:serelization/bloc/userbloc/user_state.dart';
import 'package:serelization/repository/api_provider.dart';

class UserCubit extends Cubit<UserState> {
  final APIRepository repository;

  UserCubit({this.repository})
      : assert(repository != null),
        super(UserInitial());

  getUser() async {
    emit(UserLoading());
    await repository
        .getUser()
        .then(
          (user) => emit(
            UserLoaded(user),
          ),
        )
        .catchError(
          () => emit(
            UserError(errorMessage: 'no Users'),
          ),
        );
  }
}
