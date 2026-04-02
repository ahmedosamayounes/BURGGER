import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_reqeust_model.g.dart';

@JsonSerializable()
class LoginReqeustModel {
  String email;
  String password;

  LoginReqeustModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginReqeustModelToJson(this);
}
