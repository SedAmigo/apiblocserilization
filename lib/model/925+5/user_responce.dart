import 'package:json_annotation/json_annotation.dart';
import 'package:serelization/model/user_model/user.dart';
part 'user_responce.g.dart';

@JsonSerializable()
class UserResponce{
  List<User> users;
  final String error;
  
  UserResponce({this.users , this.error});

  factory UserResponce.fromJson(Map<String , dynamic> json) => _$UserResponceFromJson(json);

  Map<String , dynamic> toJson() =>_$UserResponceToJson(this);

  UserResponce.withError(String errorValue) : error = errorValue;
}