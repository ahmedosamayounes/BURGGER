import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class AddCartResponseModel {
  final int? code;
  final String? message;
  final dynamic data; 


  AddCartResponseModel({this.code, this.message, this.data});

  factory AddCartResponseModel.fromJson(Map<String, dynamic> json) => 
      _$AddCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartResponseModelToJson(this);
}