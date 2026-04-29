import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  String? image;


  SignupRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}
