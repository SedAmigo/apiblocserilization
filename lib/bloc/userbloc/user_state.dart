import 'package:equatable/equatable.dart';
import 'package:serelization/model/newmodel/userresponse.dart';

// import 'package:serelization/model/user_model/user_responce.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState with EquatableMixin {
  final UserResponse userResponce;
  UserLoaded(this.userResponce);

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [userResponce];
}

class UserError extends UserState with EquatableMixin {
  final String errorMessage;

  UserError({this.errorMessage});

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [errorMessage];
}
