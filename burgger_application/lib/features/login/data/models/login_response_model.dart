
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel {
  int? code;
  String? message;
  Data? data;

  LoginResponseModel({this.code, this.message, this.data});

 factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

}
@JsonSerializable()
class Data {
  String? token;
  String? name;
  String? email;
  String? image;

  Data({this.token, this.name, this.email, this.image});

 factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}