// import 'package:serelization/model/user_model/user.dart';
// import 'package:serelization/model/user_model/users.dart';

// import 'dart:convert';
// import 'netvoer.dart';

// const String userApiUrl = 'https://jsonplaceholder.typicode.com/users';

// class UserApi {
//   // Future<List<User>> getUser() async {
//   //   Network network = Network(url: userApiUrl);
//   //   var userData = await network.getData();
//   //   final uData = json.decode(userData);
//   //   List<User> users = Users.fromJson(uData).users;
//   //   return users;
//   Future<List<Users>> getUser() async {
//     Network network = Network(url: userApiUrl);
//     var postData = await network.getData();
//     List data = json.decode(postData);
//     return data.map((e) => Users.fromJson(e)).toList();
//   }
// }
