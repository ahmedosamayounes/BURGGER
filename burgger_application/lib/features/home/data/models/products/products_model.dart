import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  final int? code;
  final String? message;
  final List<ProductData>? data;

  ProductsModel({
    this.code,
    this.message,
    this.data,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class ProductData {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final String? rating;
  final String? price;

  ProductData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.price,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}