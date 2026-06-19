import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  final int? code;
  final String? message;
  final List<ProductData>? data;

  ProductsModel({this.code, this.message, this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@HiveType(typeId: 0)
@JsonSerializable()
class ProductData {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final String? rating;

  @HiveField(5)
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
