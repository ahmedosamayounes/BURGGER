import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart'; 

@JsonSerializable()
class ProfileResponseModel {
  final int? code;
  final String? message;
  final ProfileData? data;

  ProfileResponseModel({this.code, this.message, this.data});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => 
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class ProfileData {
  final String? name;
  final String? email;
  final String? address;
  final String? image;
  
 
  @JsonKey(name: 'Visa')
  final dynamic visa;

  ProfileData({
    this.name, 
    this.email, 
    this.address, 
    this.image, 
    this.visa,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => 
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}