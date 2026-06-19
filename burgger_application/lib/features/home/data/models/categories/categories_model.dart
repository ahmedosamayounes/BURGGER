import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  final int? code;
  final String? message;
  final List<CategoryData>? data;

  CategoriesModel({
    this.code, 
    this.message, 
    this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => 
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}

@JsonSerializable()
class CategoryData {
  final int? id;
  final String? name;

  CategoryData({
    this.id, 
    this.name,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => 
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}