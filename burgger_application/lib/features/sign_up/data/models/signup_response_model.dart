import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  final String? code;
  final String? message;
  final Data? data;

  SignupResponseModel({
    this.code,
    this.message,
    this.data,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  final String? token;
  final String? name;
  final String? email;
  final String? image;

  Data({
    this.token,
    this.name,
    this.email,
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => 
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}