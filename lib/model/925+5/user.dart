import 'package:json_annotation/json_annotation.dart';
import 'package:serelization/model/user_model/address.dart';
import 'package:serelization/model/user_model/company.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  int id;
  String name;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({this.id,  this.name , this.email , this.address , this.phone , this.website , this.company});

  factory User.fromJson(Map<String , dynamic> json) => _$UserFromJson(json);

  Map<String , dynamic> toJson() => _$UserToJson(this);
}