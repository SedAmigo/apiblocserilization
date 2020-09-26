import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serelization/bloc/userbloc/user_cubit.dart';
import 'package:serelization/bloc/userbloc/user_state.dart';
import 'package:serelization/model/newmodel/user.dart';
import 'package:serelization/model/newmodel/userresponse.dart';

// import 'package:serelization/model/user_model/user.dart';

class UserUi extends StatefulWidget {
  @override
  _UserUiState createState() => _UserUiState();
}

class _UserUiState extends State<UserUi> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Api'),
      ),
      body: BlocBuilder<UserCubit, UserState>(builder: (context, userState) {
        if (userState is UserInitial) {
          return buildInitialWidget();
        } else if (userState is UserLoading) {
          return buildLoadingWidget();
        } else if (userState is UserLoaded) {
          return buildLoadedWidget(userState.userResponce);
        } else if (userState is UserError) {
          return buildErrorWidget(userState.errorMessage);
        } else {
          return null;
        }
      }),
    );
  }
  Widget buildInitialWidget() {
    return Center(
        child: RaisedButton(onPressed: () {}, child: Text('Load Data')));
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  var dividerWidget = Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Divider(height: 1, thickness: 1, color: Colors.black38));

  Widget buildLoadedWidget(UserResponse users ){
    User user = users.results[0];
    return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 70,
        backgroundImage: NetworkImage(user.picture.large),
      ),
      Text(
        "${(user.name.first).toLowerCase()} ${(user.name.last).toUpperCase()}",
        style: Theme.of(context).textTheme.title,
      ),
      Text(user.email, style: Theme.of(context).textTheme.subtitle),
      Padding(
        padding: EdgeInsets.only(top: 5),
      ),
      Text(user.location.street.name, style: Theme.of(context).textTheme.body1),
      Padding(
        padding: EdgeInsets.only(top: 5),
      ),
      Text(user.location.city, style: Theme.of(context).textTheme.body1),
      Padding(
        padding: EdgeInsets.only(top: 5),
      ),
      Text(user.location.state, style: Theme.of(context).textTheme.body1),
    ],
  ));
  }

  

  Widget buildErrorWidget(String message) {
    return Center(child: Text(message));
  }
}
