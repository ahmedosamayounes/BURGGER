import 'package:json_annotation/json_annotation.dart';

part 'product_option_model.g.dart'; 

@JsonSerializable()
class ProductOptionModel {
  final int? code;
  final String? message;
  final List<OptionData>? data;

  ProductOptionModel({this.code, this.message, this.data});

  factory ProductOptionModel.fromJson(Map<String, dynamic> json) => 
      _$ProductOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionModelToJson(this);
}

@JsonSerializable()
class OptionData {
  final int? id;
  final String? name;
  final String? image;

  OptionData({this.id, this.name, this.image});

  factory OptionData.fromJson(Map<String, dynamic> json) => 
      _$OptionDataFromJson(json);

  Map<String, dynamic> toJson() => _$OptionDataToJson(this);
}