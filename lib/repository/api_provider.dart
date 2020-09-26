import 'package:dio/dio.dart';
import 'package:serelization/model/newmodel/userresponse.dart';

//import 'package:serelization/model/user_model/user_responce.dart';

class APIRepository {
  Dio _dio = Dio();

  Future<UserResponse> getUser() async {
    try {
      Response responce =
          await _dio.get('https://randomuser.me/api/');
      print(responce);
      return UserResponse.fromJson(responce.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }
}
