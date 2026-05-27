import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_request_model.g.dart'; 

@JsonSerializable()
class ProfileRequestModel {
  final String? name;
  final String? email;
  final String? address;
  final String? image;
  final dynamic visa;
  final int? phone;

  ProfileRequestModel({
    this.name,
    this.email,
    this.address,
    this.image,
    this.visa,
    this.phone,
  });

  factory ProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRequestModelToJson(this);
}
